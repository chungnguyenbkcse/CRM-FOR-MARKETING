<?php
$searchdefs ['Leads'] = 
array (
  'layout' => 
  array (
    'basic_search' => 
    array (
      'fullname' => 
      array (
        'type' => 'varchar',
        'label' => 'LBL_FULLNAME',
        'width' => '10%',
        'default' => true,
        'name' => 'fullname',
      ),
      'open_only' => 
      array (
        'name' => 'open_only',
        'label' => 'LBL_OPEN_ITEMS',
        'type' => 'bool',
        'default' => true,
        'width' => '10%',
      ),
      'favorites_only' => 
      array (
        'name' => 'favorites_only',
        'label' => 'LBL_FAVORITES_FILTER',
        'type' => 'bool',
        'default' => true,
        'width' => '10%',
      ),
    ),
    'advanced_search' => 
    array (
      'citizen_identification' => 
      array (
        'name' => 'citizen_identification',
        'default' => true,
        'width' => '10%',
      ),
      'phone_number_primary' => 
      array (
        'name' => 'phone_number_primary',
        'default' => true,
        'width' => '10%',
      ),
      'card_bark_type' => 
      array (
        'name' => 'card_bark_type',
        'default' => true,
        'width' => '10%',
      ),
      'bank' => 
      array (
        'name' => 'bank',
        'default' => true,
        'width' => '10%',
      ),
      'sale_stage' => 
      array (
        'name' => 'sale_stage',
        'default' => true,
        'width' => '10%',
      ),
      'lead_status' => 
      array (
        'name' => 'lead_status',
        'default' => true,
        'width' => '10%',
      ),
      'email' => 
      array (
        'name' => 'email',
        'default' => false,
        'label' => 'LBL_CARD_NUMBER',
        'width' => '10%',
      ),
      'data_sources' => 
      array (
        'name' => 'data_sources',
        'type' => 'multienum',
        'default' => false,
        'label' => 'LBL_DATA_SOURCES',
        'width' => '10%',
      ),
      'date_modified' => 
      array (
        'name' => 'date_modified',
        'default' => false,
        'label' => 'LBL_DATE_MODIFIED',
        'width' => '10%',
      ),
    ),
  ),
  'templateMeta' => 
  array (
    'maxColumns' => '3',
    'maxColumnsBasic' => '4',
    'widths' => 
    array (
      'label' => '10',
      'field' => '30',
    ),
  ),
);
;
?>
