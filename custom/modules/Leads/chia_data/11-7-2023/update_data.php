<?php

$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/11-7-2023/data_11_7.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

$phone_number_primarys = [];
$facebook_or_zalo_names = [];
$address_follow_citizen_identifications = [];

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $phone_number_primarys[] = $data[1];
        $facebook_or_zalo_names[] = $data[0];
        $address_follow_citizen_identifications[] = $data[2];

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}


//$users = ["PHUONG_DTP", "HANG_NTH", "KIET_LTK"]; // Danh sách users


$dataCount = count($phone_number_primarys);

echo $dataCount;

for ($i = 0; $i < $dataCount; $i++) {

    $phone_number_primary = $phone_number_primarys[$i];
    $facebook_or_zalo_name = $facebook_or_zalo_names[$i];
    $address_follow_citizen_identification = $address_follow_citizen_identifications[$i];
    $district_customer_live = 'Hồ Chí Minh';

    $query_4 = "SELECT COUNT(*) AS total FROM leads WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
    $result_4 = $GLOBALS['db']->query($query_4);
    $data   =  $GLOBALS['db']->fetchByAssoc($result_4);
    $total  =  $data['total'];

    if ($total == 0) {
        $leadBean = BeanFactory::newBean('Leads');
        $leadBean->phone_number_primary = $phone_number_primary;
        $leadBean->facebook_or_zalo_name = $facebook_or_zalo_name;
        $leadBean->address_follow_citizen_identification = $address_follow_citizen_identification;
        $leadBean->district_customer_live = $district_customer_live;
        $leadBean->campaign = '4';
        $leadBean->lead_status = '1';
        $leadBean->sale_stage = '1';
        $leadBean->data_sources = '22';
        $leadBean->owned_branch = '9';
        $leadBean->ro_name = '1f08d048-cfe3-bbc5-15fe-63f44730fec2';
        $leadBean->save();
        //$query = "UPDATE leads SET created_by = '1'  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
        //$GLOBALS['db']->query($query);

    }
    else {
        $query = "UPDATE leads SET created_by = '1', ro_name = '1f08d048-cfe3-bbc5-15fe-63f44730fec2', sale_stage = '1', lead_status = '1'  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
        $GLOBALS['db']->query($query);
        echo "$phone_number_primary\n";
    }
}


