<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/12-10-2023/chuyen_code_12_10.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$ids = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $ids[] = $data[0];

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}


//$users = ["THUY_NHT"]; // Danh sách users

$users = ["9a11c853-5369-3733-688a-650941be9bcc", "b55724a4-710b-8d5f-e4f0-64a4d19b1d26"];


$userCount = count($users);
$dataCount = count($ids);

for ($i = 0; $i < $dataCount; $i++) {

    $userIndex = $i % $userCount; // Xác định vị trí user tương ứng với data hiện tại
    $user = $users[$userIndex];
    $id = $ids[$i];

    $query = "UPDATE leads SET ro_name = '{$user}', campaign = '4', owned_branch = '9', data_sources = '36', sale_stage = '1', lead_status = '1' WHERE id = '{$id}'";
    $GLOBALS['db']->query($query);
    echo "$lead_id\n";
}


