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
      'id' => 
      array (
        'name' => 'id',
        'default' => true,
        'width' => '10%',
      ),
      'citizen_identification' => 
      array (
        'name' => 'citizen_identification',
        'default' => true,
        'width' => '10%',
      ),
      'facebook_or_zalo_name' => 
      array (
        'name' => 'facebook_or_zalo_name',
        'default' => true,
        'width' => '10%',
      ),
      'fullname' => 
      array (
        'name' => 'fullname',
        'default' => true,
        'width' => '10%',
      ),
      'phone_number_primary' => 
      array (
        'name' => 'phone_number_primary',
        'default' => true,
        'width' => '10%',
      ),
      'ro_name' => 
      array (
        'name' => 'ro_name',
        'type' => 'multienum',
        'function' => 'query_ro_name_options',
      ),
      'card_bark_type' => 
      array (
        'name' => 'card_bark_type',
        'type' => 'multienum',
        'default' => true,
        'width' => '10%',
      ),
      'owned_branch' => 
      array (
        'name' => 'owned_branch',
        'type' => 'multienum',
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
      'ngay_phat_hanh_the' => 
      array (
        'name' => 'ngay_phat_hanh_the',
        'default' => false,
        'label' => 'LBL_NGAY_PHAT_HANH_THE',
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

function query_ro_name_options() {
  $list = array("0" => "Choose");
    $query_securitygroups = "SELECT * FROM securitygroups WHERE deleted = 0";
    $result_securitygroups = $GLOBALS['db']->query($query_securitygroups);
    while($rows_securitygroups = $GLOBALS['db']->fetchByAssoc($result_securitygroups)){
        $is_group_ro = false;
        $groupSecurityId = $rows_securitygroups['id'];
        $query_securitygroups_acl_roles = "SELECT role_id FROM securitygroups_acl_roles WHERE deleted = 0 AND securitygroup_id = '{$groupSecurityId}'";
        $result_securitygroups_acl_roles = $GLOBALS['db']->query($query_securitygroups_acl_roles);
        while ($rows_securitygroups_acl_roles = $GLOBALS['db']->fetchByAssoc($result_securitygroups_acl_roles)) {
            $role_id = $rows_securitygroups_acl_roles['role_id'];
            $query_acl_roles_actions = "SELECT action_id, access_override  FROM acl_roles_actions WHERE deleted = 0 AND role_id = '{$role_id}'";
            $result_acl_roles_actions = $GLOBALS['db']->query($query_acl_roles_actions);
            while ($rows_acl_roles_actions = $GLOBALS['db']->fetchByAssoc($result_acl_roles_actions)) {
                $action_id = $rows_acl_roles_actions['action_id'];
                $query_get_name_action = "SELECT name, category FROM acl_actions WHERE deleted = 0 AND id = '{$action_id}'";
                $result_get_name_action = $GLOBALS['db']->query($query_get_name_action);
                while ($rows_get_name_action = $GLOBALS['db']->fetchByAssoc($result_get_name_action)) {
                    if ($rows_get_name_action['name'] == 'ro' && $rows_get_name_action['category'] == 'Leads') {
                        if ($rows_acl_roles_actions['access_override'] == 89) {
                            $is_group_ro = true;
                        }
                    }

                }
            }
        }

        if ($is_group_ro == true) {
            $query_users = "SELECT * FROM users WHERE deleted = '0' AND id IN (SELECT user_id FROM securitygroups_users WHERE deleted = 0 AND securitygroup_id = '{$groupSecurityId}')";
            $result_users = $GLOBALS['db']->query($query_users);
            while($row_users = $GLOBALS['db']->fetchByAssoc($result_users)){
                $list[$row_users['id']] = $row_users['user_name'];
            }
        }

    }
    return $list;
    
}
;
?>
