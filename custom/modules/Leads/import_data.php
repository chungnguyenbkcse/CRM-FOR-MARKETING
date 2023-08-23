<?php

// Thư mục lưu file CSV
$targetDir = "/home/www/html/mkt.tranthu.vn/upload1";

if (isset($_FILES["importFile"]) && $_FILES["importFile"]["error"] == 0) {
    $filename = $targetDir . basename($_FILES["importFile"]["name"]);

    // Lấy danh sách người dùng từ form
    $users = $_POST['users'];
    $dataSource = $_POST['dataSource'];
    $campaign = $_POST['campaign'];

    // Di chuyển file đã upload vào thư mục đích
    if (move_uploaded_file($_FILES["importFile"]["tmp_name"], $filename)) {

        // Gọi hàm import dữ liệu từ file CSV
        importFromCSV($filename, $users, $dataSource, $campaign);
    } else {
        echo "Lỗi khi lưu file!";
    }
} else {
    echo "Lỗi file upload!";
}

function importFromCSV($filename, $users, $dataSource, $campaign)
{

    // Mở tệp CSV để đọc
    $file = fopen($filename, 'r');

    $phone_number_primarys = [];
    $facebook_or_zalo_names = [];
    $address_follow_citizen_identifications = [];
    $ngay_phat_hanh_thes[] = [];

    // Kiểm tra xem tệp có tồn tại không
    if ($file) {
        // Đọc dữ liệu từ tệp theo từng dòng
        while (($data = fgetcsv($file)) !== false) {
            // Lấy giá trị của cột đầu tiên
            $phone_number_primarys[] = $data[1];
            $facebook_or_zalo_names[] = $data[0];
            $address_follow_citizen_identifications[] = $data[2];
            $ngay_phat_hanh_thes[] = $data[3];
        }
        // Đóng tệp CSV sau khi đọc xong
        fclose($file);
    } else {
        echo "Không thể mở tệp CSV!";
    }


    $userCount = count($users);
    $dataCount = count($phone_number_primarys);

    echo $dataCount;

    for ($i = 0; $i < $dataCount; $i++) {

        $userIndex = $i % $userCount; // Xác định vị trí user tương ứng với data hiện tại
        $user = $users[$userIndex];

        $phone_number_primary = $phone_number_primarys[$i];
        $facebook_or_zalo_name = $facebook_or_zalo_names[$i];
        $address_follow_citizen_identification = $address_follow_citizen_identifications[$i];
        $district_customer_live = "Hồ Chí Minh";
        $ngay_phat_hanh_the = $ngay_phat_hanh_thes[$i];

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
            $leadBean->lead_status = '1';
            $leadBean->campaign = $campaign;
            $leadBean->data_sources = $dataSource;
            $leadBean->sale_stage = '1';
            $leadBean->ro_name = $user;
            $leadBean->ngay_phat_hanh_the = $ngay_phat_hanh_the;
            $leadBean->save();
            //$query = "UPDATE leads SET created_by = '1'  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
            //$GLOBALS['db']->query($query);

        } else {
            $query = "UPDATE leads SET created_by = '1', ro_name = '{$user}', campaign = '{$campaign}', data_sources = '{$dataSource}', sale_stage = '1', lead_status = '1', ngay_phat_hanh_the = '{$ngay_phat_hanh_the}'  WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
            $GLOBALS['db']->query($query);
            echo "$phone_number_primary\n";
        }
    }

    for ($i = 0; $i < $dataCount; $i++) {

        $phone_number_primary = $phone_number_primarys[$i];
        $ngay_phat_hanh_the = "2023-08-06";
        
        $query = "UPDATE leads SET created_by = '1', campaign = '{$campaign}', data_sources = '{$dataSource}', ngay_phat_hanh_the = '{$ngay_phat_hanh_the}' WHERE phone_number_primary = '{$phone_number_primary}' AND deleted = 0";
        $GLOBALS['db']->query($query);
        echo "$phone_number_primary\n";
    }

    $query = "UPDATE leads
    SET owned_branch = (
        SELECT branch_id
        FROM branch_ro
        WHERE user_id = leads.ro_name
    )";
    $GLOBALS['db']->query($query);
}
