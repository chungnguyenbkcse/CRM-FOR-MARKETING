<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
/**
 *
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2013 SugarCRM Inc.
 *
 * SuiteCRM is an extension to SugarCRM Community Edition developed by SalesAgility Ltd.
 * Copyright (C) 2011 - 2018 SalesAgility Ltd.
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY SUGARCRM, SUGARCRM DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Affero General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 *
 * You can contact SugarCRM, Inc. headquarters at 10050 North Wolfe Road,
 * SW2-130, Cupertino, CA 95014, USA. or at email address contact@sugarcrm.com.
 *
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 *
 * In accordance with Section 7(b) of the GNU Affero General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * SugarCRM" logo and "Supercharged by SuiteCRM" logo. If the display of the logos is not
 * reasonably feasible for technical reasons, the Appropriate Legal Notices must
 * display the words "Powered by SugarCRM" and "Supercharged by SuiteCRM".
 */

//if (isset($_GET['data'])){
//    $call_log_leads = $_GET['data'];
//    $user_call = $call_log_leads['user_id'];
//    $lead_name = $call_log_leads['lead_id'];
//    $call_status = $call_log_leads['call_status_id'];
//    $description_call_status = $call_log_leads['description_call_status_id'];
//    $call_date = date('Y-m-d H:i:s');
//    $query = "INSERT INTO call_log_leads (user_call, lead_name, call_date, call_status, description_call_status) VALUES ('{$user_call}', '{$lead_name}', '{$call_date}', '{$call_status}', '{$description_call_status}')";
//    $GLOBALS['db']->query($query);
//}

date_default_timezone_set('Asia/Ho_Chi_Minh');
// Load thư viện
require_once 'vendor/autoload.php';


class Handle
{
    public $module = 'Leads';

    function num2alpha($n) {
        $r = '';
        for ($i = 1; $n >= 0 && $i < 10; $i++) {
            $r = chr(65 + ($n % pow(26, $i)) / pow(26, $i - 1)) . $r;
            $n -= pow(26, $i);
        }
        return $r;
    }

    public function handle_after_save($bean, $event, $arguments)
    {
        date_default_timezone_set('Asia/Ho_Chi_Minh');
        $now = new DateTime();

        if ($bean->date_entered == $bean->date_modified) {
            $query_1 = "UPDATE leads SET date_modified = '{$now->format(\DateTime::ISO8601)}', date_entered = '{$now->format(\DateTime::ISO8601)}'  WHERE id = '{$bean->id}' AND deleted = '0'";
            $GLOBALS['db']->query($query_1);
        } else {
            $query_1 = "UPDATE leads SET date_modified = '{$now->format(\DateTime::ISO8601)}'  WHERE id = '{$bean->id}' AND deleted = '0'";
            $GLOBALS['db']->query($query_1);
        }

        /* if ($_COOKIE['ro_modified_sale_stage']) {  
            $ro_modified_sale_stage =  $_COOKIE['ro_modified_sale_stage'];
            if ($ro_modified_sale_stage == '1') {
                $query_2 = "UPDATE leads SET ro_modified_sale_stage = '1'  WHERE id = '{$bean->id}' AND deleted = '0'";
                $GLOBALS['db']->query($query_2);
                setcookie("ro_modified_sale_stage", "", time() - 3600);
                setcookie("ro_modified_sale_stage", '0', time() + (86400 * 30), "/");
            }              
        
        } */

        if ($bean->sale_stage_follow_level == null && $bean->sale_stage_follow_level == ""  && $bean->lead_status_follow_level == "" && $bean->lead_status_follow_level == null){
            $query_xxxxx = "UPDATE leads SET lead_status_follow_level = '{$bean->lead_status}', sale_stage_follow_level = '{$bean->sale_stage}'  WHERE id = '{$bean->id}' AND deleted = '0'";
            $GLOBALS['db']->query($query_xxxxx);
        }
        else {
            if ($bean->lead_status != null && $bean->lead_status != "" ) {
                $level_lead_status = 0;
                $level_lead_status_follow_level = 0;
                $query_get_lead_status_follow_level = "SELECT * FROM relationship_level_lead_status WHERE lead_status_id = '{$bean->lead_status}'";
                $result_get_lead_status_follow_level =  $GLOBALS['db']->query($query_get_lead_status_follow_level);   
                while($row1s = $GLOBALS['db']->fetchByAssoc($result_get_lead_status_follow_level)){
                    $level_lead_status = intval($row1s['level']);
                }
    
                $query_get_lead_status_follow_level_1 = "SELECT * FROM relationship_level_lead_status WHERE lead_status_id = '{$bean->lead_status_follow_level}'";
                $result_get_lead_status_follow_level_1 =  $GLOBALS['db']->query($query_get_lead_status_follow_level_1);   
                while($row2s = $GLOBALS['db']->fetchByAssoc($result_get_lead_status_follow_level_1)){
                    $level_lead_status_follow_level = intval($row2s['level']);
                }
    
                if ($level_lead_status > $level_lead_status_follow_level) {
                    /* $bean->lead_status_follow_level = $bean->lead_status;
                    $bean->sale_stage_follow_level = $bean->sale_stage; */
                    $query_xxx = "UPDATE leads SET lead_status_follow_level = '{$bean->lead_status}', sale_stage_follow_level = '{$bean->sale_stage}'  WHERE id = '{$bean->id}' AND deleted = '0'";
                    $GLOBALS['db']->query($query_xxx);
                }
            }
        }


        if ($bean->ro_name != "" && $bean->ro_name != null) {


            $query_ro_least_total = "SELECT COUNT(*) AS total FROM ro_least";
            $result_ro_least_total = $GLOBALS['db']->query($query_ro_least_total);
            $rows_ro_least_total = $GLOBALS['db']->fetchByAssoc($result_ro_least_total);
            $total_ro_least_total = $rows_ro_least_total['total'];
            if ($total_ro_least_total > 0) {
                $query_4 = "DELETE FROM ro_least WHERE bu = '{$bean->owned_branch}'";
                $GLOBALS['db']->query($query_4);
                $query_6 = "SELECT * FROM users WHERE deleted = 0 AND user_name = '{$bean->ro_name}'";
                $result_6 = $GLOBALS['db']->query($query_6);
                $rows_6 = $GLOBALS['db']->fetchByAssoc($result_6);
                $time = $rows_6['date_entered'];
                /* $query_5 = "INSERT INTO ro_least (id, time, bu) VALUES ('1', '{$time}', '{$bean->owned_branch}');";
                $GLOBALS['db']->query($query_5); */
            } else {
                $query_6 = "SELECT * FROM users WHERE deleted = 0 AND user_name = '{$bean->ro_name}'";
                $result_6 = $GLOBALS['db']->query($query_6);
                $rows_6 = $GLOBALS['db']->fetchByAssoc($result_6);
                $time = $rows_6['date_entered'];
                /* $query_5 = "INSERT INTO ro_least (id, time, bu) VALUES ('1', '{$time}', '{$bean->owned_branch}');";
                $GLOBALS['db']->query($query_5); */
            }
        }


        if ($_COOKIE['role']) {
            $role = $_COOKIE['role'];

            if ($_COOKIE['role']) {
                $role = $_COOKIE['role'];
                if ($role == "MKT" || $role  == "SUPER_MKT") {
                    if ($bean->sale_stage == "10") {
                        if ($bean->owned_branch != null && $bean->owned_branch != "") {
                            $query_3 = "UPDATE leads SET MKT_day_shared_BU = '{$now->format(\DateTime::ISO8601)}'  WHERE id = '{$bean->id}' AND deleted = '0'";
                            $GLOBALS['db']->query($query_3);
                        }
                        if ($bean->owned_branch != null && $bean->owned_branch != "" && $bean->ro_name != null && $bean->ro_name != "") {
                            $query_2 = "UPDATE leads SET day_shared_RO = '{$now->format(\DateTime::ISO8601)}' WHERE id = '{$bean->id}' AND deleted = '0'";
                            $GLOBALS['db']->query($query_2);
                        }
                    }
                } else if ($role == "BU") {
                    if ($bean->sale_stage == "10") {
                        if ($bean->owned_branch != null && $bean->owned_branch != "" && $bean->ro_name != null && $bean->ro_name != "") {
                            $query_2 = "UPDATE leads SET day_shared_RO = '{$now->format(\DateTime::ISO8601)}' WHERE id = '{$bean->id}' AND deleted = '0'";
                            $GLOBALS['db']->query($query_2);
                        }
                    }
                }
            }
            if ($bean->last_name == null || $bean->last_name == "") {
                $query_2 = "UPDATE leads SET last_name = '{$bean->fullname}' WHERE id = '{$bean->id}' AND deleted = '0'";
                $GLOBALS['db']->query($query_2);
            }

            if ($role == "BU") {
                SugarApplication::redirect("index.php?module=Leads&action=detail_bu&record={$bean->id}");
            }

            if ($role == "BU" || $role == "MKT" || $role  == "SUPER_MKT") {
                if ($bean->ro_name != "" && $bean->ro_name != null) {
                    if ($bean->sale_stage == "10") {

                        $alert = BeanFactory::newBean('Alerts');
                        $alert->name = 'Khách hàng mới';
                        $alert->description = 'Bạn được giao 1 khách hàng mới có facebook/zalo là: ' . $bean->facebook_or_zalo_name . ' vào lúc ' . str_replace(array('T', '+0700'), ' ', $now->format(\DateTime::ISO8601)) . ' !';
                        $alert->url_redirect = 'index.php';
                        $alert->target_module = 'Leads';
                        $alert->assigned_user_id = $bean->ro_name;
                        $alert->type = 'info';
                        $alert->is_read = 0;
                        $alert->save();

                        // Cấu hình webhook
                        $bot_api_key  = '6173643097:AAFUsQUZJfbs8lFL_fzmEmhRoBptAl8IEI0';
                        $bot_username = 'ChungNguyen10012000_bot';
                        $hook_url     = 'https://mkt.tranthu.vn/index.php?module=Leads&entryPoint=handle_telegram';

                        try {
                            //echo "Success";
                            $telegram = new \TelegramBot\Api\BotApi($bot_api_key);
                            $telegram->setWebhook($hook_url);
                        } catch (\TelegramBot\Api\Exception $e) {
                            //echo $e->getMessage($hook_url);
                        }

                        $query_ro_1 = "SELECT * FROM users WHERE deleted = 0 AND id = '{$bean->ro_name}'";
                        $result_ro_1 = $GLOBALS['db']->query($query_ro_1);
                        while ($rows_ro_1 = $GLOBALS['db']->fetchByAssoc($result_ro_1)) {
                            $data_source_id = $bean->data_sources;
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
                                    $telegram->sendMessage('-727735502', 'RO ' . $rows_ro_1['last_name'] . ' có khách hàng lúc ' . str_replace(array('T', '+0700'), ' ', $now->format(\DateTime::ISO8601)) . ' với nguồn data là: ' . $data . ' !');
                                }
                            }
                        }
                    }
                }
            }
        }



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


        $query_lead = "SELECT * FROM leads WHERE id = '{$bean->id}' AND deleted = 0";
        $result_lead = $GLOBALS['db']->query($query_lead);
        while ($rows = $GLOBALS['db']->fetchByAssoc($result_lead)) {

            if ($bean->contact_date != null && $bean->contact_date != "") {
                $lst[0] = $rows['contact_date'];
            } else {
                $lst[0] ="Không có dữ liệu";
            }

            $lst[1] = $rows['facebook_or_zalo_name'];

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

            foreach ($data_sources as $key => $datads) {
                if ($key == $data_source_id) {
                    $lst[2] = $datads;
                }
            }

            $lst[3] = $rows['phone_number_primary'];

            if ($bean->card_bark_type != null && $bean->card_bark_type != "") {
                $lst[4] = $rows['card_bark_type'];
            } else {
                $lst[4] ="Không có dữ liệu";
            }

            if ($bean->service != null && $bean->service != "") {
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
                foreach ($services as $key => $datasr) {
                    if ($key == $service_id) {
                        $lst[5] = $datasr;
                    }
                }
            } else {
                $lst[5] ="Không có dữ liệu";
            }

            if ($bean->bank != null && $bean->bank != "") {
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
                foreach ($banks as $key => $databk) {
                    if ($key == $bank_id) {
                        $lst[6] = $databk;
                    }
                }
            } else {
                $lst[6] ="Không có dữ liệu";
            }

            if ($bean->payment_day != null && $bean->payment_day != "") {
                $lst[7] = $rows['payment_day'];
            } else {
                $lst[7] ="Không có dữ liệu";
            }

            if ($bean->transaction_amount != null && $bean->transaction_amount != "") {
                $lst[8] = $rows['transaction_amount'];
            } else {
                $lst[8] ="Không có dữ liệu";
            }

            if ($bean->fee != null && $bean->fee != "") {
                $lst[9] = $rows['fee'];
            } else {
                $lst[9] ="Không có dữ liệu";
            }

            if ($bean->sale_stage != null && $bean->sale_stage != "") {
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
                foreach ($sale_stages as $key => $datass) {
                    if ($key == $sale_stage_id) {
                        $lst[10] = $datass;
                    }
                }
            } else {
                $lst[10] ="Không có dữ liệu";
            }

            if ($bean->lead_status != null && $bean->lead_status != "") {
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
                foreach ($lead_statuss as $key => $datals) {
                    if ($key == $lead_status_id) {
                        $lst[11] = $datals;
                    }
                }
            } else {
                $lst[11] ="Không có dữ liệu";
            }

            if ($bean->owned_branch != null && $bean->owned_branch != "") {
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
                    '12' => 'MKT',
                    'HCM_2' => 'HCM 2',
                    'HCM_3' => 'HCM 3',
                    'HCM_4' => 'HCM 4',
                );
                foreach ($owned_branchs as $key => $dataob) {
                    if ($key == $owned_branch_id) {
                        $lst[12] = $dataob;
                    }
                }
            } else {
                $lst[12] ="Không có dữ liệu";
            }

            if ($bean->ro_name != null && $bean->ro_name != "") {
                $lst[13] = "Không có dữ liệu";
                $query_1 = "SELECT * FROM users WHERE deleted = 0 AND id = '{$rows['ro_name']}'";
                $result_1 = $GLOBALS['db']->query($query_1);
                while ($rowsx = $GLOBALS['db']->fetchByAssoc($result_1)) {
                    $lst[13] = $rowsx['user_name'];
                }
            } else {
                $lst[13] ="Không có dữ liệu";
            }

            if ($bean->note != null && $bean->note != "") {
                $lst[14] = $rows['note'];
            } else {
                $lst[14] ="Không có dữ liệu";
            }


            if ($bean->fullname != null && $bean->fullname != "") {
                $lst[15] = $rows['fullname'];
            } else {
                $lst[15] ="Không có dữ liệu";
            }

            if ($bean->citizen_identification != null && $bean->citizen_identification != "") {
                $lst[16] = $rows['citizen_identification'];
            } else {
                $lst[16] ="Không có dữ liệu";
            }

            if ($bean->citizen_identification_issuance_date != null && $bean->citizen_identification_issuance_date != "") {
                $lst[17] = $rows['citizen_identification_issuance_date'];
            } else {
                $lst[17] ="Không có dữ liệu";
            }

            if ($bean->citizen_identification_issuance_place != null && $bean->citizen_identification_issuance_place != "") {
                $lst[18] = $rows['citizen_identification_issuance_place'];
            } else {
                $lst[18] ="Không có dữ liệu";
            }

            if ($bean->real_transaction_amount != null && $bean->real_transaction_amount != "") {
                $lst[19] = $rows['real_transaction_amount'];
            } else {
                $lst[19] ="Không có dữ liệu";
            }

            if ($bean->real_fee != null && $bean->real_fee != "") {
                $lst[20] = $rows['real_fee'];
            } else {
                $lst[20] ="Không có dữ liệu";
            }

            if ($bean->birthday != null && $bean->birthday != "") {
                $lst[21] = $rows['birthday'];
            } else {
                $lst[21] ="Không có dữ liệu";
            }

            if ($bean->successful_trading_day != null && $bean->successful_trading_day != "") {
                $lst[22] = $rows['successful_trading_day'];
            } else {
                $lst[22] ="Không có dữ liệu";
            }

            if ($bean->phone_number_extra != null && $bean->phone_number_extra != "") {
                $lst[23] = $rows['phone_number_extra'];
            } else {
                $lst[23] ="Không có dữ liệu";
            }

            if ($bean->career != null && $bean->career != "") {
                $lst[24] = $rows['career'];
            } else {
                $lst[24] ="Không có dữ liệu";
            }

            if ($bean->district_customer_live != null && $bean->district_customer_live != "") {
                $lst[25] = $rows['district_customer_live'];
            } else {
                $lst[25] ="Không có dữ liệu";
            }

            if ($rows['sale_stage_follow_level'] != null && $rows['sale_stage_follow_level'] != "") {
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
                foreach ($sale_stage_follow_levels as $key => $datassfl) {
                    if ($key == $sale_stage_follow_level_id) {
                        $lst[26] = $datassfl;
                    }
                }
            } else {
                $lst[26] ="Không có dữ liệu";
            }

            if ($rows['lead_status_follow_level'] != null && $rows['lead_status_follow_level'] != "") {
                $lead_status_follow_level_id = $rows['lead_status_follow_level'];
                $lead_status_follow_levels = array(
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
                foreach ($lead_status_follow_levels as $key => $datalsfl) {
                    if ($key == $lead_status_follow_level_id) {
                        $lst[27] = $datalsfl;
                    }
                }
            } else {
                $lst[27] ="Không có dữ liệu";
            }

            if ($rows['date_entered'] != null && $rows['date_entered'] != "") {
                $lst[28] = $rows['date_entered'];
            } else {
                $lst[28] ="Không có dữ liệu";
            }
        }

        $valuesx = [
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


        $body = new Google_Service_Sheets_ValueRange([
            'values' => $valuesx
        ]);

        //$GLOBALS['log']->fatal($valuesx);

        $params = [
            'valueInputOption' => 'RAW'
        ];

        

        // Kiểm tra xem trường 'date_entered' của lead có bằng với trường 'date_modified' hay không
        if ($bean->date_entered == $bean->date_modified ) {
            // Nếu bằng nhau, tức là lead đó là lead mới
            //$GLOBALS['log']->fatal($lst);
            if ($bean->ro_name != "" && $bean->ro_name != null) {
                // Delete ro choose last
                $query_ro_choose = "DELETE FROM ro_choose";
                $GLOBALS['db']->query($query_ro_choose);

                $query_insert_ro_choose = "INSERT INTO ro_choose  (lead_id) VALUES ('{$bean->ro_name}')";
                $GLOBALS['db']->query($query_insert_ro_choose);
            }

            $range = 'DATA CHUNG';
            $response = $service->spreadsheets_values->get($spreadsheetId, $range);
            $values = $response->getValues();
            //$rangeToInsert = 'DATA CHUNG!A' . (count($values) + 1);
            $rangeToInsert = 'DATA CHUNG!A' . (count($values) + 1) . ':AC' . (count($values) + 1);
            $result = $service->spreadsheets_values->append($spreadsheetId, $rangeToInsert, $body, $params);
            $GLOBALS['log']->fatal("Created");
        } else {
            $range = 'DATA CHUNG';
            $response = $service->spreadsheets_values->get($spreadsheetId, $range);
            $values = $response->getValues();
            $key = $bean->phone_number_primary;
            if (strlen($key) == 9) {
                $key = "0" . $key; // Thêm số 0 vào đầu nếu độ dài là 9
            } elseif (strlen($key) == 11) {
                $key = substr($key, 2); // Xóa 2 kí tự đầu nếu độ dài là 11
                $key = "0" . $key; // Thêm số 0 vào đầu
            }
            foreach ($values as $row => $datav) {
                if (($datav[3] == substr($key, 1) ||  $datav[3] == $key) && $datav[28] == $lst[28]) {
                    //$rangeToUpdate = 'DATA CHUNG!A' . ($row + 1) . ':Z' . ($row + 1);
                    $rangeToUpdate = 'DATA CHUNG!A' . ($row + 1) . ':AC' . ($row + 1);
                    $result = $service->spreadsheets_values->update($spreadsheetId, $rangeToUpdate, $body, $params);
                }
            }
            $GLOBALS['log']->fatal("Updated");
        }
    }
}
