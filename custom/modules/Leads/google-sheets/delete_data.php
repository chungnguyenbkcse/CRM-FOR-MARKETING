<?php
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
$range = 'DATA CHUNG';
$response = $service->spreadsheets_values->get($spreadsheetId, $range);
$values = $response->getValues();
foreach ($values as $row => $data) {
    if (substr_count($data[2], "ĐỐI TÁC") >= 2) {
        echo $data[2];
    }
}