<?php
$filename = '/home/www/html/mkt.tranthu.vn/data_1905.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $phone_number_primary = $data[0];
        $query = "UPDATE leads SET data_sources = '', ro_name = ''  WHERE phone_number_primary = '{$phone_number_primary}'";
        $GLOBALS['db']->query($query);

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}