<?php
$filename = '/home/www/html/mkt.tranthu.vn/nguyen_pttn.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $firstColumnValue = $data[0];
        
        // Xử lý giá trị của cột đầu tiên
        // Ví dụ: In ra giá trị của cột đầu tiên
        $query = "UPDATE leads SET data_sources = '15' WHERE phone_number_primary = '{$firstColumnValue}'";
        $GLOBALS['db']->query($query);
    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}