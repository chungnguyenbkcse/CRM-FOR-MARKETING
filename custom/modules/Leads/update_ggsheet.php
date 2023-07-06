<?php
// configure the Google Client
$client = new \Google_Client();
$client->setApplicationName('Google Sheets API');
$client->setScopes([\Google_Service_Sheets::SPREADSHEETS]);
$client->setAccessType('offline');
// credentials.json is the key file we downloaded while setting up our Google Sheets API
$path = '/home/www/html/mkt.tranthu.vn/dataleadmkt-906bd32bac02.json';
$client->setAuthConfig($path);



// configure the Sheets Service
$service = new \Google_Service_Sheets($client);

// the spreadsheet id can be found in the url https://docs.google.com/spreadsheets/d/10qhcaru2svtbiLYmpZlMtsILS0HFbN7RZh7eMTtGs7M/edit
$spreadsheetId = '10qhcaru2svtbiLYmpZlMtsILS0HFbN7RZh7eMTtGs7M';

$range_tong = 'DATA CHUNG';



$filename = '/home/www/html/mkt.tranthu.vn/data_1705_full.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

// Bỏ qua dòng đầu tiên
fgetcsv($file);

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data_csv = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $phone_number_primary = $data_csv[0];

        $i = 0;


        $query_lead = "SELECT * FROM leads WHERE deleted = 0 AND  phone_number_primary = '{$phone_number_primary}' AND date_entered = '{$data_csv[1]}' AND created_by = '1'";
        $result_lead = $GLOBALS['db']->query($query_lead);
        
        while ($rows = $GLOBALS['db']->fetchByAssoc($result_lead)) {

            $i = $i + 1;
        
            $elementToCheck = $rows['phone_number_primary'];
        
            if (strlen($elementToCheck) == 9) {
                $elementToCheck = "0" . $elementToCheck; // Thêm số 0 vào đầu nếu độ dài là 9
            } elseif (strlen($elementToCheck) == 11) {
                $elementToCheck = substr($elementToCheck, 2); // Xóa 2 kí tự đầu nếu độ dài là 11
                $elementToCheck = "0" . $elementToCheck; // Thêm số 0 vào đầu
            }
        
            $lst = array();
        
            if (gettype($rows['contact_date']) != "NULL" && $rows['facebook_or_zalo_name'] != "") {
                $lst[0] = $rows['contact_date'];
            } else {
                $lst[0] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['facebook_or_zalo_name']) != "NULL" && $rows['facebook_or_zalo_name'] != "") {
                $lst[1] = $rows['facebook_or_zalo_name'];
            } else {
                $lst[1] = 'Không có dữ liệu';
            }
        
            $data_source_id = $rows['data_sources'];
            $data_sources = array(
                '' => 'Không có dữ liệu',
                '1' => 'FACEBOOK ADS',
                '2' => 'GOOGLE ADS',
                '3' => 'Facebook group',
                '4' => 'Zalo group',
                '5' => 'MGM',
                '6' => 'Facebook Fanpage',
                '7' => 'Data Center',
                '8' => 'Facebook UID',
                '9' => 'inactive',
                '10' => 'old MKT source',
                '11' => 'Partner',
                '12' => 'TELE',
                '13' => 'old MKT ĐN',
                '14' => 'inactive ĐN',
                '15' => 'LD',
                '16' => 'ĐỐI TÁC T',
                '17' => 'ĐỐI TÁC K',
                '18' => 'ĐỐI TÁC D', 
                '19' => 'ĐỐI TÁC VP',
                '20' => 'VP ĐỒNG NAI',
                '21' => 'VP KHÁNH HÒA',
            );
        
            foreach ($data_sources as $key => $data) {
                if ($key == $data_source_id) {
                    $lst[2] = $data;
                }
            }
        
            $lst[3] = $elementToCheck;
        
            if (gettype($rows['card_bark_type']) != "NULL" && $rows['card_bark_type'] != "") {
                $lst[4] = $rows['card_bark_type'];
            } else {
                $lst[4] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['service']) !== "NULL" && $rows['service'] != "") {
                $service_id = $rows['service'];
                $services = array(
                    '' => 'Không có dữ liệu',
                    '1' => 'Đáo',
                    '2' => 'Rút',
                    '3' => 'Mở thẻ',
                    '4' => 'Trả góp',
                    '5' => 'Đại lý',
                    '6' => 'Vay',
                );
                foreach ($services as $key => $data) {
                    if ($key == $service_id) {
                        $lst[5] = $data;
                    }
                }
            } else {
                $lst[5] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['bank']) != "NULL" && $rows['bank'] != "") {
                $bank_id = $rows['bank'];
                $banks = array(
                    '' => 'Không có dữ liệu',
                    '1' => 'HSBC',
                    '2' => 'KienLongBank',
                    '3' => 'Techcombank',
                    '4' => 'CIMB',
                    '5' => 'NamA Bank',
                    '6' => 'Vietcombank',
                    '7' => 'HDBank',
                    '8' => 'OCB',
                    '9' => 'MB Bank',
                    '10' => 'VIB',
                    '11' => 'Sacombank',
                    '12 ' => 'Shinhanbank',
                    '13' => 'Stanchart',
                    '14' => 'TPBank',
                    '15' => 'SCB',
                    '16' => 'VPBank ',
                    '17' => 'Vietbank',
                    '18' => 'Wooribank',
                    '19' => 'Eximbank',
                    '20' => 'FE Credit',
                    '21' => 'HD SaiSon',
                    '22' => 'Home Credit',
                    '23' => 'Lotte',
                    '24' => 'MB Shinsei',
                    '25' => 'Á Châu - ACB',
                    '26' => 'ABBank',
                    '27' => 'VietCapitalBank',
                    '28' => 'LienvietPostbank',
                    '29' => 'Citibank',
                    '30' => 'Vietinbank',
                    '31' => 'PVCombank',
                    '32' => 'BIDV',
                    '33' => 'SeaBank',
                    '34' => 'MaritimeBank',
                    '35' => 'Agribank',
                    '36' => 'STB Bank',
                    '37' => 'AMERICAN EXPRESS',
                    '38' => ' Mirae Asset',
                    '39' => 'Bank of America',
                    '40' => 'TMCP Bắc Á',
                    '41' => 'VIETCREDIT',
                    '42' => 'NCB',
                    '43' => 'Timo',
                    '44' => 'SHB',
                    '45' => 'Public Bank Vietnam',
                    '46' => 'Cake'
                );
                foreach ($banks as $key => $data) {
                    if ($key == $bank_id) {
                        $lst[6] = $data;
                    }
                }
            } else {
                $lst[6] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['payment_day']) != "NULL" && $rows['payment_day'] != "") {
                $lst[7] = $rows['payment_day'];
            } else {
                $lst[7] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['transaction_amount']) != "NULL" && $rows['transaction_amount'] != "") {
                $lst[8] = $rows['transaction_amount'];
            } else {
                $lst[8] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['fee']) != "NULL" && $rows['fee'] != "") {
                $lst[9] = $rows['fee'];
            } else {
                $lst[9] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['sale_stage']) != "NULL" && $rows['sale_stage'] != "") {
                $sale_stage_id = $rows['sale_stage'];
                $sale_stages = array(
                    '0' => 'Choose',
                    '1' => 'New',
                    '2' => 'Theo dõi 1',
                    '3' => 'Theo dõi 2',
                    '4' => 'Theo dõi 3',
                    '5' => 'Hẹn',
                    '6' => 'Từ chối',
                    '7' => 'Đồng ý giao dịch',
                    '8' => 'Cancel',
                    '9' => 'Bán chéo sp',
                    '10' => 'Chuyển BU',
                    '11' => 'Sai quy định'
                );
                foreach ($sale_stages as $key => $data) {
                    if ($key == $sale_stage_id) {
                        $lst[10] = $data;
                    }
                }
            } else {
                $lst[10] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['lead_status']) !== "NULL" && $rows['lead_status'] != "") {
                $lead_status_id = $rows['lead_status'];
                $lead_statuss = array(
                    '' => 'Không có dữ liệu',
                    '1' => 'NONE',
                    '2' => 'Không nghe ',
                    '3' => 'Thuê bao',
                    '4' => 'Đang bận hẹn gọi lại sau',
                    '5' => 'Đang cân nhắc ',
                    '6' => 'Hỗ trợ ship',
                    '7' => 'Cần thì liên hệ lại',
                    '8' => 'Không có shipper',
                    '9' => 'Không có máy pos',
                    '10' => 'Phí ship cao',
                    '11' => 'Văn phòng xa, khách không tiện ghé',
                    '12' => 'Không muốn gửi thẻ lại',
                    '13' => 'Thẻ bị khoá/Hết hạn/Trễ hạn thanh toán',
                    '14' => 'Giao dịch ngoài giờ làm việc',
                    '15' => 'Phí đáo/rút cao',
                    '16' => 'Khách hàng đổi ý',
                    '17' => 'Khác hàng quan tâm',
                    '18' => 'Giao dịch thành công',
                    '19' => 'Sai Rule',
                    '20' => 'Lừa đảo',
                    '21' => 'Lỗi RO',
                    '22' => 'Đại lý-CTV/Trả góp',
                    '23' => 'BU không hoàn thành Lead',
                    '24' => 'Đại lý-CTV/Trả góp/Mở thẻ/Vay',
                    '25' => 'Đã đáo/rút với bên khác',
                    '26' => 'Tìm hiểu thử cho biết',
                    '27' => 'Đang chờ để nhận thẻ',
                    '28' => 'Không nhu cầu',
                    '29' => 'Thuê bao',
                    '30' => 'Ấn nhầm link',
                    '31' => 'Nhầm số',
                    '32' => 'Hủy thẻ',
                );
                foreach ($lead_statuss as $key => $data) {
                    if ($key == $lead_status_id) {
                        $lst[11] = $data;
                    }
                }
            } else {
                $lst[11] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['owned_branch']) !== "NULL" && $rows['owned_branch'] != "") {
                $owned_branch_id = $rows['owned_branch'];
                $owned_branchs = array(
                    '' => 'Không có dữ liệu',
                    '1' => 'NTT',
                    '2' => 'District 10',
                    '3' => 'Tân Bình',
                    '4' => 'TELE',
                    '5' => 'DL TB',
                    '6' => 'Đồng nai',
                    '7' => 'Song Thao',
                    '8' => 'Nha trang',
                    '9' => 'LVS',
                );
                foreach ($owned_branchs as $key => $data) {
                    if ($key == $owned_branch_id) {
                        $lst[12] = $data;
                    }
                }
            } else {
                $lst[12] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['ro_name']) != 'NULL' && $rows['ro_name'] != "") {
                $lst[13] = "Không có dữ liệu";
                $query_1 = "SELECT * FROM users WHERE deleted = 0 AND id = '{$rows['ro_name']}'";
                $result_1 = $GLOBALS['db']->query($query_1);
                while ($rowsx = $GLOBALS['db']->fetchByAssoc($result_1)) {
                    $lst[13] = $rowsx['user_name'];
                }
            } else {
                $lst[13] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['note']) != "NULL" && $rows['note'] != "") {
                $lst[14] = $rows['note'];
            } else {
                $lst[14] = 'Không có dữ liệu';
            }
        
        
            if (gettype($rows['fullname']) != "NULL" && $rows['fullname'] != "") {
                $lst[15] = $rows['fullname'];
            } else {
                $lst[15] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['citizen_identification']) != "NULL" && $rows['citizen_identification'] != "") {
                $lst[16] = $rows['citizen_identification'];
            } else {
                $lst[16] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['citizen_identification_issuance_date']) != "NULL" && $rows['citizen_identification_issuance_date'] != "") {
                $lst[17] = $rows['citizen_identification_issuance_date'];
            } else {
                $lst[17] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['citizen_identification_issuance_place']) != "NULL" && $rows['citizen_identification_issuance_place'] != "") {
                $lst[18] = $rows['citizen_identification_issuance_place'];
            } else {
                $lst[18] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['real_transaction_amount']) != "NULL" && $rows['real_transaction_amount'] != "") {
                $lst[19] = $rows['real_transaction_amount'];
            } else {
                $lst[19] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['real_fee']) !== "NULL" && $rows['real_fee'] != "") {
                $lst[20] = $rows['real_fee'];
            } else {
                $lst[20] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['birthday']) !== "NULL" && $rows['birthday'] != "") {
                $lst[21] = $rows['birthday'];
            } else {
                $lst[21] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['successful_trading_day']) !== "NULL" && $rows['successful_trading_day'] != "") {
                $lst[22] = $rows['successful_trading_day'];
            } else {
                $lst[22] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['phone_number_extra']) !== "NULL" && $rows['phone_number_extra'] != "") {
                $lst[23] = $rows['phone_number_extra'];
            } else {
                $lst[23] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['career']) !== "NULL" && $rows['career'] != "") {
                $lst[24] = $rows['career'];
            } else {
                $lst[24] = 'Không có dữ liệu';
            }
        
            if (gettype($rows['district_customer_live']) !== "NULL" && $rows['district_customer_live'] != "") {
                $lst[25] = $rows['district_customer_live'];
            } else {
                $lst[25] = 'Không có dữ liệu';
            }
        
            $lead_status_follow_levels = array(
                '' => 'Không có dữ liệu',
                '0' => 'NONE',
                '1' => 'NONE',
                '2' => 'Không nghe ',
                '3' => 'Thuê bao',
                '4' => 'Đang bận hẹn gọi lại sau',
                '5' => 'Đang cân nhắc ',
                '6' => 'Hỗ trợ ship',
                '7' => 'Cần thì liên hệ lại',
                '8' => 'Không có shipper',
                '9' => 'Không có máy pos',
                '10' => 'Phí ship cao',
                '11' => 'Văn phòng xa, khách không tiện ghé',
                '12' => 'Không muốn gửi thẻ lại',
                '13' => 'Thẻ bị khoá/Hết hạn/Trễ hạn thanh toán',
                '14' => 'Giao dịch ngoài giờ làm việc',
                '15' => 'Phí đáo/rút cao',
                '16' => 'Khách hàng đổi ý',
                '17' => 'Khác hàng quan tâm',
                '18' => 'Giao dịch thành công',
                '19' => 'Sai Rule',
                '20' => 'Lừa đảo',
                '21' => 'Lỗi RO',
                '22' => 'Đại lý-CTV/Trả góp',
                '23' => 'BU không hoàn thành Lead',
                '24' => 'Đại lý-CTV/Trả góp/Mở thẻ/Vay',
                '25' => 'Đã đáo/rút với bên khác',
                '26' => 'Tìm hiểu thử cho biết',
                '27' => 'Đang chờ để nhận thẻ',
                '28' => 'Không nhu cầu',
                '29' => 'Thuê bao',
                '30' => 'Ấn nhầm link',
                '31' => 'Nhầm số',
                '32' => 'Hủy thẻ',
            );
        
        
            $sale_stage_follow_levels = array(
                '0' => 'Choose',
                '1' => 'New',
                '2' => 'Theo dõi 1',
                '3' => 'Theo dõi 2',
                '4' => 'Theo dõi 3',
                '5' => 'Hẹn',
                '6' => 'Từ chối',
                '7' => 'Đồng ý giao dịch',
                '8' => 'Cancel',
                '9' => 'Bán chéo sp',
                '10' => 'Chuyển BU',
                '11' => 'Sai quy định'
            );
        
            if (gettype($rows['sale_stage_follow_level']) !== "NULL" && $rows['sale_stage_follow_level'] != "") {
                foreach ($sale_stage_follow_levels as $key => $datax) {
                    if ($key == $rows['sale_stage_follow_level']) {
                        $lst[26] = $datax;
                    }
                }
            } else {
                $lst[26] = $lst[10];
            }
        
        
            if (gettype($rows['lead_status_follow_level']) !== "NULL" && $rows['lead_status_follow_level'] != "") {
                foreach ($lead_status_follow_levels as $keyy => $datay) {
                    if ($keyy == $rows['lead_status_follow_level']) {
                        $lst[27] = $datay;
                    }
                }
            } else {
                $lst[27] = $lst[11];
            }
        
            if (gettype($rows['date_entered']) !== "NULL" && $rows['date_entered'] != "") {
                $lst[28] = $rows['date_entered'];
            } else {
                $lst[28] = 'Không có dữ liệu';
            }
        
            $values = [
                [
                    strval($lst[0]),
                    strval($lst[1]),
                    strval($lst[2]),
                    strval($lst[3]),
                    strval($lst[4]),
                    strval($lst[5]),
                    strval($lst[6]),
                    strval($lst[7]),
                    strval($lst[8]),
                    strval($lst[9]),
                    strval($lst[10]),
                    strval($lst[11]),
                    strval($lst[12]),
                    strval($lst[13]),
                    strval($lst[14]),
                    strval($lst[15]),
                    strval($lst[16]),
                    strval($lst[17]),
                    strval($lst[18]),
                    strval($lst[19]),
                    strval($lst[20]),
                    strval($lst[21]),
                    strval($lst[22]),
                    strval($lst[23]),
                    strval($lst[24]),
                    strval($lst[25]),
                    strval($lst[26]),
                    strval($lst[27]),
                    strval($lst[28])
                ]
            ];
        
        
            try {
                // Tạo đối tượng $body
                $body = new Google_Service_Sheets_ValueRange([
                    'values' => $values
                ]);
        
                $params = [
                    'valueInputOption' => 'RAW'
                ];
                $response_tong = $service->spreadsheets_values->get($spreadsheetId, $range_tong);
                $values_tong = $response_tong->getValues();
                $count = (count($values_tong) + 1);
                $rangeToInsert = 'DATA CHUNG!A' . $count . ':AC' . $count;
                $service->spreadsheets_values->append($spreadsheetId, $rangeToInsert, $body, $params);
        
                // Thực hiện thêm $body vào Google Sheets
                // ...
            } catch (Google_Service_Exception $e) {
                // Xử lý lỗi ở đây, ví dụ:
                $error = $e->getMessage();
                print_r($values);
                // Ghi log lỗi, hiển thị thông báo, vv.
        
                // Tiếp tục thực hiện các vòng lặp tiếp theo hoặc hành động khác
                // ...
            }
        
            echo ($i . "\n");
        }
    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}
