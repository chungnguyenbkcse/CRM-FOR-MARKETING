<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/7-7-2023/data.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$phone_number_primarys = [];
$facebook_or_zalo_names = [];
$address_follow_citizen_identifications = [];
$district_customer_lives = [];
$data_sourcess = [];
$owned_branchs = [];
$campaigns = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $phone_number_primarys[] = $data[1];
        $facebook_or_zalo_names[] = $data[0];
        $owned_branchs[] = $data[6];
        $data_sourcess[] = $data[4];
        $address_follow_citizen_identifications[] = $data[2];
        $district_customer_lives = $data[3];
        $campaigns = $data[5];

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}


//$users = ["THU_LYT", "QUAN_LDQ"]; // Danh sách users

$users = ["e4f1355a-8c95-c94a-57ab-64a4d25021b4", "b55724a4-710b-8d5f-e4f0-64a4d19b1d26"];


$userCount = count($users);
$dataCount = count($phone_number_primarys);

echo $dataCount;

for ($i = 0; $i < $dataCount; $i++) {

    $userIndex = $i % $userCount; // Xác định vị trí user tương ứng với data hiện tại
    $user = $users[$userIndex];

    $phone_number_primary = $phone_number_primarys[$i];
    $facebook_or_zalo_name = $facebook_or_zalo_names[$i];
    $owned_branch = $owned_branchs[$i];
    $data_sources = $data_sourcess[$i];
    $address_follow_citizen_identification = $address_follow_citizen_identifications[$i];
    $district_customer_live = $district_customer_lives[$i];
    $campaign = $campaigns[$i];

    $query = "UPDATE leads SET created_by = '1', data_sources = '{$data_sources}'  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
    $GLOBALS['db']->query($query);
}


