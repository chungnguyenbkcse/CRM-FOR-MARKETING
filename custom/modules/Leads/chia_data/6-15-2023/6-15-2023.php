<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/6-15-2023/phuong-6_15_2023.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$phones = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $phones[] = $data[0];
    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}


$dataCount = count($phones);

for ($i = 0; $i < $dataCount; $i++) {
    $user = "ba6d40b5-6bd0-6270-681c-64800c5b5352";
    $userData = $phones[$i];
    $query = "UPDATE leads SET ro_name = '{$user}', sale_stage = '1', lead_status = '1'  WHERE phone_number_primary = '{$userData}' AND deleted = 0";
    $GLOBALS['db']->query($query);
    echo "Data $userData assigned to $user\n";
}


