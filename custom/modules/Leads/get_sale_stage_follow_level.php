<?php
$lead_status_id = $_GET['lead_status_id'];
$lead_status_follow_level = $_GET['lead_status_follow_level'];


$level_lead_status = 0;
$level_lead_status_follow_level = 0;

$query_get_lead_status_follow_level = "SELECT * FROM relationship_level_lead_status WHERE lead_status_id = '{$lead_status_id}'";
$result_get_lead_status_follow_level =  $GLOBALS['db']->query($query_get_lead_status_follow_level);   
while($row1s = $GLOBALS['db']->fetchByAssoc($result_get_lead_status_follow_level)){
    $level_lead_status = intval($row1s['level']);
}

$query_get_lead_status_follow_level_1 = "SELECT * FROM relationship_level_lead_status WHERE lead_status_id = '{$lead_status_follow_level}'";
$result_get_lead_status_follow_level_1 =  $GLOBALS['db']->query($query_get_lead_status_follow_level_1);   
while($row2s = $GLOBALS['db']->fetchByAssoc($result_get_lead_status_follow_level_1)){
    $level_lead_status_follow_level = intval($row2s['level']);
}

if ($level_lead_status > $level_lead_status_follow_level) {
    echo "true";
}
else {
    echo "false";
}