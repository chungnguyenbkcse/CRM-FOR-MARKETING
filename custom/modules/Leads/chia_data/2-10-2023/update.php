<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/2-10-2023/chuyen_code_2_10.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$phone_number_primarys = [];
$ro_names = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $phone_number_primarys[] = $data[0];
        $ro_names[] = $data[1];

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}


//$users = ["THUY_NHT"]; // Danh sách users



$dataCount = count($phone_number_primarys);

for ($i = 0; $i < $dataCount; $i++) {

    $user = $ro_names[$i];
    $phone_number_primary = '0' . $phone_number_primarys[$i];

    $query = "UPDATE leads SET ro_name = '{$user}', owned_branch = '9', sale_stage='1', lead_status='1', campaign='5' WHERE phone_number_primary = '{$phone_number_primary}'";
    $GLOBALS['db']->query($query);
    echo "$lead_id\n";
}


