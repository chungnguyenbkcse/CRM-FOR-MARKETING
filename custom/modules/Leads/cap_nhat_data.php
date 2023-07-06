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

$range_tong = 'DATA CHUNG';
$response_tong = $service->spreadsheets_values->get($spreadsheetId, $range_tong);
$values_tong = $response_tong->getValues();
$params = [
    'valueInputOption' => 'RAW'
];

foreach (array_slice($$values_tong, 3129) as $row => $datav) {
    if (preg_match('/^\d+$/', $datav[26]) || preg_match('/^\d+$/', $datav[27])) {

        $valuesToUpdate = [
            [
                strval($datav[0]),
                strval($datav[1]),
                strval($datav[2]),
                strval($datav[3]),
                strval($datav[4]),
                strval($datav[5]),
                strval($datav[6]),
                strval($datav[7]),
                strval($datav[8]),
                strval($datav[9]),
                strval($datav[10]),
                strval($datav[11]),
                strval($datav[12]),
                strval($datav[13]),
                strval($datav[14]),
                strval($datav[15]),
                strval($datav[16]),
                strval($datav[17]),
                strval($datav[18]),
                strval($datav[19]),
                strval($datav[20]),
                strval($datav[21]),
                strval($datav[22]),
                strval($datav[23]),
                strval($datav[24]),
                strval($datav[25]),
                strval($datav[10]),
                strval($datav[11]),
                strval($datav[28])
            ], // Giá trị mới cho cột 26 và 27
        ];

        try {
            $requestBody = new Google_Service_Sheets_ValueRange([
                'values' => $valuesToUpdate,
            ]);
            $rangeToUpdate = 'DATA CHUNG!A' . ($row + 1) . ':AC' . ($row + 1);
            $result = $service->spreadsheets_values->update($spreadsheetId, $rangeToUpdate, $requestBody, $params);
            $GLOBALS['log']->fatal("%d cells updated.\n" . $result->getUpdatedCells());
        } catch (Google_Service_Exception $e) {
            // Xử lý lỗi ở đây, ví dụ:
            $error = $e->getMessage();
            // Ghi log lỗi, hiển thị thông báo, vv.
    
            // Tiếp tục thực hiện các vòng lặp tiếp theo hoặc hành động khác
            // ...
        }
    } else {
        echo ($datav[26] . "\n");
    }
}

echo "success";
