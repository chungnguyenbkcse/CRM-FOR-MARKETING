<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/6-21-2023/doi_tac_d.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$phone_number_primarys = [];
$facebook_or_zalo_names = [];
$district_customer_lives = [];
$services = [];
$fees = [];
$transaction_amounts = [];
$banks = [];
$notes = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $phone_number_primarys[] = $data[2];
        $facebook_or_zalo_names[] = $data[1];
        $services[] = $data[0];
        $banks = $data[3];
        $transaction_amounts[] = $data[4];
        $fees[] = $data[5];
        $notes[] = $data[7];
        $district_customer_lives = $data[6];

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}


//$users = ["KHOA_PAK", "PHUONG_TDP", "AN_DDA", "HIEP_TSH", "QUAN_NMQ"]; // Danh sách users

$users = ["b38f7108-9e87-267b-62a9-64800cf3e9c1", "ba6d40b5-6bd0-6270-681c-64800c5b5352", "7980379b-aeb5-c24d-a9d5-64800ceea1ce", "349fe455-c77c-8f0b-b391-6440b692e560", "869b1328-a0a6-f404-bd6e-63f4474b1137"];


$userCount = count($users);
$dataCount = count($phone_number_primarys);

echo $dataCount;

for ($i = 0; $i < $dataCount; $i++) {

    $userIndex = $i % $userCount; // Xác định vị trí user tương ứng với data hiện tại
    $user = $users[$userIndex];

    $phone_number_primary = $phone_number_primarys[$i];
    $facebook_or_zalo_name = $facebook_or_zalo_names[$i];
    $service = $services[$i];
    $district_customer_live = $district_customer_lives[$i];
    $bank = $banks[$i];
    $fee = $fees[$i];
    $transaction_amount = $transaction_amounts[$i];
    $note = $notes[$i];

    $query_4 = "SELECT COUNT(*) AS total FROM leads WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
    $result_4 = $GLOBALS['db']->query($query_4);
    $data   =  $GLOBALS['db']->fetchByAssoc($result_4);
    $total  =  $data['total'];

    if ($total == 0) {
        $leadBean = BeanFactory::newBean('Leads');
        $leadBean->phone_number_primary = $phone_number_primary;
        $leadBean->facebook_or_zalo_name = $facebook_or_zalo_name;
        $leadBean->service = $service;
        $leadBean->district_customer_live = $district_customer_live;
        $leadBean->bank = $bank;
        $leadBean->fee = $fee;
        $leadBean->transaction_amount = $transaction_amount;
        $leadBean->note = $note;

        $leadBean->lead_status = '1';
        $leadBean->sale_stage = '1';
        $leadBean->data_sources = '18';
        $leadBean->ro_name = $user;
        $leadBean->save();
        //$query = "UPDATE leads SET created_by = '1'  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
        //$GLOBALS['db']->query($query);

    }
    else {
        echo "$phone_number_primary\n";
    }
}


