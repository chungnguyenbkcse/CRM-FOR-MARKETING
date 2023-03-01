<?php
// Load thư viện
require_once 'vendor/autoload.php';
ini_set("allow_url_fopen", true);

// Cấu hình webhook
$bot_api_key  = '6173643097:AAFUsQUZJfbs8lFL_fzmEmhRoBptAl8IEI0';
$bot_username = 'ChungNguyen10012000_bot';
$hook_url     = 'https://mkt.tranthu.vn/index.php?module=Leads&entryPoint=handle_telegram';

try {
    //echo "Success";
    $telegram = new \TelegramBot\Api\BotApi($bot_api_key);
    $telegram->setWebhook($hook_url);
} catch (\TelegramBot\Api\Exception $e) {
    //echo $e->getMessage($hook_url);
}


// Xử lý tin nhắn
$update = json_decode(file_get_contents('php://input'));
$message = isset($update['message']) ? $update['message'] : null;

var_dump($update);

if ($message !== null) {
    //lấy thông tin về tin nhắn
    $message = isset($update['message']) ? $update['message'] : "";
    $messageId = isset($message['message_id']) ? $message['message_id'] : "";
    $chatId = isset($message['chat']['id']) ? $message['chat']['id'] : "";
    $firstName = isset($message['chat']['first_name']) ? $message['chat']['first_name'] : "";
    $lastName = isset($message['chat']['last_name']) ? $message['chat']['last_name'] : "";
    $username = isset($message['chat']['username']) ? $message['chat']['username'] : "";
    $date = isset($message['date']) ? $message['date'] : "";
    $text = isset($message['text']) ? $message['text'] : "";

    echo "123";

    // Xử lý tin nhắn ở đây
    $telegram->sendMessage($chatId, 'Bạn vừa gửi tin nhắn: ' . $text);
    //echo $text;
}