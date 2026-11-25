<?php
// Exit 0 while BookStack's default administrator (admin@admin.com, created by the users-table migration with
// bcrypt('password')) still has that default password; exit 1 otherwise. Used by the ReadyStack entrypoint.
require '/app/vendor/autoload.php';
$app = require '/app/bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();
$u = BookStack\Users\Models\User::query()->where('email', 'admin@admin.com')->first();
exit(($u && Illuminate\Support\Facades\Hash::check('password', (string) $u->password)) ? 0 : 1);
