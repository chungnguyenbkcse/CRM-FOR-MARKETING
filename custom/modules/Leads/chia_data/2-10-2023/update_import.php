<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/2-10-2023/data_import_2_10.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$phone_number_primarys = [];
$fullnames = [];
$transaction_amounts = [];
$data_sources_ = [];
$citizen_identifications = [];
$phone_number_primarys = [];
$owned_branchs = [];
$ro_names = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $phone_number_primarys[] = $data[4];
        $fullnames[] = $data[0];
        $transaction_amounts[] = $data[1];
        $data_sources_[] = $data[2];
        $citizen_identifications[] = $data[3];
        $ro_names[] = $data[7];
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
    $transaction_amount = $transaction_amounts[$i];
    $data_sources = $data_sources_[$i];
    $citizen_identification = $citizen_identifications[$i];

    $query_4 = "SELECT COUNT(*) AS total FROM leads WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
    $result_4 = $GLOBALS['db']->query($query_4);
    $data   =  $GLOBALS['db']->fetchByAssoc($result_4);
    $total  =  $data['total'];

    if ($total == 0) {
        $leadBean = BeanFactory::newBean('Leads');
        $leadBean->phone_number_primary = $phone_number_primary;
        $leadBean->fullname = $fullname;
        $leadBean->transaction_amount = $transaction_amount;
        $leadBean->data_sources = $data_sources;
        $leadBean->citizen_identification = $citizen_identification;
        $leadBean->campaign = '5';
        $leadBean->lead_status = '1';
        $leadBean->sale_stage = '1';
        $leadBean->owned_branch = '9';
        $leadBean->ro_name = $user;
        $leadBean->save();
        //$query = "UPDATE leads SET created_by = '1'  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
        //$GLOBALS['db']->query($query);

    }
    else {
        $query = "UPDATE leads SET created_by = '1', owned_branch = '9', ro_name = '{$user}', sale_stage = '1', lead_status = '1', campaign = '5'  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
        $GLOBALS['db']->query($query);
        echo "$phone_number_primary\n";
    }
}


