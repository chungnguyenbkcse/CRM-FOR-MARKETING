<?php
/* $file = fopen('/home/www/html/mkt.tranthu.vn/mkt.csv', 'r');

while (($row = fgetcsv($file)) !== false) {
    if (!is_null($row[0]) && !is_null($row[1])) {
        $query = "UPDATE leads SET data_sources = '{$row[0]}' WHERE phone_number_primary = '{$row[1]}'";
        $GLOBALS['db']->query($query);
    }
}

fclose($file); */

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

 $lst = array();
 