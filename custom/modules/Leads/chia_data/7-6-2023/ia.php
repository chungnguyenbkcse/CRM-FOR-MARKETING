<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/7-6-2023/ia.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$phone_number_primarys = [];
$facebook_or_zalo_names = [];
$citizen_identifications = [];
$services = [];
$fees = [];
$transaction_amounts = [];
$banks = [];
$campaigns = [];
$day_ro_modified_sale_stages = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $phone_number_primarys[] = $data[6];
        $facebook_or_zalo_names[] = $data[0];
        $day_ro_modified_sale_stages[] = $data[1];
        $banks = $data[2];
        $transaction_amounts[] = $data[3];
        $fees[] = $data[4];
        $citizen_identifications[] = $data[5];
        $services = $data[7];
        $campaigns = $data[8];

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}


//$users = ["KHOA_PAK", "PHUONG_TDP", "AN_DDA", "HIEP_TSH", "QUAN_NMQ"]; // Danh sách users

$users = ["b55724a4-710b-8d5f-e4f0-64a4d19b1d26", "e4f1355a-8c95-c94a-57ab-64a4d25021b4", "5d99f856-a50f-fa60-a871-64a27771603a"];


$userCount = count($users);
$dataCount = count($phone_number_primarys);

echo $dataCount;

for ($i = 0; $i < $dataCount; $i++) {

    $userIndex = $i % $userCount; // Xác định vị trí user tương ứng với data hiện tại
    $user = $users[$userIndex];

    $phone_number_primary = $phone_number_primarys[$i];
    $facebook_or_zalo_name = $facebook_or_zalo_names[$i];
    $service = $services[$i];
    $day_ro_modified_sale_stage = $day_ro_modified_sale_stages[$i];
    $bank = $banks[$i];
    $fee = $fees[$i];
    $transaction_amount = $transaction_amounts[$i];
    $campaign = $campaigns[$i];
    $citizen_identification = $citizen_identifications[$i];

    $query_4 = "SELECT COUNT(*) AS total FROM leads WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
    $result_4 = $GLOBALS['db']->query($query_4);
    $data   =  $GLOBALS['db']->fetchByAssoc($result_4);
    $total  =  $data['total'];

    if ($total == 0) {
        $leadBean = BeanFactory::newBean('Leads');
        $leadBean->phone_number_primary = $phone_number_primary;
        $leadBean->facebook_or_zalo_name = $facebook_or_zalo_name;
        $leadBean->service = $service;
        $leadBean->day_ro_modified_sale_stage = $day_ro_modified_sale_stage;
        $leadBean->bank = $bank;
        $leadBean->fee = $fee;
        $leadBean->transaction_amount = $transaction_amount;
        $leadBean->campaign = $campaign;
        $leadBean->citizen_identification = $citizen_identification;

        $leadBean->lead_status = '1';
        $leadBean->sale_stage = '1';
        $leadBean->data_sources = '18';
        $leadBean->ro_name = $user;
        $leadBean->save();
        //$query = "UPDATE leads SET created_by = '1'  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
        //$GLOBALS['db']->query($query);

    }
    else {
        $query = "UPDATE leads SET ro_name = '{$user}', sale_stage = '1', lead_status = '1'  WHERE phone_number_primary = '{$userData}' AND deleted = 0";
        $GLOBALS['db']->query($query);
        echo "$phone_number_primary\n";
    }
}


