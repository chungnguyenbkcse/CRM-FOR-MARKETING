<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

$dictionary['branch_ro'] = array(
    'table' => 'branch_ro', 
    'fields' => array(
        array('name' => 'id', 'type' => 'int','auto_increment' => true),
        array('name' => 'branch_id', 'type' => 'varchar', 'len' => '255'),
        array('name' => 'branch_name', 'type' => 'varchar', 'len' => '255'),
        array('name' => 'user_id', 'type' => 'varchar', 'len' => '255'),
        array('name' => 'user_name', 'type' => 'varchar', 'len' => '255'),
    ), 'indices' => array(
        array('name' => 'branch_ropk', 'type' => 'primary', 'fields' => array('id'))
    )
);