<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/21-8-2023/data1.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$lead_ids = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $lead_ids[] = $data[0];

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}


//$users = ["QUAN_NMQ"]; // Danh sách users

$users = ["869b1328-a0a6-f404-bd6e-63f4474b1137"];


$userCount = count($users);
$dataCount = count($lead_ids);

for ($i = 0; $i < $dataCount; $i++) {

    $userIndex = $i % $userCount; // Xác định vị trí user tương ứng với data hiện tại
    $user = $users[$userIndex];

    $lead_id = $lead_ids[$i];
    $query = "UPDATE leads SET lead_status_follow_level = '18' WHERE id = '{$lead_id}'";
    $GLOBALS['db']->query($query);
    echo "$lead_id\n";
}


