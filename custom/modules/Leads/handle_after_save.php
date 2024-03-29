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
    }
}
