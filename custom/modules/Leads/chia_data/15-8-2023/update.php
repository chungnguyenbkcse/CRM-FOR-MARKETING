<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/15-8-2023/chuyen_code_15_8.csv';

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


//$users = ["THUY_NHT"]; // Danh sách users

$users = ["288bf2f5-4af3-67db-879e-64a80f053f02"];


$userCount = count($users);
$dataCount = count($lead_ids);

for ($i = 0; $i < $dataCount; $i++) {

    $userIndex = $i % $userCount; // Xác định vị trí user tương ứng với data hiện tại
    $user = $users[$userIndex];

    $lead_id = $lead_ids[$i];
    $query = "UPDATE leads SET ro_name = '{$user}', sale_stage = sale_stage_follow_level, lead_status = lead_status_follow_level, campaign = '2' WHERE id = '{$lead_id}'";
    $GLOBALS['db']->query($query);
    echo "$lead_id\n";
}


