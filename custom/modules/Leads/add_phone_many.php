<?php
function addCardNumber($arr, $lead_id) {
    $query_1 = "DELETE FROM relationship_phone_many WHERE lead_id = '${lead_id}'";
    $GLOBALS['db']->query($query_1);
    foreach($arr as $key => $value){
        $result =   $GLOBALS['db']->query("SELECT count(*) as total from relationship_phone_many");
        $data   =  $GLOBALS['db']->fetchByAssoc($result);
        $idNew  =  $data['total'] + 1;
        $query_5 = "INSERT INTO relationship_phone_many (id, lead_id, phone_many) VALUES ('${idNew}', '{$lead_id}', '{$value}');";
        $GLOBALS['db']->query($query_5);
    }
}

if (isset($_GET['arr']) && isset($_GET['lead_id'])) {
    $arr = $_GET['arr'];
    $lead_id = $_GET['lead_id'];
    addCardNumber($arr, $lead_id);
}