<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/6-7-2023/IA_7_6_2023.csv';

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
    $phone = $phones[$i];
    if (strlen($phone) == 9) {
        $phone = '0' . $phone;
    }
    $query = "UPDATE leads SET campaign = '1' WHERE phone_number_primary = '{$phone}' AND deleted = 0";
    $GLOBALS['db']->query($query);
    echo "Data $userData assigned to $user\n";
}


