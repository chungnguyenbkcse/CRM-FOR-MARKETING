<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/12-10-2023/data_12_10.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$phone_number_primarys = [];
$fullnames = [];
$ro_names = [];
$payment_days = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $phone_number_primarys[] = $data[0];
        $fullnames[] = $data[1];
        $payment_days[] = $data[2];
        $ro_names[] = $data[3];

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}


//$users = ["HANG_NTH"]; // Danh sách users



$dataCount = count($phone_number_primarys);

echo $dataCount;

for ($i = 0; $i < $dataCount; $i++) {

    $user = $ro_names[$i];
    $phone_number_primary = "0" . $phone_number_primarys[$i];
    $fullname = $fullnames[$i];
    $payment_day = $payment_days[$i];

    $query_4 = "SELECT COUNT(*) AS total FROM leads WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
    $result_4 = $GLOBALS['db']->query($query_4);
    $data   =  $GLOBALS['db']->fetchByAssoc($result_4);
    $total  =  $data['total'];

    if ($total == 0) {
        $leadBean = BeanFactory::newBean('Leads');
        $leadBean->phone_number_primary = $phone_number_primary;
        $leadBean->fullname = $fullname;
        $leadBean->payment_day = $payment_day;
        $leadBean->campaign = '4';
        $leadBean->lead_status = '1';
        $leadBean->sale_stage = '1';
        $leadBean->data_sources = '39';
        $leadBean->owned_branch = '9';
        $leadBean->ro_name = $user;
        $leadBean->save();
        //$query = "UPDATE leads SET created_by = '1'  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
        //$GLOBALS['db']->query($query);
        echo "$leadBean->id\n";

    }
    else {
        $query = "UPDATE leads SET created_by = '1', owned_branch = '9', campaign = '4', data_sources = '39', ro_name = '{$user}', sale_stage = '1', lead_status = '1'  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
        $GLOBALS['db']->query($query);
        echo "$phone_number_primary\n";
    }
}


