<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

$dictionary['relationship_phone_many'] = array(
    'table' => 'relationship_phone_many', 
    'fields' => array(
        array('name' => 'id', 'type' => 'int','auto_increment' => true),
        array('name' => 'lead_id', 'type' => 'varchar', 'len' => '36'),
        array('name' => 'phone_many', 'type' => 'varchar', 'len' => '255')
    ), 'indices' => array(
        array('name' => 'relationship_phone_manypk', 'type' => 'primary', 'fields' => array('id'))
    )
);