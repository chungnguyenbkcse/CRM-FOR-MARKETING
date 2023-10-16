<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/16-10-2023/doi_campaign.csv';

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


//$users = ["PHU_NLP", "BINH_LTB"]; // Danh sách users

$users = ["b55724a4-710b-8d5f-e4f0-64a4d19b1d26", "9a11c853-5369-3733-688a-650941be9bcc"];


$userCount = count($users);
$dataCount = count($lead_ids);

echo $dataCount;

for ($i = 0; $i < $dataCount; $i++) {

    $userIndex = $i % $userCount; // Xác định vị trí user tương ứng với data hiện tại
    $user = $users[$userIndex];

    $lead_id = $lead_ids[$i];
    $query = "UPDATE leads SET campaingn = '3' WHERE id = '{$lead_id}' AND deleted = 0";
    $GLOBALS['db']->query($query);
    echo $lead_id . '\n';
}


