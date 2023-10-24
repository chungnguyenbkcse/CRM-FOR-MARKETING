<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/24-10-2023/data_24_10.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$phone_number_primarys = [];
$fullnames = [];
$ro_names = [];
$payment_days = [];
$services = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $phone_number_primarys[] = $data[1];
        $fullnames[] = $data[0];
        $payment_days[] = $data[3];
        $services[] = $data[2];

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}


$users = ["b55724a4-710b-8d5f-e4f0-64a4d19b1d26", "9a11c853-5369-3733-688a-650941be9bcc"];


$userCount = count($users);
$dataCount = count($phone_number_primarys);

echo $dataCount;

for ($i = 0; $i < $dataCount; $i++) {

    $phone_number_primary = "0" . $phone_number_primarys[$i];
    $fullname = $fullnames[$i];
    $payment_day = $payment_days[$i];
    $service = $services[$i];
    $user = $users[$userIndex];

    $query_4 = "SELECT COUNT(*) AS total FROM leads WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
    $result_4 = $GLOBALS['db']->query($query_4);
    $data   =  $GLOBALS['db']->fetchByAssoc($result_4);
    $total  =  $data['total'];

    if ($total == 0) {
        $leadBean = BeanFactory::newBean('Leads');
        $leadBean->phone_number_primary = $phone_number_primary;
        $leadBean->fullname = $fullname;
        $leadBean->payment_day = $payment_day;
        $leadBean->service = $service;
        $leadBean->lead_status = '1';
        $leadBean->sale_stage = '1';
        $leadBean->data_sources = '36';
        $leadBean->owned_branch = '9';
        $leadBean->ro_name = $user;
        $leadBean->save();
        //$query = "UPDATE leads SET created_by = '1'  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
        //$GLOBALS['db']->query($query);
        echo "$leadBean->id\n";

    }
    else {
        $query = "UPDATE leads SET created_by = '1', owned_branch = '9', data_sources = '36', ro_name = '{$user}', sale_stage = '1', lead_status = '1'  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
        $GLOBALS['db']->query($query);
        echo "$phone_number_primary\n";
    }
}


