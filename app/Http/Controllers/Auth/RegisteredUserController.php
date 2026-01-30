<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\Support\Str;

class RegisteredUserController extends Controller
{
    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {
        // Валидация данных
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255', 'unique:users,email'],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ]);

        // Создание пользователя
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->input('password')),
        ]);

        // Генерация кода для Telegram
        $user->telegram_verification_code = Str::random(6); // 6 символов
        $user->save();

        // Событие регистрации
        event(new Registered($user));

        // Логиним пользователя
        Auth::login($user);

        // Возврат данных и telegram_verification_code во фронтенд
        return response()->json([
            'user' => $user,
            'telegram_verification_code' => $user->telegram_verification_code,
        ], 201);
    }
}
