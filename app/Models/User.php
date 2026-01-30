<?php

namespace App\Models;

use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * Атрибуты, доступные для массового присвоения.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'telegram_id',
        'telegram_username',
        'telegram_verification_code',
        'telegram_verified_at',
    ];

    /**
     * Атрибуты, скрытые при сериализации.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
        'telegram_verification_code',
    ];

    /**
     * Кастинг атрибутов.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
            'telegram_verified_at' => 'datetime',
        ];
    }

    /**
     * Проверяет, подтверждён ли пользователь через Telegram.
     *
     * @return bool
     */
    public function isTelegramVerified(): bool
    {
        return ! is_null($this->telegram_verified_at);
    }


        /**
     * Отмечает пользователя как верифицированного через Telegram.
     *
     * @return bool
     */
    public function markTelegramAsVerified(): bool
    {
        return $this->update([
            'telegram_verified_at' => now(),
            'telegram_verification_code' => null,
        ]);
    }
}
