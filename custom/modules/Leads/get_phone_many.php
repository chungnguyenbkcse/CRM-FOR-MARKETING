<?php
if (isset($_GET['lead_id'])) {
    $lead_id = $_GET['lead_id'];
    $query_card = "SELECT * FROM phone_many WHERE lead_id = '{$lead_id}'";
    $result_card = $GLOBALS['db']->query($query_card);
    $res = array();
    while($row_card = $GLOBALS['db']->fetchByAssoc($result_card)){
        $res[] =  $row_card['phone_many'];
    }

    echo json_encode($res);
}