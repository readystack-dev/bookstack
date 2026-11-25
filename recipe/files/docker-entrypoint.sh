#!/bin/sh
set -e
cd /app
# A stable 32-byte APP_KEY is REQUIRED (Laravel encryption). It is NOT baked into
# the image: the operator must supply one (generate with `php artisan key:generate --show`).
: "${APP_KEY:?APP_KEY must be set -- generate with 'php artisan key:generate --show'}"
# The external DB sidecar/instance is waited healthy by the orchestrator before this runs.
# Create + migrate the schema in the customer's MySQL/MariaDB (idempotent).
php artisan migrate --force --no-interaction
# The migration creates BookStack's default administrator, admin@admin.com with the password "password" --
# a known login on every install nobody configured. While that account still has the default password,
# replace it (BookStack's own `bookstack:create-admin --initial`): BOOKSTACK_ADMIN_PASSWORD if set, otherwise
# a random password written ONLY to /app/storage/initial_admin_password (mode 600). An administrator whose
# password was already changed is never touched.
if php /usr/local/bin/readystack-default-admin.php; then
  PW="${BOOKSTACK_ADMIN_PASSWORD:-}"
  if [ -z "$PW" ]; then
    PW="$(head -c 24 /dev/urandom | base64 | tr -dc 'A-Za-z0-9' | cut -c1-24)"
    ( umask 077; printf '%s\n' "$PW" > /app/storage/initial_admin_password )
    echo "bookstack: replaced the default admin password; the new one is in /app/storage/initial_admin_password"
  fi
  if [ "${#PW}" -lt 8 ]; then
    echo "bookstack: BOOKSTACK_ADMIN_PASSWORD must be at least 8 characters (BookStack's own minimum)" >&2; exit 1
  fi
  # create-admin prints its validation errors on stdout: keep them, and fail loudly (a short password used to
  # stop the first start with exit 1 and no message)
  if ! OUT="$(php artisan bookstack:create-admin --initial --email="${BOOKSTACK_ADMIN_EMAIL:-admin@admin.com}" \
      --name="${BOOKSTACK_ADMIN_NAME:-Admin}" --password="$PW" --no-interaction 2>&1)"; then
    echo "bookstack: creating the administrator failed:" >&2; printf '%s\n' "$OUT" >&2; exit 1
  fi
  unset PW
fi
php artisan cache:clear || true
php artisan view:clear || true
exec apache2-foreground
