<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class EnsureTelegramVerified
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        if (! $request->user()) {
            return response()->json(['message' => 'Unauthenticated.'], 401);
        }

        if (! $request->user()->isTelegramVerified()) {
            return response()->json([
                'message' => 'Telegram account not verified.',
                'telegram_verification_code' => $request->user()->telegram_verification_code,
            ], 403);
        }

        return $next($request);
    }
}