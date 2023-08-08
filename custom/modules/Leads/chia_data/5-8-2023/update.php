<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/5-8-2023/data1.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$phone_number_primarys = [];
$facebook_or_zalo_names = [];
$address_follow_citizen_identifications = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $phone_number_primarys[] = $data[1];
        $facebook_or_zalo_names[] = $data[0];
        $address_follow_citizen_identifications[] = $data[2];

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}


//$users = ["HANG_NTH"]; // Danh sách users

$users = ["b55724a4-710b-8d5f-e4f0-64a4d19b1d26", "af59008b-f1c4-5390-a9d1-64a80f58e7d3", "557fee56-0915-6bf8-e606-64a80f20e219", "be4ffa75-4134-1c1a-f059-64a80f462508", "ba6d40b5-6bd0-6270-681c-64800c5b5352", "349fe455-c77c-8f0b-b391-6440b692e560", "b38f7108-9e87-267b-62a9-64800cf3e9c1"];


$userCount = count($users);
$dataCount = count($phone_number_primarys);

echo $dataCount;

for ($i = 0; $i < $dataCount; $i++) {

    $userIndex = $i % $userCount; // Xác định vị trí user tương ứng với data hiện tại
    $user = $users[$userIndex];

    $phone_number_primary = $phone_number_primarys[$i];
    $facebook_or_zalo_name = $facebook_or_zalo_names[$i];
    $address_follow_citizen_identification = $address_follow_citizen_identifications[$i];
    $district_customer_live = "Hồ Chí Minh";
    $ngay_phat_hanh_the = "2023-08-03";

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
        $leadBean->campaign = '4';
        $leadBean->data_sources = '19';
        $leadBean->sale_stage = '1';
        $leadBean->ro_name = $user;
        $leadBean->ngay_phat_hanh_the = $ngay_phat_hanh_the;
        $leadBean->save();
        //$query = "UPDATE leads SET created_by = '1'  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
        //$GLOBALS['db']->query($query);

    }
    else {
        $query = "UPDATE leads SET created_by = '1', ro_name = '{$user}', sale_stage = '1', lead_status = '1', ngay_phat_hanh_the = '{$ngay_phat_hanh_the}'  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
        $GLOBALS['db']->query($query);
        echo "$phone_number_primary\n";
    }
}


