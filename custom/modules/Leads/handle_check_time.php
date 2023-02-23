<?php
function checkTime($date2) {
    date_default_timezone_set('Asia/Ho_Chi_Minh');
    $now = new DateTime();
    $date1 = new DateTime($date2);
    $difference_in_seconds = $now->format('U') - $date1->format('U');
    return $difference_in_seconds;
}

$res = "";

if (isset($_GET['id'])) {
    $query = "SELECT * FROM leads WHERE id = '{$_GET['id']}' AND sale_stage = '10' AND deleted = 0";
    $result = $GLOBALS['db']->query($query);
    while($rows = $GLOBALS['db']->fetchByAssoc($result)){
        if ($rows['owned_branch'] != null && $rows['owned_branch'] != "") {
            if ($rows['ro_name'] != null && $rows['ro_name'] != "") {
                if (checkTime($rows['day_shared_RO']) > 900 && $rows['sale_stage'] != '' && $rows['lead_status'] != '' && $rows['is_record'] == 0) {
                    $res .= $rows['facebook_or_zalo_name'];
                    echo $res;
                    $query_1 = "UPDATE leads SET sale_stage = '11', lead_status = '23' WHERE id = '{$rows['id']}'";
                    $GLOBALS['db']->query($query_1);
                }
            }
            else {
                if (checkTime($rows['MKT_day_shared_BU']) > 900 && $rows['sale_stage'] != '' && $rows['lead_status'] != '' && $rows['is_record'] == 0) {
                    $res .= $rows['facebook_or_zalo_name'];
                    echo $res;
                    $query_1 = "UPDATE leads SET sale_stage = '11', lead_status = '23' WHERE id = '{$rows['id']}'";
                    $GLOBALS['db']->query($query_1);
                }
            }
        }
    }
        
    
    echo $res;
}
else {
    if ($_COOKIE['role'] == 'MKT' || $_COOKIE['role'] == 'SUPER_MKT') {
        $user = BeanFactory::getBean('Users', $_COOKIE['ck_login_id_20']);
        $query = "SELECT * FROM leads WHERE sale_stage = '10' AND deleted = 0";
        $result = $GLOBALS['db']->query($query);
        while($rows = $GLOBALS['db']->fetchByAssoc($result)){
            if ($rows['owned_branch'] != null && $rows['owned_branch'] != "") {
                if ($rows['ro_name'] != null && $rows['ro_name'] != "") {
                    if (checkTime($rows['day_shared_RO']) > 900 && $rows['sale_stage'] != '' && $rows['lead_status'] != '' && $rows['is_record'] == 0) {
                        $res .= $rows['facebook_or_zalo_name'];
                        echo $res;
                        $query_1 = "UPDATE leads SET sale_stage = '11', lead_status = '23' WHERE id = '{$rows['id']}'";
                        $GLOBALS['db']->query($query_1);
                    }
                }
                else {
                    if (checkTime($rows['MKT_day_shared_BU']) > 900 && $rows['sale_stage'] != '' && $rows['lead_status'] != '' && $rows['is_record'] == 0) {
                        $res .= $rows['facebook_or_zalo_name'];
                        echo $res;
                        $query_1 = "UPDATE leads SET sale_stage = '11', lead_status = '23' WHERE id = '{$rows['id']}'";
                        $GLOBALS['db']->query($query_1);
                    }
                }
            }
        }
            
        
        echo $res;
    }
    /* else if ($_COOKIE['role'] == 'BU_Q10'){
        $user = BeanFactory::getBean('Users', $_COOKIE['ck_login_id_20']);
        $query = "SELECT * FROM leads WHERE owned_branch = '2' AND sale_stage = '10' AND deleted = 0";
        $result = $GLOBALS['db']->query($query);
        while($rows = $GLOBALS['db']->fetchByAssoc($result)){
            if ($rows['owned_branch'] != null && $rows['owned_branch'] != "") {
                if ($rows['ro_name'] != null && $rows['ro_name'] != "") {
                    if (checkTime($rows['day_shared_RO']) > 900 && $rows['sale_stage'] != '' && $rows['lead_status'] != '' && $rows['is_record'] == 0) {
                        $res .= $rows['facebook_or_zalo_name'];
                        echo $res;
                        $query_1 = "UPDATE leads SET sale_stage = '11', lead_status = '23' WHERE id = '{$rows['id']}'";
                        $GLOBALS['db']->query($query_1);
                    }
                }
                else {
                    if (checkTime($rows['MKT_day_shared_BU']) > 900 && $rows['sale_stage'] != '' && $rows['lead_status'] != '' && $rows['is_record'] == 0) {
                        $res .= $rows['facebook_or_zalo_name'];
                        echo $res;
                        $query_1 = "UPDATE leads SET sale_stage = '11', lead_status = '23' WHERE id = '{$rows['id']}'";
                        $GLOBALS['db']->query($query_1);
                    }
                }
            }
        }
            
        
        echo $res;
    } */
    /* else if ($_COOKIE['role'] == 'BU_TB'){
        $user = BeanFactory::getBean('Users', $_COOKIE['ck_login_id_20']);
        $query = "SELECT * FROM leads WHERE owned_branch = '3' AND sale_stage = '10' AND deleted = 0";
        $result = $GLOBALS['db']->query($query);
        while($rows = $GLOBALS['db']->fetchByAssoc($result)){
            if ($rows['owned_branch'] != null && $rows['owned_branch'] != "") {
                if ($rows['ro_name'] != null && $rows['ro_name'] != "") {
                    if (checkTime($rows['day_shared_RO']) > 900 && $rows['sale_stage'] != '' && $rows['lead_status'] != '' && $rows['is_record'] == 0) {
                        $res .= $rows['facebook_or_zalo_name'];
                        echo $res;
                        $query_1 = "UPDATE leads SET sale_stage = '11', lead_status = '23' WHERE id = '{$rows['id']}'";
                        $GLOBALS['db']->query($query_1);
                    }
                }
                else {
                    if (checkTime($rows['MKT_day_shared_BU']) > 900 && $rows['sale_stage'] != '' && $rows['lead_status'] != '' && $rows['is_record'] == 0) {
                        $res .= $rows['facebook_or_zalo_name'];
                        echo $res;
                        $query_1 = "UPDATE leads SET sale_stage = '11', lead_status = '23' WHERE id = '{$rows['id']}'";
                        $GLOBALS['db']->query($query_1);
                    }
                }
            }
        }
            
        
        echo $res;
    } */
    /* else if ($_COOKIE['role'] == 'BU_TELE'){
        $user = BeanFactory::getBean('Users', $_COOKIE['ck_login_id_20']);
        $query = "SELECT * FROM leads WHERE owned_branch = '4' AND sale_stage = '10' AND deleted = 0";
        $result = $GLOBALS['db']->query($query);
        while($rows = $GLOBALS['db']->fetchByAssoc($result)){
            if ($rows['owned_branch'] != null && $rows['owned_branch'] != "") {
                if ($rows['ro_name'] != null && $rows['ro_name'] != "") {
                    if (checkTime($rows['day_shared_RO']) > 900 && $rows['sale_stage'] != '' && $rows['lead_status'] != '' && $rows['is_record'] == 0) {
                        $res .= $rows['facebook_or_zalo_name'];
                        echo $res;
                        $query_1 = "UPDATE leads SET sale_stage = '11', lead_status = '23' WHERE id = '{$rows['id']}'";
                        $GLOBALS['db']->query($query_1);
                    }
                }
                else {
                    if (checkTime($rows['MKT_day_shared_BU']) > 900 && $rows['sale_stage'] != '' && $rows['lead_status'] != '' && $rows['is_record'] == 0) {
                        $res .= $rows['facebook_or_zalo_name'];
                        echo $res;
                        $query_1 = "UPDATE leads SET sale_stage = '11', lead_status = '23' WHERE id = '{$rows['id']}'";
                        $GLOBALS['db']->query($query_1);
                    }
                }
            }
        }
            
        
        echo $res;
    } */
   /*  else if ($_COOKIE['role'] == 'BU_DL_TB'){
        $user = BeanFactory::getBean('Users', $_COOKIE['ck_login_id_20']);
        $query = "SELECT * FROM leads WHERE owned_branch = '5' AND sale_stage = '10' AND deleted = 0";
        $result = $GLOBALS['db']->query($query);
        while($rows = $GLOBALS['db']->fetchByAssoc($result)){
            if ($rows['owned_branch'] != null && $rows['owned_branch'] != "") {
                if ($rows['ro_name'] != null && $rows['ro_name'] != "") {
                    if (checkTime($rows['day_shared_RO']) > 900 && $rows['sale_stage'] != '' && $rows['lead_status'] != '' && $rows['is_record'] == 0) {
                        $res .= $rows['facebook_or_zalo_name'];
                        echo $res;
                        $query_1 = "UPDATE leads SET sale_stage = '11', lead_status = '23' WHERE id = '{$rows['id']}'";
                        $GLOBALS['db']->query($query_1);
                    }
                }
                else {
                    if (checkTime($rows['MKT_day_shared_BU']) > 900 && $rows['sale_stage'] != '' && $rows['lead_status'] != '' && $rows['is_record'] == 0) {
                        $res .= $rows['facebook_or_zalo_name'];
                        echo $res;
                        $query_1 = "UPDATE leads SET sale_stage = '11', lead_status = '23' WHERE id = '{$rows['id']}'";
                        $GLOBALS['db']->query($query_1);
                    }
                }
            }
        }
            
        
        echo $res;
    } */
    /* else if ($_COOKIE['role'] == 'BU_NTT'){
        $user = BeanFactory::getBean('Users', $_COOKIE['ck_login_id_20']);
        $query = "SELECT * FROM leads WHERE owned_branch = '1' AND sale_stage = '10' AND deleted = 0";
        $result = $GLOBALS['db']->query($query);
        while($rows = $GLOBALS['db']->fetchByAssoc($result)){
            if ($rows['owned_branch'] != null && $rows['owned_branch'] != "") {
                if ($rows['ro_name'] != null && $rows['ro_name'] != "") {
                    if (checkTime($rows['day_shared_RO']) > 900 && $rows['sale_stage'] != '' && $rows['lead_status'] != '' && $rows['is_record'] == 0) {
                        $res .= $rows['facebook_or_zalo_name'];
                        echo $res;
                        $query_1 = "UPDATE leads SET sale_stage = '11', lead_status = '23' WHERE id = '{$rows['id']}'";
                        $GLOBALS['db']->query($query_1);
                    }
                }
                else {
                    if (checkTime($rows['MKT_day_shared_BU']) > 900 && $rows['sale_stage'] != '' && $rows['lead_status'] != '' && $rows['is_record'] == 0) {
                        $res .= $rows['facebook_or_zalo_name'];
                        echo $res;
                        $query_1 = "UPDATE leads SET sale_stage = '11', lead_status = '23' WHERE id = '{$rows['id']}'";
                        $GLOBALS['db']->query($query_1);
                    }
                }
            }
        }
            
        
        echo $res;
    } */
    else if ($_COOKIE['role'] == 'RO') {
        if (isset($_COOKIE['ck_login_id_20'])) {
            $user = BeanFactory::getBean('Users', $_COOKIE['ck_login_id_20']);
            $query = "SELECT * FROM leads WHERE ro_name = '{$user->user_name}' AND sale_stage = '10' AND deleted = 0";
            $result = $GLOBALS['db']->query($query);
            while($rows = $GLOBALS['db']->fetchByAssoc($result)){
                if ($rows['modified_user_id'] != $user->id) {
                    if (checkTime($rows['day_shared_RO']) > 900 && $rows['sale_stage'] != '' && $rows['lead_status'] != '' && $rows['is_record'] == 0) {
                        $res .= $rows['facebook_or_zalo_name'];
                        echo $res;
                        $query_1 = "UPDATE leads SET sale_stage = '11', lead_status = '23' WHERE id = '{$rows['id']}'";
                        $GLOBALS['db']->query($query_1);
                    }
                }
            }
                
            
            echo $res;
        }
    }
}