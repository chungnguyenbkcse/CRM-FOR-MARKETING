<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/13-7-2023/data_nguyet.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $phone = substr($data[0], -6); // Lấy 6 ký tự cuối của số điện thoại
        $sale_stage = $data[1];
        $lead_status = $data[2];

        $query = "UPDATE leads SET ro_name = '295102c7-d3e2-da00-326d-641fbd73a04a', sale_stage = '{$sale_stage}', lead_status = '{$lead_status}' WHERE phone_number_primary LIKE '%{$phone}' AND deleted = 0";
        $GLOBALS['db']->query($query);


        // $query = "SELECT * FROM  leads WHERE phone_number_primary LIKE '%{$phone}' AND deleted = 0";
        // $result = $GLOBALS['db']->query($query);
        // while ($rows = $GLOBALS['db']->fetchByAssoc($result)) {
        //     echo $rows['phone_number_primary'];
        // }

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}


