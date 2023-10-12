<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/21-9-2023/data_21_9.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$fullnames = [];
$transaction_amounts = [];
$citizen_identifications = [];
$data_sources_list = [];
$phone_number_primarys = [];
$ro_names = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $fullnames[] = $data[0];
        $transaction_amounts[] = $data[1];
        $data_sources_list[] = $data[2];
        $phone_number_primarys[] = $data[4];
        $citizen_identifications[] = $data[3];
        $ro_names[] = $data[5];

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}


//$users = ["KHOA_PAK", "PHUONG_TDP", "AN_DDA", "HIEP_TSH", "QUAN_NMQ"]; // Danh sách users


$dataCount = count($phone_number_primarys);

for ($i = 0; $i < $dataCount; $i++) {

    $fullname = $fullnames[$i];
    $transaction_amount = $transaction_amounts[$i];
    $data_sources = $data_sources_list[$i];
    $phone_number_primary = "0" . $phone_number_primarys[$i];
    $ro_name = $ro_names[$i];
    $citizen_identification = $citizen_identifications[$i];

    
    $query = "UPDATE leads SET ro_name = '{$ro_name}', created_by = '1', sale_stage = '1', lead_status = '1'  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
    $GLOBALS['db']->query($query);
    

    echo "$ro_name\n";
}


