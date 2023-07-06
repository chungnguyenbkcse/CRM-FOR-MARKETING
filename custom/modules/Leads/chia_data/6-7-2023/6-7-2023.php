<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/6-7-2023/mkt-1_7_6_2023.csv';

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


//$users = ["NHUNG_PTTN", "KHOA_PAK", "PHUONG_TDP", "AN_DDA", "HIEP_TSH", "TRAM_NNTA"]; // Danh sách users

$users = ["714c30cb-8cab-ab8e-29a1-64800c5f4e5e", "b38f7108-9e87-267b-62a9-64800cf3e9c1", "ba6d40b5-6bd0-6270-681c-64800c5b5352", "7980379b-aeb5-c24d-a9d5-64800ceea1ce", "349fe455-c77c-8f0b-b391-6440b692e560", "a5a5f967-0e9e-5d0c-6a51-63fdc413bf45"];


$userCount = count($users);
$dataCount = count($phones);

for ($i = 0; $i < $dataCount; $i++) {
    $userIndex = $i % $userCount; // Xác định vị trí user tương ứng với data hiện tại
    $user = $users[$userIndex];
    $userData = $phones[$i];
    $query = "UPDATE leads SET ro_name = '{$user}', sale_stage = '1', lead_status = '1'  WHERE phone_number_primary = '{$userData}' AND deleted = 0";
    $GLOBALS['db']->query($query);
    echo "Data $userData assigned to $user\n";
}


