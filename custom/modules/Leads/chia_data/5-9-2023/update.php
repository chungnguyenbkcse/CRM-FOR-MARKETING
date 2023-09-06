<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/5-9-2023/DATA.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$phone_number_primarys = [];
$citizen_identifications = [];
$ro_names = [];
$data_sourceses = [];
$fullnames = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $phone_number_primarys[] = $data[2];
        $citizen_identifications[] = $data[1];
        $fullnames[] = $data[0];
        $data_sourceses[] = $data[3];
        $ro_names[] = $data[4];

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}



$dataCount = count($phone_number_primarys);

echo $dataCount;

for ($i = 0; $i < $dataCount; $i++) {

    $phone_number_primary = "0" . $phone_number_primarys[$i];
    $fullname = $fullnames[$i];
    $citizen_identification = $citizen_identifications[$i];
    $ro_name = $ro_names[$i];
    $data_sources = $data_sourceses[$i];


    $leadBean = BeanFactory::newBean('Leads');
    $leadBean->phone_number_primary = $phone_number_primary;
    $leadBean->fullname = $fullname;
    $leadBean->citizen_identification = $citizen_identification;
    $leadBean->ro_name = $ro_name;
    $leadBean->campaign = '5';
    $leadBean->lead_status = '1';
    $leadBean->sale_stage = '1';
    $leadBean->owned_branch = '9';
    $leadBean->save();
    
    
    echo "$phone_number_primary\n";
}


