<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/28-8-2023/data_loi.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$phone_number_primarys = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $phone_number_primarys[] = $data[0];

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}


//$users = ["THUY_NHT"]; // Danh sách users

$users = ["288bf2f5-4af3-67db-879e-64a80f053f02"];


$userCount = count($users);
$dataCount = count($phone_number_primarys);

for ($i = 0; $i < $dataCount; $i++) {

    $userIndex = $i % $userCount; // Xác định vị trí user tương ứng với data hiện tại
    $user = $users[$userIndex];

    $phone_number_primary = $phone_number_primarys[$i];
    $query = "UPDATE leads SET sale_stage = sale_stage_follow_level, lead_status = lead_status_follow_level WHERE phone_number_primary = '{$phone_number_primary}'";
    $GLOBALS['db']->query($query);
    echo "$lead_id\n";
}


