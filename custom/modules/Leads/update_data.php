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



// Xử lý giá trị của cột đầu tiên
// Ví dụ: In ra giá trị của cột đầu tiên


$query = "SELECT * FROM leads WHERE created_by = 'aacec1bd-6737-81e3-7365-631aa18cd430' AND deleted = 0 ORDER BY date_entered DESC LIMIT 147, 18446744073709551615;";
$result =  $GLOBALS['db']->query($query);
while ($rows = $GLOBALS['db']->fetchByAssoc($result)) {

    $lst = array();

    if ($rows['contact_date'] !== null && $rows['contact_date'] != "") {
        $lst[0] = $rows['contact_date'];
    } else {
        $lst[0] = "";
    }

    $lst[1] = $rows['facebook_or_zalo_name'];

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

    $lst[3] = $rows['phone_number_primary'];

    if ($rows['card_bark_type'] !== null && $rows['card_bark_type'] != "") {
        $lst[4] = $rows['card_bark_type'];
    } else {
        $lst[4] = "";
    }

    if ($rows['service'] !== null && $rows['service'] != "") {
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
    } else {
        $lst[5] = "";
    }

    if ($rows['bank'] !== null && $rows['bank'] != "") {
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
    } else {
        $lst[6] = "";
    }

    if ($rows['payment_day'] !== null && $rows['payment_day'] != "") {
        $lst[7] = $rows['payment_day'];
    } else {
        $lst[7] = "";
    }

    if ($rows['transaction_amount'] !== null && $rows['transaction_amount'] != "") {
        $lst[8] = $rows['transaction_amount'];
    } else {
        $lst[8] = "";
    }

    if ($rows['fee'] !== null && $rows['fee'] != "") {
        $lst[9] = $rows['fee'];
    } else {
        $lst[9] = "";
    }

    if ($rows['sale_stage'] !== null && $rows['sale_stage'] != "") {
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
        $lst[10] = "";
    }

    if ($rows['lead_status'] !== null && $rows['lead_status'] != "") {
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
            '24' => 'Đại lý-CTV/Trả góp/M!== nullở thẻ/Vay',
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
        $lst[11] = "";
    }

    if ($rows['owned_branch'] !== null && $rows['owned_branch'] != "") {
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
    } else {
        $lst[12] = "";
    }

    if ($rows['ro_name'] !== null && $rows['ro_name'] != "") {
        $lst[13] = "";
        $query_1 = "SELECT * FROM users WHERE deleted = 0 AND id = '{$rows['ro_name']}'";
        $result_1 = $GLOBALS['db']->query($query_1);
        while ($rowsx = $GLOBALS['db']->fetchByAssoc($result_1)) {
            $lst[13] .= $rowsx['user_name'];
        }
    } else {
        $lst[13] = "";
    }

    if ($rows['note'] !== null && $rows['note'] != "") {
        $lst[14] = $rows['note'];
    } else {
        $lst[14] = "";
    }


    if ($rows['fullname'] !== null && $rows['fullname'] != "") {
        $lst[15] = $rows['fullname'];
    } else {
        $lst[15] = "";
    }

    if ($rows['citizen_identification'] !== null && $rows['citizen_identification'] != "") {
        $lst[16] = $rows['citizen_identification'];
    } else {
        $lst[16] = "";
    }

    if ($rows['citizen_identification_issuance_date'] !== null && $rows['citizen_identification_issuance_date'] != "") {
        $lst[17] = $rows['citizen_identification_issuance_date'];
    } else {
        $lst[17] = "";
    }

    if ($rows['citizen_identification_issuance_place'] !== null && $rows['citizen_identification_issuance_place'] != "") {
        $lst[18] = $rows['citizen_identification_issuance_place'];
    } else {
        $lst[18] = "";
    }

    if ($rows['real_transaction_amount'] !== null && $rows['real_transaction_amount'] != "") {
        $lst[19] = $rows['real_transaction_amount'];
    } else {
        $lst[19] = "";
    }

    if ($rows['real_fee'] !== null && $rows['real_fee'] != "") {
        $lst[20] = $rows['real_fee'];
    } else {
        $lst[20] = "";
    }

    if ($rows['birthday'] !== null && $rows['birthday'] != "") {
        $lst[21] = $rows['birthday'];
    } else {
        $lst[21] = "";
    }

    if ($rows['successful_trading_day'] !== null && $rows['successful_trading_day'] != "") {
        $lst[22] = $rows['successful_trading_day'];
    } else {
        $lst[22] = "";
    }

    if ($rows['phone_number_extra'] !== null && $rows['phone_number_extra'] != "") {
        $lst[23] = $rows['phone_number_extra'];
    } else {
        $lst[23] = "";
    }

    if ($rows['career'] !== null && $rows['career'] != "") {
        $lst[24] = $rows['career'];
    } else {
        $lst[24] = "";
    }

    if ($rows['district_customer_live'] !== null && $rows['district_customer_live'] != "") {
        $lst[25] = $rows['district_customer_live'];
    } else {
        $lst[25] = "";
    }

    $lead_status_follow_levels = array(
        '' => '',
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

    if ($rows['sale_stage_follow_level'] !== null && $rows['sale_stage_follow_level'] != "") {
        foreach ($sale_stage_follow_levels as $key => $datax) {
            if ($key == $rows['sale_stage_follow_level']) {
                $lst[26] = $datax;
            }
        }
    } else {
        $lst[26] = $rows['sale_stage'];
    }


    if ($rows['lead_status_follow_level'] !== null && $rows['lead_status_follow_level'] != "") {
        foreach ($lead_status_follow_levels as $keyy => $datay) {
            if ($keyy == $rows['lead_status_follow_level']) {
                $lst[27] = $datay;
            }
        }
    } else {
        $lst[27] = $rows['lead_status'];
    }

    if ($rows['date_entered'] !== null && $rows['date_entered'] != "") {
        $lst[28] = $rows['date_entered'];
    } else {
        $lst[28] = "";
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

    //$GLOBALS['log']->fatal($lst[0]);
    $range = 'DATA NHU';
    $response = $service->spreadsheets_values->get($spreadsheetId, $range);
    //$rangeToInsert = 'DATA CRM!A' . (count($values) + 1);
    $rangeToInsert = 'DATA NHU!A' . (count($response->getValues()) + 1) . ':AC' . (count($response->getValues()) + 1);
    $service->spreadsheets_values->append($spreadsheetId, $rangeToInsert, $body, $params);
}
