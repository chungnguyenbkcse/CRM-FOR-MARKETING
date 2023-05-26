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





$filename = '/home/www/html/mkt.tranthu.vn/data_17052023.csv';

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
        $lst = array();


        $query_lead = "SELECT * FROM leads WHERE phone_number_primary = '{$phone_number_primary}' LIMIT 1";
        $result_lead = $GLOBALS['db']->query($query_lead);
        while ($rows = $GLOBALS['db']->fetchByAssoc($result_lead)) {



            if ($rows['contact_date'] != null) {
                $lst[0] = $rows['contact_date'];
            } else {
                $lst[0] = "Không có dữ liệu";
            }





            if ($rows['facebook_or_zalo_name'] != null) {
                $lst[1] = $rows['facebook_or_zalo_name'];
            } else {
                $lst[1] = "Không có dữ liệu";
            }


            $lst[2] = "Không có dữ liệu";
            $data_source_id = $rows['data_sources'];
            $data_sources = array(
                '' => '',
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
            );

            foreach ($data_sources as $key => $data) {
                if ($key == $data_source_id) {
                    $lst[2] = $data;
                }
            }


            if ($rows['phone_number_primary'] != null) {
                $lst[3] = $rows['phone_number_primary'];
            } else {
                $lst[3] = "Không có dữ liệu";
            }



            if ($rows['card_bark_type'] != null) {
                $lst[4] = $rows['card_bark_type'];
            } else {
                $lst[4] = "Không có dữ liệu";
            }


            $lst[5] = "Không có dữ liệu";
            $service_id = $rows['service'];
            $services = array(
                '' => '',
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

            $lst[6] = "Không có dữ liệu";
            $bank_id = $rows['bank'];
            $banks = array(
                '' => '',
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
            );
            foreach ($banks as $key => $data) {
                if ($key == $bank_id) {
                    $lst[6] = $data;
                }
            }


            if ($rows['payment_day'] != null) {
                $lst[7] = $rows['payment_day'];
            } else {
                $lst[7] = "Không có dữ liệu";
            }


            if ($rows['transaction_amount'] != null) {
                $lst[8] = $rows['transaction_amount'];
            } else {
                $lst[8] = "Không có dữ liệu";
            }



            if ($rows['fee'] != null) {
                $lst[9] = $rows['fee'];
            } else {
                $lst[9] = "Không có dữ liệu";
            }


            $lst[10] = "Không có dữ liệu";
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

            $lst[11] = "Không có dữ liệu";
            $lead_status_id = $rows['lead_status'];
            $lead_statuss = array(
                '' => '',
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

            $lst[12] = "Không có dữ liệu";
            $owned_branch_id = $rows['owned_branch'];
            $owned_branchs = array(
                '' => '',
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


            $lst[13] = "Không có dữ liệu";
            $ro_name = $rows['ro_name'];
            $query_1 = "SELECT * FROM users WHERE deleted = 0 AND id = '{$ro_name}'";
            $result_1 = $GLOBALS['db']->query($query_1);
            while ($rowsx = $GLOBALS['db']->fetchByAssoc($result_1)) {
                $lst[13] .= $rowsx['user_name'];
            }


            if ($rows['note'] != null) {
                $lst[14] = $rows['note'];
            } else {
                $lst[14] = "Không có dữ liệu";
            }


            if ($rows['fullname'] != null) {
                $lst[15] = $rows['fullname'];
            } else {
                $lst[15] = "Không có dữ liệu";
            }


            if ($rows['citizen_identification'] != null) {
                $lst[16] = $rows['citizen_identification'];
            } else {
                $lst[16] = "Không có dữ liệu";
            }


            if ($rows['citizen_identification_issuance_date'] != null) {
                $lst[17] = $rows['citizen_identification_issuance_date'];
            } else {
                $lst[17] = "Không có dữ liệu";
            }



            if ($rows['citizen_identification_issuance_place'] != null) {
                $lst[18] = $rows['citizen_identification_issuance_place'];
            } else {
                $lst[18] = "Không có dữ liệu";
            }



            if ($rows['real_transaction_amount'] != null) {
                $lst[19] = $rows['real_transaction_amount'];
            } else {
                $lst[19] = "Không có dữ liệu";
            }




            if ($rows['real_fee'] != null) {
                $lst[20] = $rows['real_fee'];
            } else {
                $lst[20] = "Không có dữ liệu";
            }



            if ($rows['birthday'] != null) {
                $lst[21] = $rows['birthday'];
            } else {
                $lst[21] = "Không có dữ liệu";
            }



            if ($rows['successful_trading_day'] != null) {
                $lst[22] = $rows['successful_trading_day'];
            } else {
                $lst[22] = "Không có dữ liệu";
            }



            if ($rows['phone_number_extra'] != null) {
                $lst[23] = $rows['phone_number_extra'];
            } else {
                $lst[23] = "Không có dữ liệu";
            }



            if ($rows['career'] != null) {
                $lst[24] = $rows['career'];
            } else {
                $lst[24] = "Không có dữ liệu";
            }



            if ($rows['district_customer_live'] != null) {
                $lst[25] = $rows['district_customer_live'];
            } else {
                $lst[25] = "Không có dữ liệu";
            }




            if ($rows['sale_stage_follow_level'] != null && $rows['sale_stage_follow_level'] != "Không có dữ liệu") {
                $sale_stage_follow_level_id = $rows['sale_stage_follow_level'];
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
                foreach ($sale_stage_follow_levels as $key => $data) {
                    if ($key == $sale_stage_follow_level_id) {
                        $lst[26] = $data;
                    }
                }
            } else {
                $lst[26] = "Không có dữ liệu";
            }

            if ($rows['lead_status_follow_level'] != null && $rows['lead_status_follow_level'] != "Không có dữ liệu") {
                $lead_status_follow_level_id = $rows['lead_status_follow_level'];
                $lead_status_follow_levels = array(
                    '' => '',
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
                foreach ($lead_status_follow_levels as $key => $data) {
                    if ($key == $lead_status_follow_level_id) {
                        $lst[27] = $data;
                    }
                }
            } else {
                $lst[27] = "Không có dữ liệu";
            }
        }

        $values = [
            $lst
        ];

        $body = new Google_Service_Sheets_ValueRange([
            'values' => $values
        ]);

        $params = [
            'valueInputOption' => 'RAW'
        ];

        $range = 'DATA CRM';
        $response = $service->spreadsheets_values->get($spreadsheetId, $range);
        $values = $response->getValues();
        //$rangeToInsert = 'DATA CRM!A' . (count($values) + 1);
        $rangeToInsert = 'DATA CRM!A' . (count($values) + 1) . ':AB' . (count($values) + 1);
        $result = $service->spreadsheets_values->append($spreadsheetId, $rangeToInsert, $body, $params);
    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}
