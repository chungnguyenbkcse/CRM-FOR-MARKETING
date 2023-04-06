<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

$dictionary['relationship_card_lead'] = array(
    'table' => 'relationship_card_lead', 
    'fields' => array(
        array('name' => 'id', 'type' => 'int','auto_increment' => true),
        array('name' => 'lead_id', 'type' => 'varchar', 'len' => '36'),
        array('name' => 'card_number', 'type' => 'varchar', 'len' => '255'),
        array('name' => 'bank', 'type' => 'varchar', 'len' => '255'),
        array('name' => 'card_bank_type', 'type' => 'varchar', 'len' => '255'),
        array('name' => 'payment_day', 'type' => 'int'),
        array('name' => 'card_expiration_date', 'type' => 'date'),
        array('name' => 'successful_trading_day', 'type' => 'date'),
        array('name' => 'real_total_monthly_transaction_amount_N_1', 'type' => 'double'),
        array('name' => 'real_total_monthly_transaction_amount_N', 'type' => 'double'),
        array('name' => 'real_fee_N_1', 'type' => 'double'),
        array('name' => 'real_fee_N', 'type' => 'double'),
        array('name' => 'type_of_transaction_month_N_1', 'type' => 'varchar', 'len' => '255'),
        array('name' => 'type_of_transaction_month_N', 'type' => 'varchar', 'len' => '255'),
        array('name' => 'sale_stage', 'type' => 'varchar', 'len' => '255'),
        array('name' => 'lead_status', 'type' => 'varchar', 'len' => '255'),
    ), 'indices' => array(
        array('name' => 'relationship_card_leadpk', 'type' => 'primary', 'fields' => array('id'))
    )
);