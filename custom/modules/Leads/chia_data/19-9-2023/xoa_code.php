<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/19-9-2023/data_bo_sung_chi_nhan_hcm1.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$lead_ids = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $lead_ids[] = $data[0];

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}



$dataCount = count($lead_ids);

for ($i = 0; $i < $dataCount; $i++) {

    $lead_id = $lead_ids[$i];

    $query = "UPDATE leads SET owned_branch = '9' WHERE id = '{$lead_id}'";
    $GLOBALS['db']->query($query);
    echo "$lead_id\n";
}


