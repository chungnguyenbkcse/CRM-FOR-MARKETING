<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/13-7-2023/data_hcm2.csv';

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

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}


//$users = ["TRAM_NNTA", "PHUONG_TDP"]; // Danh sách users

$users = ["349fe455-c77c-8f0b-b391-6440b692e560", "b38f7108-9e87-267b-62a9-64800cf3e9c1", "5d99f856-a50f-fa60-a871-64a27771603a"];


$userCount = count($users);
$dataCount = count($phone_number_primarys);

echo $dataCount;

$dataPerUser = array_fill(0, $userCount, 0); // Mảng lưu số lượng dữ liệu đã được chia cho mỗi người dùng
$maxDataPerUser = 100; // Số lượng dữ liệu tối đa cho mỗi người dùng (trừ người dùng "5d99f856-a50f-fa60-a871-64a27771603a")

for ($i = 0; $i < $dataCount; $i++) {
    $userIndex = $i % $userCount; // Xác định vị trí người dùng tương ứng với dữ liệu hiện tại
    $user = $users[$userIndex];

    $phone_number_primary = $phone_number_primarys[$i];
    $facebook_or_zalo_name = $facebook_or_zalo_names[$i];
    $address_follow_citizen_identification = $address_follow_citizen_identifications[$i];
    $district_customer_live = "Hồ Chí Minh";

    // Kiểm tra nếu người dùng "5d99f856-a50f-fa60-a871-64a27771603a" đã đạt đủ 50 dữ liệu
    if ($user == "5d99f856-a50f-fa60-a871-64a27771603a" && $dataPerUser[$userIndex] >= 50) {
        // Chuyển sang chia dữ liệu cho các người dùng khác
        $otherUsers = array_diff($users, [$user]);
        $otherUserCount = count($otherUsers);
        $otherUserIndex = $i % $otherUserCount; // Xác định vị trí người dùng khác tương ứng với dữ liệu hiện tại
        $user = $otherUsers[$otherUserIndex];
    }

    // Thêm dữ liệu cho người dùng
    $dataPerUser[$userIndex]++;

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
        $leadBean->campaign = '4';
        $leadBean->lead_status = '1';
        $leadBean->sale_stage = '1';
        $leadBean->data_sources = '22';
        $leadBean->owned_branch = 'HCM_2';
        $leadBean->ro_name = $user;
        $leadBean->save();
        //$query = "UPDATE leads SET created_by = '1'  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
        //$GLOBALS['db']->query($query);
    } else {
        $query = "UPDATE leads SET created_by = '1', ro_name = '{$user}', sale_stage = '1', lead_status = '1'  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
        $GLOBALS['db']->query($query);
        echo "$phone_number_primary\n";
    }
}


