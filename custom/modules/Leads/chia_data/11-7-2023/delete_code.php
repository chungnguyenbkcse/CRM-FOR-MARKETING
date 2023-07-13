<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/11-7-2023/data_xoa_code.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$phone_number_primarys = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $phone_number_primarys[] = $data[0];

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}


$dataCount = count($phone_number_primarys);

echo $dataCount;

for ($i = 0; $i < $dataCount; $i++) {

    $query = "UPDATE leads SET ro_name = '', data_sources = ''  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
    $GLOBALS['db']->query($query);
}


