<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\RegisteredUserController;
use App\Http\Controllers\Auth\AuthenticatedSessionController;

// Публичные маршруты
Route::post('/register', [RegisteredUserController::class, 'store']);
Route::post('/login', [AuthenticatedSessionController::class, 'store']);
Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])
    ->middleware('auth:sanctum');

// Защищённые маршруты (требуют авторизации и Telegram-верификации)
Route::middleware(['auth:sanctum', 'ensure.telegram.verified'])->group(function () {
    Route::get('/test-verification', function () {
        return response()->json(['message' => 'Доступ разрешён: Telegram подтверждён!']);
    });
});

Route::get('/test-cors', function () {
    return response()->json(['message' => 'CORS работает!']);
});