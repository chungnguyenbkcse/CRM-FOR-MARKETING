<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

$dictionary['relationship_level_lead_status'] = array(
    'table' => 'relationship_level_lead_status', 
    'fields' => array(
        array('name' => 'id', 'type' => 'varchar', 'len' => '36',),
        array('name' => 'level', 'type' => 'varchar', 'len' => '36'),
        array('name' => 'lead_status_id', 'type' => 'varchar', 'len' => '255'),
    ), 'indices' => array(
        array('name' => 'relationship_level_lead_statuspk', 'type' => 'primary', 'fields' => array('id'))
    )
);