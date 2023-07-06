<?php
$query = "SELECT * FROM leads WHERE ro_name = '714c30cb-8cab-ab8e-29a1-64800c5f4e5e' AND deleted = 0";
$result = $GLOBALS['db']->query($query);
while($rows = $GLOBALS['db']->fetchByAssoc($result)){
    $lead_id = $rows['id'];
    $query1 = "UPDATE leads SET ro_name = 'b38f7108-9e87-267b-62a9-64800cf3e9c1', sale_stage = '1', lead_status = '1'  WHERE id = '{$lead_id}'";
    $GLOBALS['db']->query($query1);
}