<?php

declare(strict_types=1);

namespace App\MoonShine\Resources\SupportTicket;

use App\MoonShine\Resources\SupportTicket\Pages\SupportTicketDetailPage;
use App\MoonShine\Resources\SupportTicket\Pages\SupportTicketFormPage;
use App\MoonShine\Resources\SupportTicketMessage\SupportTicketMessageResource;
use App\Models\SupportTicket;
use MoonShine\Contracts\Core\PageContract;
use MoonShine\Crud\JsonResponse;
use MoonShine\Laravel\Fields\Relationships\HasMany;
use MoonShine\Laravel\Pages\Crud\IndexPage;
use MoonShine\Laravel\Resources\ModelResource;
use MoonShine\Support\Enums\Action;
use MoonShine\UI\Fields\Date;
use MoonShine\UI\Fields\ID;
use MoonShine\UI\Fields\Select;
use MoonShine\UI\Fields\Text;
use MoonShine\UI\Fields\Textarea;

class SupportTicketResource extends ModelResource
{
    protected string $model = SupportTicket::class;

    protected string $title = 'Техподдержка';

    protected string $column = 'subject';

    protected array $with = ['user', 'messages'];

    /**
     * @return list<class-string<PageContract>>
     */
    protected function pages(): array
    {
        return [
            IndexPage::class,
            SupportTicketFormPage::class,
            SupportTicketDetailPage::class,
        ];
    }

    public function messagesHistory(): \MoonShine\UI\Components\FlexibleRender
{
    return \MoonShine\UI\Components\FlexibleRender::make(function () {
        $ticket = $this->getItem();

        if (!$ticket instanceof SupportTicket) {
            return '<div class="text-sm text-slate-500">Тикет не найден.</div>';
        }

        $messages = $ticket->messages()
            ->orderBy('created_at', 'asc')
            ->orderBy('id', 'asc')
            ->get();

        if ($messages->isEmpty()) {
            return '<div class="text-sm text-slate-500">Сообщений пока нет.</div>';
        }

        $html = '<div class="table-container"><div class="table-responsive">';
        $html .= '<table class="table table-list">';
        $html .= '<thead><tr>';
        $html .= '<th>ID</th>';
        $html .= '<th>Имя</th>';
        $html .= '<th>Отправитель</th>';
        $html .= '<th>Сообщение</th>';
        $html .= '<th>Создано</th>';
        $html .= '</tr></thead><tbody>';

        foreach ($messages as $message) {
            $senderType = match ($message->sender_type) {
                'admin' => 'Администратор',
                'system' => 'Система',
                default => 'Пользователь',
            };
            $createdAt = $message->created_at?->format('d.m.Y H:i') ?? '';
            $body = e($message->body);
            $senderName = e($message->sender_name ?? '');

            $html .= "<tr>";
            $html .= "<td>{$message->id}</td>";
            $html .= "<td>{$senderName}</td>";
            $html .= "<td>{$senderType}</td>";
            $html .= "<td><div class='text-ellipsis'>{$body}</div></td>";
            $html .= "<td>{$createdAt}</td>";
            $html .= "</tr>";
        }

        $html .= '</tbody></table></div></div>';

        return $html;
    });
}

    private function replyField(): Textarea
    {
        return Textarea::make('Ваш ответ', 'admin_response')
            ->required()
            ->changeFill(static fn (mixed $raw, Textarea $field): string => '')
            ->customAttributes([
                'rows' => 6,
                'placeholder' => 'Введите ответ администратора...',
            ]);
    }

    protected function indexFields(): iterable
    {
        return [
            ID::make()->sortable(),
            Text::make('Тема', 'subject'),
            Text::make('Email', 'user_email'),
            Date::make('Создан', 'created_at'),
        ];
    }

    protected function fields(): iterable
    {
        return [
            $this->replyField(),
        ];
    }

    protected function formFields(): iterable
    {
        return [
            $this->replyField(),
        ];
    }

    protected function detailFields(): iterable
    {
        return [
            ID::make(),
            Text::make('Тема', 'subject'),
            Text::make('Email', 'user_email'),
            Select::make('Категория', 'category')->options(SupportTicket::CATEGORIES),
            Select::make('Статус', 'status')->options(SupportTicket::STATUSES),
            Text::make('URL', 'current_url'),
            Text::make('Браузер', 'browser'),
            Textarea::make('Первое сообщение', 'message'),
            Date::make('Создан', 'created_at')->withTime()->sortable(),
            Date::make('Последний ответ админа', 'last_admin_replied_at')->withTime()->nullable(),
        ];
    }

    protected function rules(mixed $item): array
    {
        return [
            'admin_response' => ['required', 'string', 'max:5000'],
        ];
    }

    public function modifySaveResponse(JsonResponse $response): JsonResponse
    {
        return $response->redirect(
            $this->getFormPageUrl($this->getCastedData()?->getKey())
        );
    }
}
