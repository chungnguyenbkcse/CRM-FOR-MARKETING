<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/6-8-2023/campign_ia.csv';

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


//$users = ["HANG_NTH"]; // Danh sách users

$users = ["b55724a4-710b-8d5f-e4f0-64a4d19b1d26", "af59008b-f1c4-5390-a9d1-64a80f58e7d3", "557fee56-0915-6bf8-e606-64a80f20e219", "be4ffa75-4134-1c1a-f059-64a80f462508", "288bf2f5-4af3-67db-879e-64a80f053f02", "714c30cb-8cab-ab8e-29a1-64800c5f4e5e", "b38f7108-9e87-267b-62a9-64800cf3e9c1"];


$userCount = count($users);
$dataCount = count($lead_ids);

for ($i = 0; $i < $dataCount; $i++) {

    $userIndex = $i % $userCount; // Xác định vị trí user tương ứng với data hiện tại
    $user = $users[$userIndex];

    $lead_id = $lead_ids[$i];
    $query = "UPDATE leads SET ro_name = '{$user}', sale_stage = '1', lead_status = '1', campaign = '1' WHERE id = '{$lead_id}'";
    $GLOBALS['db']->query($query);
    echo "$lead_id\n";
}


