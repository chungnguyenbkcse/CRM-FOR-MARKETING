<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/19-9-2023/data_xen_ke.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$lead_ids = [];
$users = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $lead_ids[] = $data[0];
        $users[] = $data[1];

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}



$dataCount = count($lead_ids);

for ($i = 0; $i < $dataCount; $i++) {

    $user = $users[$i];
    $lead_id = $lead_ids[$i];

    $query = "UPDATE leads SET ro_name = '{$user}', sale_stage = '1', lead_status = '1' WHERE id = '{$lead_id}'";
    $GLOBALS['db']->query($query);
    echo "$lead_id\n";
}


