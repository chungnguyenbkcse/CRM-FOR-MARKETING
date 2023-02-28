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


class Handle
{
    public $module = 'Leads';

    public function handle_after_save($bean, $event, $arguments)
    {
        date_default_timezone_set('Asia/Ho_Chi_Minh');
        $now = new DateTime();

        /* if ($_COOKIE['ro_modified_sale_stage']) {  
            $ro_modified_sale_stage =  $_COOKIE['ro_modified_sale_stage'];
            if ($ro_modified_sale_stage == '1') {
                $query_2 = "UPDATE leads SET ro_modified_sale_stage = '1'  WHERE id = '{$bean->id}' AND deleted = '0'";
                $GLOBALS['db']->query($query_2);
                setcookie("ro_modified_sale_stage", "", time() - 3600);
                setcookie("ro_modified_sale_stage", '0', time() + (86400 * 30), "/");
            }              
        
        } */
        
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
            }
            else {
                $query_6 = "SELECT * FROM users WHERE deleted = 0 AND user_name = '{$bean->ro_name}'";
                $result_6 = $GLOBALS['db']->query($query_6);
                $rows_6 = $GLOBALS['db']->fetchByAssoc($result_6);
                $time = $rows_6['date_entered'];
                /* $query_5 = "INSERT INTO ro_least (id, time, bu) VALUES ('1', '{$time}', '{$bean->owned_branch}');";
                $GLOBALS['db']->query($query_5); */
            }
        }

        $query_1 = "UPDATE leads SET date_modified = '{$now->format(\DateTime::ISO8601)}'  WHERE id = '{$bean->id}' AND deleted = '0'";
        $GLOBALS['db']->query($query_1);
        if ($_COOKIE['role']){
            $role = $_COOKIE['role'];

            if ($_COOKIE['role']){
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
                }
                else if ($role == "BU") {
                    if ($bean->sale_stage == "10") {
                        if ($bean->owned_branch != null && $bean->owned_branch != "" && $bean->ro_name != null && $bean->ro_name != "") {
                            $query_2 = "UPDATE leads SET day_shared_RO = '{$now->format(\DateTime::ISO8601)}' WHERE id = '{$bean->id}' AND deleted = '0'";
                            $GLOBALS['db']->query($query_2);
                        }
                    }
                }
                
    
            }
            if ($bean->last_name == null || $bean->last_name == ""){
                $query_2 = "UPDATE leads SET last_name = '{$bean->fullname}' WHERE id = '{$bean->id}' AND deleted = '0'";
                $GLOBALS['db']->query($query_2);
            }
            
            if ($role == "BU"){
                SugarApplication::redirect("index.php?module=Leads&action=detail_bu&record={$bean->id}");
            }

            if ($role == "BU" || $role == "MKT" || $role  == "SUPER_MKT") {
                if ($bean->ro_name != "" && $bean->ro_name != null) {
                    if ($bean->sale_stage == "10") {
                        $query = "SELECT id FROM users WHERE user_name = '{$bean->ro_name}'";
                        $result = $GLOBALS['db']->query($query);
                        while($rows = $GLOBALS['db']->fetchByAssoc($result)){
                            $alert = BeanFactory::newBean('Alerts');
                            $alert->name = 'Khách hàng mới';
                            $alert->description = 'Bạn được giao 1 khách hàng mới!';
                            $alert->url_redirect = 'index.php';
                            $alert->target_module = 'Leads';
                            $alert->assigned_user_id = $rows['id'];
                            $alert->type = 'info';
                            $alert->is_read = 0;
                            $alert->save();
                        }
                    }
                }
            }
        }
    }
}