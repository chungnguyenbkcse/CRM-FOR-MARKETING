<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/7-6-2023/mkt-n-1.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$phones = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $phones[] = $data[0];
    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}


//$users = QUAN_LDQ THU_LYT TUAN_THAT; // Danh sách users

$users = ["b55724a4-710b-8d5f-e4f0-64a4d19b1d26", "e4f1355a-8c95-c94a-57ab-64a4d25021b4", "5d99f856-a50f-fa60-a871-64a27771603a"];


$userCount = count($users);
$dataCount = count($phones);

for ($i = 0; $i < $dataCount; $i++) {
    $userIndex = $i % $userCount; // Xác định vị trí user tương ứng với data hiện tại
    $user = $users[$userIndex];
    $userData = $phones[$i];
    $query = "UPDATE leads SET ro_name = '{$user}', sale_stage = '1', lead_status = '1'  WHERE phone_number_primary = '{$userData}' AND deleted = 0";
    $GLOBALS['db']->query($query);
    echo "Data $userData assigned to $user\n";
}


