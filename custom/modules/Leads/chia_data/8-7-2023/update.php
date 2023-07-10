<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/8-7-2023/data_8_7.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$phone_number_primarys = [];
$facebook_or_zalo_names = [];
$address_follow_citizen_identifications = [];
$district_customer_lives = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $phone_number_primarys[] = $data[1];
        $facebook_or_zalo_names[] = $data[0];
        $address_follow_citizen_identifications[] = $data[2];
        $district_customer_lives = $data[3];

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}


//$users = ["PHUONG_DTP", "HANG_NTH", "KIET_LTK"]; // Danh sách users

$users = ["be4ffa75-4134-1c1a-f059-64a80f462508", "557fee56-0915-6bf8-e606-64a80f20e219", "af59008b-f1c4-5390-a9d1-64a80f58e7d3"];


$userCount = count($users);
$dataCount = count($phone_number_primarys);

echo $dataCount;

for ($i = 0; $i < $dataCount; $i++) {

    $userIndex = $i % $userCount; // Xác định vị trí user tương ứng với data hiện tại
    $user = $users[$userIndex];

    $phone_number_primary = "0" . $phone_number_primarys[$i];
    $facebook_or_zalo_name = $facebook_or_zalo_names[$i];
    $address_follow_citizen_identification = $address_follow_citizen_identifications[$i];
    $district_customer_live = $district_customer_lives[$i];


    
    $query = "UPDATE leads SET created_by = '1'  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
    $GLOBALS['db']->query($query);
    echo "$phone_number_primary\n";
}


