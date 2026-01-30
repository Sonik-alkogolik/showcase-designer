<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            // Удаляем уникальный индекс перед изменением
            $table->dropUnique('users_telegram_id_unique');
            
            // Изменяем типы полей
            $table->bigInteger('telegram_id')->nullable()->change();
            $table->string('telegram_verification_code', 6)->nullable()->change();
            
            // Восстанавливаем уникальный индекс
            $table->unique('telegram_id', 'users_telegram_id_unique');
        });
    }

    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropUnique('users_telegram_id_unique');
            $table->string('telegram_id')->nullable()->change();
            $table->string('telegram_verification_code')->nullable()->change();
            $table->unique('telegram_id', 'users_telegram_id_unique');
        });
    }
};