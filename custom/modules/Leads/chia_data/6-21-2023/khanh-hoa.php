<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/6-21-2023/vp_khanh_hoa.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$phone_number_primarys = [];
$facebook_or_zalo_names = [];
$district_customer_lives = [];
$address_follow_citizen_identifications = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $phone_number_primarys[] = $data[1];
        $facebook_or_zalo_names[] = $data[0];
        $district_customer_lives = $data[2];
        $address_follow_citizen_identifications = $data[3];

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}


//$users = ["NGUYET_PTTN"]; // Danh sách users

$users = ["295102c7-d3e2-da00-326d-641fbd73a04a"];


$userCount = count($users);
$dataCount = count($phone_number_primarys);

for ($i = 0; $i < $dataCount; $i++) {

    $userIndex = $i % $userCount; // Xác định vị trí user tương ứng với data hiện tại
    $user = $users[$userIndex];

    $phone_number_primary = '0' . $phone_number_primarys[$i];
    $facebook_or_zalo_name = $facebook_or_zalo_names[$i];
    $address_follow_citizen_identification = $address_follow_citizen_identifications[$i];
    $district_customer_live = $district_customer_lives[$i];

    $query_4 = "SELECT COUNT(*) AS total FROM leads WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
    $result_4 = $GLOBALS['db']->query($query_4);
    $data   =  $GLOBALS['db']->fetchByAssoc($result_4);
    $total  =  $data['total'];

    if ($total == 0) {
        $leadBean = BeanFactory::newBean('Leads');
        $leadBean->phone_number_primary = $phone_number_primary;
        $leadBean->facebook_or_zalo_name = $facebook_or_zalo_name;
        $leadBean->address_follow_citizen_identification = $address_follow_citizen_identification;
        $leadBean->district_customer_live = $district_customer_live;

        $leadBean->lead_status = '1';
        $leadBean->sale_stage = '1';
        $leadBean->data_sources = '21';
        $leadBean->ro_name = $user;
        $leadBean->save();
        //$query = "UPDATE leads SET created_by = '1'  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
        //$GLOBALS['db']->query($query);

    }
    else {
        echo "$phone_number_primary\n";
    }
}


