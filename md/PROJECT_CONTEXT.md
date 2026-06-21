# Showcase Designer — Контекст проекта

## 📦 Стек технологий
- **Backend:** Laravel 12.47.0 (PHP 8.2.18)
- **Frontend:** Vue 3
- **Админка:** Moonshine 4.8.0
- **БД:** MySQL 8.0 (24 таблицы)
- **Локальный сервер:** OSPanel (C:\OSPanel)
- **Интеграции:** Telegram Bot SDK, YooKassa SDK, Maatwebsite Excel

## 🗂 Структура БД (24 таблицы)
cache, cache_locks, categories, category_product, email_verification_tokens,
failed_jobs, import_runs, job_batches, jobs, migrations, moonshine_user_roles,
moonshine_users, orders, password_reset_tokens, personal_access_tokens,
products, sessions, shops, subscription_payments, subscriptions,
support_ticket_messages, support_tickets, telegram_password_reset_tokens, users

## 💻 Локальная разработка

### Пути
- Проект: C:\Users\Дмитрий\Desktop\showcase-designer
- PHP 8.2: C:\OSPanel\modules\PHP-8.2\PHP\php.exe
- MySQL 8.0: C:\OSPanel\modules\MySQL-8.0\bin\mysql.exe
- Composer: C:\OSPanel\modules\PHP-8.2\PHP\composer.bat
- COMPOSER_HOME: C:\OSPanel\data\PHP-8.2\default\composer

### Настройка PowerShell (выполнять в начале каждой сессии)
``````powershell
`$env:PATH = "C:\OSPanel\modules\PHP-8.2\PHP;`$env:PATH"
`$env:COMPOSER_HOME = "C:\OSPanel\data\PHP-8.2\default\composer"



Запуск проекта
powershell
123
MySQL подключение (локально)
Host: 127.127.126.26
Port: 3306
User: root
Password: (пустой)
Database: showcase_designer
🌐 Production
Домен: e-tgo.ru (ранее ec-dn.ru)
SSH: root@e-tgo.ru (сервер ruvds-1qcaj)
БД: MySQL 8.0.46, база showcase_designer
phpMyAdmin: https://e-tgo.ru/phpmyadmin
Полезные команды на production
bash
1234567891011
🔐 Git
Ветка: main
.env в .gitignore (секреты не коммитятся)
Дамп showcase_designer.sql НЕ в gitignore (можно коммитить)
📝 Правила работы
Перед любой задачей — читать этот файл
.env никогда не коммитить
Перед серьёзными изменениями — делать дамп БД
После изменений — проверять через php artisan serve
"@ | Out-File -FilePath PROJECT_CONTEXT.md -Encoding utf8