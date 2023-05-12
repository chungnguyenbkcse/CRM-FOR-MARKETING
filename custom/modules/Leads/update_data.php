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



/* $values = [
    [$bean->facebook_or_zalo_name, $bean->data_sources, $bean->phone_number_primary, $bean->card_bark_type, $bean->bank, $bean->payment_day, $bean->transaction_amount, $bean->fee, $bean->sale_stage, $bean->lead_status, $bean->owned_branch, $bean->ro_name, $bean->contact_date, $bean->note, $bean->fullname, $bean->citizen_identificationj, $bean->citizen_identification_issuance_date, $bean->citizen_identification_issuance_place, $bean->real_transaction_amount, $bean->real_fee, $bean->payment_day, $bean->birthday, $bean->successful_trading_day, $bean->phone_number_extra, $bean->career, $bean->district_customer_live]
]; */

$filename = '/home/www/html/mkt.tranthu.vn/Book1.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {

        // Lấy giá trị của cột đầu tiên
        $firstColumnValue = $data[0];
        
        // Xử lý giá trị của cột đầu tiên
        // Ví dụ: In ra giá trị của cột đầu tiên
        $lst = array();

        $query = "SELECT * FROM leads WHERE phone_number_primary = '{$firstColumnValue}' AND deleted = 0";
        $result =  $GLOBALS['db']->query($query);
        while ($rows = $GLOBALS['db']->fetchByAssoc($result)) {
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
    
            if ($rows['sale_stage_follow_level'] != null && $rows['sale_stage_follow_level'] != "") {
                foreach ($sale_stage_follow_levels as $key => $datax) {
                    if ($key == $rows['sale_stage_follow_level']) {
                        $lst[0] = $datax;
                    }
                }
            }
            else {
                $lst[0] = 'Không có dữ liệu';
            }
            
    
            if ($rows['lead_status_follow_level'] != null && $rows['lead_status_follow_level'] != "") {
                foreach ($lead_status_follow_levels as $keyy => $datay) {
                    if ($keyy == $rows['lead_status_follow_level']) {
                        $lst[1] = $datay;
                    }
                }
            }
            else {
                $lst[1] = 'Không có dữ liệu';
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
            $key = $rows['phone_number_primary'];

            foreach ($values as $row => $datax) {
                if ($datax[3] == substr($key, 1)) {
                    //$rangeToUpdate = 'DATA CRM!A' . ($row + 1) . ':Z' . ($row + 1);
                    $rangeToUpdate = 'DATA CRM!AA' . ($row + 1) . ':AB' . ($row + 1);
                    $result = $service->spreadsheets_values->update($spreadsheetId, $rangeToUpdate, $body, $params);
                    break;
                }
            }
    
        }

    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}
