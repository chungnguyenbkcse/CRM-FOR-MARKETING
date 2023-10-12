<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/30-9-2023/data_30_9.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$phone_number_primarys = [];
$ro_names = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $phone_number_primarys[] = $data[0];
        $ro_names[] = $data[1];

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
    $query = "UPDATE leads SET ro_name = '869b1328-a0a6-f404-bd6e-63f4474b1137', owned_branch = 'HCM_2' WHERE phone_number_primary = '{$phone_number_primary}'";
    $GLOBALS['db']->query($query);
    echo "$lead_id\n";
}


