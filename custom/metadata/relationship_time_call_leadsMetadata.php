<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

$dictionary['relationship_time_call_leads'] = array(
    'table' => 'relationship_time_call_leads', 
    'fields' => array(
        array('name' => 'id', 'type' => 'varchar', 'len' => '36',),
        array('name' => 'lead_id', 'type' => 'varchar', 'len' => '36'),
        array('name' => 'time', 'type' => 'varchar', 'len' => '255'),
    ), 'indices' => array(
        array('name' => 'relationship_time_call_leadspk', 'type' => 'primary', 'fields' => array('id'))
    )
);