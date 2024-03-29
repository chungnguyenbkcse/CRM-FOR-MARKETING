<?php
/**
 *
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2013 SugarCRM Inc.
 *
 * SuiteCRM is an extension to SugarCRM Community Edition developed by SalesAgility Ltd.
 * Copyright (C) 2011 - 2018 SalesAgility Ltd.
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY SUGARCRM, SUGARCRM DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Affero General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 *
 * You can contact SugarCRM, Inc. headquarters at 10050 North Wolfe Road,
 * SW2-130, Cupertino, CA 95014, USA. or at email address contact@sugarcrm.com.
 *
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 *
 * In accordance with Section 7(b) of the GNU Affero General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * SugarCRM" logo and "Supercharged by SuiteCRM" logo. If the display of the logos is not
 * reasonably feasible for technical reasons, the Appropriate Legal Notices must
 * display the words "Powered by SugarCRM" and "Supercharged by SuiteCRM".
 */

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

require_once('include/templates/TemplateGroupChooser.php');


class SavedSearch extends SugarBean
{
    public $db;
    public $field_name_map;

    // Stored fields
    public $id;
    public $date_entered;
    public $date_modified;
    public $assigned_user_id;
    public $assigned_user_name;
    public $modified_by_name;
    public $name;
    public $description;
    public $content;
    public $search_module;

    public $object_name = 'SavedSearch';
    public $table_name = 'saved_search';

    public $module_dir = 'SavedSearch';
    public $field_defs = array();
    public $field_defs_map = array();

    public $columns;

    public function __construct($columns = array(), $orderBy = null, $sortOrder = 'DESC')
    {
        parent::__construct();
        $this->columns = $columns;
        $this->orderBy = $orderBy;
        $this->sortOrder = $sortOrder;
        $this->setupCustomFields('SavedSearch');
        foreach ($this->field_defs as $field) {
            $this->field_name_map[$field['name']] = $field;
        }
    }


    public function userForRole($role)
    {
        $list = array();
        $query_securitygroups = "SELECT * FROM securitygroups WHERE deleted = 0";
        $result_securitygroups = $GLOBALS['db']->query($query_securitygroups);
        while($rows_securitygroups = $GLOBALS['db']->fetchByAssoc($result_securitygroups)){
            $is_group = false;
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
                        if ($rows_get_name_action['name'] == $role && $rows_get_name_action['category'] == 'Leads') {
                            if ($rows_acl_roles_actions['access_override'] == 89) {
                                $is_group = true;
                            }
                        }

                    }
                }
            }

            if ($is_group == true) {
                $query_users = "SELECT * FROM users WHERE deleted = '0' AND id IN (SELECT user_id FROM securitygroups_users WHERE deleted = 0 AND securitygroup_id = '{$groupSecurityId}')";
                $result_users = $GLOBALS['db']->query($query_users);
                while($row_users = $GLOBALS['db']->fetchByAssoc($result_users)){
                    $list[] = $row_users['id'];
                }
            }

        }

        return $list;
    }

    /**
     * @deprecated deprecated since version 7.6, PHP4 Style Constructors are deprecated and will be remove in 7.8, please update your code, use __construct instead
     */
    public function SavedSearch($columns = array(), $orderBy = null, $sortOrder = 'DESC')
    {
        $deprecatedMessage = 'PHP4 Style Constructors are deprecated and will be remove in 7.8, please update your code';
        if (isset($GLOBALS['log'])) {
            $GLOBALS['log']->deprecated($deprecatedMessage);
        } else {
            trigger_error($deprecatedMessage, E_USER_DEPRECATED);
        }
        self::__construct($columns, $orderBy, $sortOrder);
    }

    // Saved Search Form
    public function getForm($module, $inline = true, $orderBySelectOnly = false)
    {
        global $current_user, $currentModule, $current_language, $app_strings;
        $db = DBManagerFactory::getInstance();

        $json = getJSONobj();

        $saved_search_mod_strings = return_module_language($current_language, 'SavedSearch');

        $query = 'SELECT id, name FROM saved_search
				  WHERE
					deleted = \'0\' AND
				  	assigned_user_id = \'' . $current_user->id . '\' AND
					search_module =  \'' . $module . '\'
				  ORDER BY name';
        $result = $db->query($query, true, "Error filling in saved search list: ");

        $savedSearchArray['_none'] = $app_strings['LBL_NONE'];
        while ($row = $db->fetchByAssoc($result, -1, false)) {
            $savedSearchArray[$row['id']] = htmlspecialchars($row['name'], ENT_QUOTES);
        }
        $sugarSmarty = new Sugar_Smarty();
        $sugarSmarty->assign('SEARCH_MODULE', $module);
        $sugarSmarty->assign('MOD', $saved_search_mod_strings);
        $sugarSmarty->assign('DELETE', $app_strings['LBL_DELETE_BUTTON_LABEL']);
        $sugarSmarty->assign('UPDATE', $app_strings['LBL_UPDATE']);
        $sugarSmarty->assign('SAVE', $app_strings['LBL_SAVE_BUTTON_LABEL']);

        $chooser = $this->getTemplateGroupChooser($module);

        $sugarSmarty->assign('columnChooser', $chooser->display());

        $sugarSmarty->assign('selectedOrderBy', $this->orderBy);
        if (empty($this->sortOrder)) {
            $this->sortOrder = 'ASC';
        }
        $sugarSmarty->assign('selectedSortOrder', $this->sortOrder);

        $lastSavedView = (empty($_SESSION['LastSavedView'][$module]) ? '' : $_SESSION['LastSavedView'][$module]);
        $sugarSmarty->assign('columnsMeta', $json->encode($this->columns));
        $sugarSmarty->assign('lastSavedView', $lastSavedView);
        $sugarSmarty->assign('SAVED_SEARCHES_OPTIONS', get_select_options_with_id($savedSearchArray, $lastSavedView));

        $json = getJSONobj();

        $sugarSmarty->assign('orderBySelectOnly', $orderBySelectOnly);

        return $sugarSmarty->fetch('modules/SavedSearch/SavedSearchForm.tpl');
    }

    public function getTemplateGroupChooser($module)
    {
        global $app_strings;

        // Column Chooser
        $chooser = new TemplateGroupChooser();

        $chooser->args['id'] = 'edit_tabs';
        $chooser->args['left_size'] = 7;
        $chooser->args['right_size'] = 7;
        $chooser->args['values_array'][0] = array();
        $chooser->args['values_array'][1] = array();

        if (isset($_REQUEST['saved_search_select']) && $_REQUEST['saved_search_select'] != '_none') {
            $this->retrieveSavedSearch($_REQUEST['saved_search_select']);
        }

        if ((!empty($_REQUEST['displayColumns']) && $_REQUEST['displayColumns'] != 'undefined') || (isset($this->contents['displayColumns']) && $this->contents['displayColumns'] != 'undefined')) {
            // columns to display
            if (!empty($_REQUEST['displayColumns']) && $_REQUEST['displayColumns'] != 'undefined') {
                $temp_displayColumns = $_REQUEST['displayColumns'];
            } else {
                $temp_displayColumns = $this->contents['displayColumns'];
            }
            foreach (explode('|', $temp_displayColumns) as $num => $name) {
                if (!isset($this->columns[$name])) {
                    // Ignore any column that is not on the list.
                    continue;
                }
                $chooser->args['values_array'][0][$name] = trim(translate($this->columns[$name]['label'], $module), ':');
            }
            // columns not displayed
            foreach (array_diff(array_keys($this->columns), array_values(explode('|', $temp_displayColumns))) as $num => $name) {
                $chooser->args['values_array'][1][$name] = trim(translate($this->columns[$name]['label'], $module), ':');
            }
        } else {
            foreach ($this->columns as $name => $val) {
                if (!isset($val['label'])) {
                    LoggerManager::getLogger()->warn("SavedSearch getTemplateGroupChooser: Illegal string offset 'label'");
                    $valLabel = null;
                } else {
                    $valLabel = $val['label'];
                }

                if (!empty($val['default']) && $val['default']) {
                    $chooser->args['values_array'][0][$name] = trim(translate($valLabel, $module), ':');
                } else {
                    $chooser->args['values_array'][1][$name] = trim(translate($valLabel, $module), ':');
                }
            }
        }

        if (!empty($_REQUEST['sortOrder'])) {
            $this->sortOrder = $_REQUEST['sortOrder'];
        }
        if (!empty($_REQUEST['orderBy'])) {
            $this->orderBy = $_REQUEST['orderBy'];
        }

        $chooser->args['left_name'] = 'display_tabs';
        $chooser->args['right_name'] = 'hide_tabs';
        $chooser->args['alt_tip'] = $app_strings['LBL_SORT'];

        $chooser->args['left_label'] = $app_strings['LBL_DISPLAY_COLUMNS'];
        $chooser->args['right_label'] = $app_strings['LBL_HIDE_COLUMNS'];
        $chooser->args['title'] = '';
        $this->lastTemplateGroupChooser = $chooser;

        return $chooser;
    }


    public function getSelect($module, &$savedSearchData = null)
    {
        global $current_user, $currentModule, $current_lang, $app_strings;
        $db = DBManagerFactory::getInstance();

        $saved_search_mod_strings = return_module_language($current_lang, 'SavedSearch');

        if ($module == 'Leads') {
            if ($_COOKIE['role']) {
                $role = $_COOKIE['role'];
                if ($role == "SUPER_MKT") {
                    $query = 'SELECT id, name, contents FROM saved_search
                    WHERE
                      deleted = \'0\' AND
                      assigned_user_id = \'' . $current_user->id . '\' AND
                      search_module =  \'' . $module . '\'
                    ORDER BY name';
                    $result = $db->query($query, true, "Error filling in saved search list: ");
                }
                else if ($role == "RO") {
                    $branch_id = "";
                    $query_select_branch = "SELECT * FROM branch_ro WHERE user_id = '{$current_user->id}'";
                    $result_select_branch = $db->query($query_select_branch);
                    while($row_select_branchs = $GLOBALS['db']->fetchByAssoc($result_select_branch)){
                        $branch_id = $row_select_branchs['branch_id'];
                    }


                    if ($branch_id ==  "HCM_2") {             
                        $query = "SELECT id, name, contents FROM saved_search WHERE (assigned_user_id = '{$current_user->id}' OR assigned_user_id = '54e005cb-332b-9c26-c173-6406e116558f')  AND deleted = 0  AND   search_module =  '{$module}' ORDER BY name";
                        $result = $db->query($query, true, "Error filling in saved search list: ");
                    }
                    else if ($branch_id == "HCM_3" ) {
                        $query = "SELECT id, name, contents FROM saved_search WHERE (assigned_user_id = '{$current_user->id}' OR assigned_user_id = '640b5327-a567-bdd1-c73f-64a657064f4a' OR assigned_user_id = '351edcea-83d2-bf13-f595-64a80ff642b5') AND deleted = 0  AND   search_module =  '{$module}' ORDER BY name";
                        $result = $db->query($query, true, "Error filling in saved search list: ");
                    }
                    else if ($branch_id == "HCM_4" || $current_user->id == "351edcea-83d2-bf13-f595-64a80ff642b5") {
                        $query = "SELECT id, name, contents FROM saved_search WHERE (assigned_user_id = '{$current_user->id}' OR assigned_user_id = '640b5327-a567-bdd1-c73f-64a657064f4a')  AND deleted = 0  AND   search_module =  '{$module}' ORDER BY name";
                        $result = $db->query($query, true, "Error filling in saved search list: ");
                    }
                    else {
                        $query = "SELECT id, name, contents FROM saved_search WHERE  assigned_user_id = '{$current_user->id}' AND deleted = 0  AND search_module =  '{$module}' ORDER BY name";
                        $result = $db->query($query, true, "Error filling in saved search list: ");
                    }           
                }
                else {
                    $userSuperMKTs = $this->userForRole('super_mkt');
                    $listUsers = "('" . implode("', '", $userSuperMKTs) . "')";
                    $query = 'SELECT id, name, contents FROM saved_search
                    WHERE
                      deleted = \'0\' AND
                      search_module =  \'' . $module . '\'
                    ORDER BY name';
                    $result = $db->query($query, true, "Error filling in saved search list: ");
                }
            }

            $savedSearchArray['_none'] = $app_strings['LBL_NONE'];
            $savedSearchData['hasOptions'] = false;

            global $current_user;
            $user = BeanFactory::getBean('Users', $current_user->id);

            while ($row = $db->fetchByAssoc($result, -1, false)) {
                $contents = unserialize(base64_decode($row['contents']));
                $query_check_for_role = "SELECT COUNT(*) AS total FROM leads WHERE deleted = 0 ";
                if (!empty($contents['citizen_identification_advanced'])) {
                    $citizen_identification = $contents['citizen_identification_advanced'];
                    $query_check_for_role .= "AND citizen_identification = '{$citizen_identification}' ";
                }
                if (!empty($contents['phone_number_primary_advanced'])) {
                    $phone_number_primary = $contents['phone_number_primary_advanced'];
                    $query_check_for_role .= "AND phone_number_primary = '{$phone_number_primary}' ";
                }

                if (!empty($contents['card_bark_type_advanced'])) {
                    $card_bark_type = "('" . implode("', '", $contents['card_bark_type_advanced']) . "')";
                    $query_check_for_role .= " AND card_bark_type IN ({$card_bark_type}) ";
                }

                if (!empty($contents['owned_branch_advanced'])) {
                    $owned_branch = "('" . implode("', '", $contents['owned_branch_advanced']) . "')";
                    $query_check_for_role .= " AND owned_branch IN ({$owned_branch}) ";
                }

                if (!empty($contents['bank_advanced'])) {
                    $bank = implode(",", $contents['bank_advanced']);
                    $query_check_for_role .= " AND bank IN ({$bank}) ";
                }

                if (!empty($contents['sale_stage_advanced'])) {
                    $sale_stage = implode(",", $contents['sale_stage_advanced']);
                    $query_check_for_role .= " AND sale_stage IN ({$sale_stage}) ";
                }

                if (!empty($contents['data_sources_advanced'])) {
                    $data_sources = implode(",", $contents['data_sources_advanced']);
                    $query_check_for_role .= " AND data_sources IN ({$data_sources}) ";
                }


                if (!empty($contents['date_modified_advanced_range_choice']) && !empty($contents['range_date_modified_advanced'])) {
                    if ($contents['date_modified_advanced_range_choice'] == "less_than") {
                        $query_check_for_role .= " AND date_modified < '".$contents['range_date_modified_advanced']."' ";
                    }
                    else if ($contents['date_modified_advanced_range_choice'] == "greater_than") {
                        $query_check_for_role .= " AND date_modified > '".$contents['range_date_modified_advanced']."' ";
                    }
                    else if ($contents['date_modified_advanced_range_choice'] == "not_equal") {
                        $query_check_for_role .= " AND date_modified != '".$contents['range_date_modified_advanced']."' ";
                    }
                }

                if (!empty($contents['date_modified_advanced_range_choice']) && $contents['date_modified_advanced_range_choice'] == 'last_7_days') {
                    $query_check_for_role .= " AND date_modified BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW() ";
                }

                if (!empty($contents['date_modified_advanced_range_choice']) && $contents['date_modified_advanced_range_choice'] == 'next_7_days') {
                    $query_check_for_role .= " AND date_modified BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 7 DAY) ";
                }

                if (!empty($contents['date_modified_advanced_range_choice']) && $contents['date_modified_advanced_range_choice'] == 'last_30_days') {
                    $query_check_for_role .= " AND date_modified BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW() ";
                }

                if (!empty($contents['date_modified_advanced_range_choice']) && $contents['date_modified_advanced_range_choice'] == 'next_30_days') {
                    $query_check_for_role .= " AND date_modified BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 30 DAY) ";
                }

                if (!empty($contents['date_modified_advanced_range_choice']) && $contents['date_modified_advanced_range_choice'] == 'last_month') {
                    $query_check_for_role .= " AND date_modified BETWEEN DATE_SUB(NOW(), INTERVAL 1 MONTH) AND NOW() ";
                }

                if (!empty($contents['date_modified_advanced_range_choice']) && $contents['date_modified_advanced_range_choice'] == 'this_month') {
                    $query_check_for_role .= " AND YEAR(date_modified) = YEAR(NOW()) AND MONTH(date_modified) = MONTH(NOW()) ";
                }

                if (!empty($contents['date_modified_advanced_range_choice']) && $contents['date_modified_advanced_range_choice'] == 'next_month') {
                    $query_check_for_role .= " AND date_modified BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 1 MONTH) ";
                }

                if (!empty($contents['date_modified_advanced_range_choice']) && $contents['date_modified_advanced_range_choice'] == 'last_year') {
                    $query_check_for_role .= " AND YEAR(date_modified) = YEAR(NOW()) - 1 ";
                }

                if (!empty($contents['range_date_modified_advanced']) && $contents['date_modified_advanced_range_choice'] == 'equals') {
                    $query_check_for_role .= " AND date_modified = '".$contents['start_range_date_modified_advanced']."' ";
                }

                if (!empty($contents['range_date_modified_advanced']) && $contents['date_modified_advanced_range_choice'] == 'this_year') {
                    $year = date('Y');
                    $query_check_for_role .= " AND YEAR(date_modified) = $year ";
                }

                if (!empty($contents['range_date_modified_advanced']) && $contents['date_modified_advanced_range_choice'] == 'next_year') {
                    $year = date('Y') + 1;
                    $query_check_for_role .= " AND YEAR(date_modified) = $year ";
                }

                if (!empty($contents['range_date_modified_advanced']) && $contents['date_modified_advanced_range_choice'] == 'between') {
                    $query_check_for_role .= " AND date_modified BETWEEN '".$contents['start_range_date_modified_advanced']."' AND '".$contents['end_range_date_modified_advanced']."' ";
                }

                if ($_COOKIE['role']){
                    $role = $_COOKIE['role'];
    
                    if ($role == "MKT"){
                        $query_check_for_role .= " AND (leads.created_by = '{$user->id}' OR leads.modified_user_id = '{$user->id}' OR (leads.data_sources != '9' AND leads.data_sources != '10')";
                    }
    
                    if ($role == "RO"){
                        if ($user->id == '54e005cb-332b-9c26-c173-6406e116558f') {
                            $query_check_for_role .= "  OR leads.owned_branch = 'HCM_2' OR (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true) OR ( leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != '')"; 
                        }
                        else if ($user->id == '640b5327-a567-bdd1-c73f-64a657064f4a') {
                            $query_check_for_role .= " OR leads.owned_branch = 'HCM_3' OR leads.owned_branch = 'HCM_4'  OR (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true) OR ( leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != '')";
                        }
                        else if ($user->id == '351edcea-83d2-bf13-f595-64a80ff642b5') {
                            $query_check_for_role .= " OR leads.owned_branch = 'HCM_3' OR (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true) OR ( leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != '')";
                        }
                        else if ($user->id == '9232e852-23f5-3a3a-db34-63fdc497d906') {
                            $query_check_for_role .= " (leads.created_by = '1' AND leads.ro_name = '{$user->id}' AND lead_status = '1' AND sale_stage = '1') OR (ro_name  = '9232e852-23f5-3a3a-db34-63fdc497d906' AND data_sources = '9') OR (ro_name  = '9232e852-23f5-3a3a-db34-63fdc497d906' AND data_sources = '10') OR (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true)  OR (leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != '')";
                        }
                        else if ($user->id == '497f0e21-37eb-a875-75b2-63fdb2c03264') {
                            $query_check_for_role .= "(leads.created_by = '1' AND leads.ro_name = '{$user->id}' AND lead_status = '1' AND sale_stage = '1') OR ((leads.data_sources = '9' OR leads.data_sources = '10') AND leads.lead_status = '17') OR (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true)  OR (leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != '')";
                        }
                        else if ($query_check_for_role == ""){
                            $query_check_for_role .= "(leads.created_by = '1' AND leads.ro_name = '{$user->id}' AND lead_status = '1' AND sale_stage = '1') OR (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true)  OR (leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != '')";
                        }
                        else {
                            $query_check_for_role .= " OR (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true) OR (leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != '')";
                        }
                    }
    
                    if ($role == "HO"){
                        $query_check_for_role .= " AND (leads.ho_name = '{$user->id}' AND leads.service = '1')";
                    }

                    $new_query = preg_replace_callback('/(\d{4}-\d{2}-\d{2}) (17:00:00|16:59:59)/', function ($matches) {
                        // Tạo đối tượng DateTime từ ngày tìm thấy và tăng ngày lên 1
                        $date = DateTime::createFromFormat('Y-m-d', $matches[1]);
                        $date->modify('+1 day');
                    
                        // Đặt giờ phù hợp dựa trên giờ tìm thấy
                        if ($matches[2] == '17:00:00') {
                            $date->setTime(0, 0, 0);
                        } else { // $matches[2] == '16:59:59'
                            $date->setTime(23, 59, 59);
                        }
                    
                        return $date->format('Y-m-d H:i:s');
                    }, $query_check_for_role);



                    $result_check_for_role = $GLOBALS['db']->query($new_query);
                    $rows_check_for_role = $GLOBALS['db']->fetchByAssoc($result_check_for_role);
                    $total = $rows_check_for_role['total'];
                    if ($total > 0) {
                        $savedSearchData['hasOptions'] = true;
                        $savedSearchData['options'][$row['id']] = $savedSearchArray[$row['id']] = htmlspecialchars($row['name'], ENT_QUOTES);
                    }
                    
                }
            }

            $sugarSmarty = new Sugar_Smarty();
            $sugarSmarty->assign('SEARCH_MODULE', $module);
            $sugarSmarty->assign('MOD', $saved_search_mod_strings);

            if (!empty($_SESSION['LastSavedView'][$module]) && (($_REQUEST['action'] == 'ListView') || ($_REQUEST['action'] == 'index'))) {
                $selectedSearch = $_SESSION['LastSavedView'][$module];
            } else {
                $selectedSearch = '';
            }

            $savedSearchData['selected'] = $selectedSearch;
            $sugarSmarty->assign('SAVED_SEARCHES_OPTIONS', get_select_options_with_id($savedSearchArray, $selectedSearch));

            $savedSearchData['module'] = $module;

            return $sugarSmarty->fetch('modules/SavedSearch/SavedSearchSelects.tpl');
        } else {
            $query = 'SELECT id, name FROM saved_search
            WHERE
              deleted = \'0\' AND
              assigned_user_id = \'' . $current_user->id . '\' AND
              search_module =  \'' . $module . '\'
            ORDER BY name';
            $result = $db->query($query, true, "Error filling in saved search list: ");

            $savedSearchArray['_none'] = $app_strings['LBL_NONE'];
            $savedSearchData['hasOptions'] = false;
            while ($row = $db->fetchByAssoc($result, -1, false)) {
                $savedSearchData['hasOptions'] = true;
                $savedSearchData['options'][$row['id']] = $savedSearchArray[$row['id']] = htmlspecialchars($row['name'], ENT_QUOTES);
            }

            $sugarSmarty = new Sugar_Smarty();
            $sugarSmarty->assign('SEARCH_MODULE', $module);
            $sugarSmarty->assign('MOD', $saved_search_mod_strings);

            if (!empty($_SESSION['LastSavedView'][$module]) && (($_REQUEST['action'] == 'ListView') || ($_REQUEST['action'] == 'index'))) {
                $selectedSearch = $_SESSION['LastSavedView'][$module];
            } else {
                $selectedSearch = '';
            }

            $savedSearchData['selected'] = $selectedSearch;
            $sugarSmarty->assign('SAVED_SEARCHES_OPTIONS', get_select_options_with_id($savedSearchArray, $selectedSearch));

            $savedSearchData['module'] = $module;

            return $sugarSmarty->fetch('modules/SavedSearch/SavedSearchSelects.tpl');
        }
    }

    public function returnSavedSearch($id, $searchFormTab = 'advanced_search', $showDiv = 'no')
    {
        global $current_user, $currentModule;
        $db = DBManagerFactory::getInstance();

        $this->retrieveSavedSearch($id);

        $header = 'Location: index.php?action=index&module=';

        $saved_search_name = '';
        $header .= $this->contents['search_module'];
        if (empty($_SESSION['LastSavedView'])) {
            $_SESSION['LastSavedView'] = array();
        }
        $_SESSION['LastSavedView'][$this->contents['search_module']] = $id;
        $saved_search_id = $id;
        $saved_search_name = $this->name;

        $thisContentsSearchFormTab = null;
        if (isset($this->contents['searchFormTab'])) {
            $thisContentsSearchFormTab = $this->contents['searchFormTab'];
        } else {
            LoggerManager::getLogger()->warn('SavedSearch contents search form tab is not set');
        }

        $search_form_tab = $thisContentsSearchFormTab;

        $thisContentsQuery = null;
        if (isset($this->contents['query'])) {
            $thisContentsQuery = $this->contents['query'];
        } else {
            LoggerManager::getLogger()->warn('SavedSearch contents query is not set');
        }

        $query = $thisContentsQuery;
        $orderBy = empty($this->contents['orderBy']) ? 'name' : $this->contents['orderBy'];

        //Reduce the params to avoid the problems caused by URL max length in IE.

        $thisContentsSortOrder = null;
        if (isset($this->contents['sortOrder'])) {
            $thisContentsSortOrder = $this->contents['sortOrder'];
        } else {
            LoggerManager::getLogger()->warn('SavedSearch contents short order is not set');
        }

        SugarApplication::headerRedirect(
                $header .
                '&saved_search_select=' . $saved_search_id .
                '&saved_search_select_name=' . $saved_search_name .
                '&orderBy=' . $orderBy .
                '&sortOrder=' . $thisContentsSortOrder .
                '&query=' . $query .
                '&searchFormTab=' . $search_form_tab .
                '&showSSDIV=' . $showDiv
        );
    }

    public function returnSavedSearchContents($id)
    {
        global $current_user, $currentModule;
        $db = DBManagerFactory::getInstance();

        $query = 'SELECT id, name, contents, search_module FROM saved_search
				  WHERE
				  	id = \'' . $id . '\'';
        $result = $db->query($query, true, "Error filling in saved search list: ");

        $header = 'Location: index.php?action=index&module=';
        $contents = '';
        $saved_search_name = '';
        while ($row = $db->fetchByAssoc($result, false)) {
            $header .= $row['search_module'];
            if (empty($_SESSION['LastSavedView'])) {
                $_SESSION['LastSavedView'] = array();
            }
            $_SESSION['LastSavedView'][$row['search_module']] = $row['id'];
            $contents = unserialize(base64_decode($row['contents']));
            $saved_search_id = $row['id'];
            $saved_search_name = $row['name'];
        }

        return $contents;
    }

    public function handleDelete($id)
    {
        $this->mark_deleted($id);

        $requestSearchModule = null;
        if (isset($_REQUEST['search_module'])) {
            $requestSearchModule = $_REQUEST['search_module'];
        } else {
            LoggerManager::getLogger()->warn('SavedSearch::handleDelete() - Requested search module is not set');
        }

        SugarApplication::headerRedirect("Location: index.php?action=index&module={$requestSearchModule}&advanced={$_REQUEST['advanced']}&query=true&clear_query=true");
    }

    public function handleSave($prefix, $redirect = true, $useRequired = false, $id = null, $searchModuleBean = null)
    {
        
        global $current_user, $timedate;

        $focus = new SavedSearch();
        if ($id) {
            $focus->retrieve($id);
        }

        if ($useRequired && !checkRequired($prefix, array_keys($focus->required_fields))) {
            return null;
        }

        $ignored_inputs = array('PHPSESSID', 'module', 'action', 'saved_search_name', 'saved_search_select', 'advanced', 'Calls_divs', 'ACLRoles_divs');

        $contents = $_REQUEST;

        if (!isset($contents['saved_search_name'])) {
            LoggerManager::getLogger()->warn('SavedSearch::handleSave() - saved_search_name is not set');
        }

        if (isset($contents['saved_search_name']) && $contents['saved_search_name']) {
            $focus->name = $contents['saved_search_name'];
        }
        $focus->search_module = $contents['search_module'];

        foreach ($contents as $input => $value) {
            if (in_array($input, $ignored_inputs)) {
                unset($contents[$input]);
                continue;
            }

            //Filter date fields to ensure it is saved to DB format, but also avoid empty values
            if (!empty($value) && preg_match('/^(start_range_|end_range_|range_)?(.*?)(_advanced|_basic)$/', $input, $match)) {
                $field = $match[2];
                if (isset($searchModuleBean->field_defs[$field]['type']) && empty($searchModuleBean->field_defs[$field]['disable_num_format'])) {
                    $type = $searchModuleBean->field_defs[$field]['type'];

                    //Avoid macro values for the date types
                    if (($type == 'date' || $type == 'datetime' || $type == 'datetimecombo') && !preg_match('/^\[.*?\]$/', $value)) {
                        $db_format = $timedate->to_db_date($value, false);
                        $contents[$input] = $db_format;
                    } elseif ($type == 'int' || $type == 'currency' || $type == 'decimal' || $type == 'float') {
                        if (preg_match('/[^\d]/', $value)) {
                            require_once('modules/Currencies/Currency.php');
                            $contents[$input] = unformat_number($value);
                            //Flag this value as having been unformatted
                            $contents[$input . '_unformatted_number'] = true;
                            //If the type is of currency and there was a currency symbol (non-digit), save the symbol
                            if ($type == 'currency' && preg_match('/^([^\d])/', $value, $match)) {
                                $contents[$input . '_currency_symbol'] = $match[1];
                            }
                        } else {
                            //unset any flags
                            if (isset($contents[$input . '_unformatted_number'])) {
                                unset($contents[$input . '_unformatted_number']);
                            }

                            if (isset($contents[$input . '_currency_symbol'])) {
                                unset($contents[$input . '_currency_symbol']);
                            }
                        }
                    }
                }
            }
        }

        $contents['advanced'] = true;

        $focus->contents = base64_encode(serialize($contents));

        $focus->assigned_user_id = $current_user->id;
        $focus->new_schema = true;

        $saved_search_id = $focus->save();

        $GLOBALS['log']->debug("Saved record with id of " . $focus->id);
        $orderBy = empty($contents['orderBy']) ? 'name' : $contents['orderBy'];

        $contentsSortOrder = null;
        if (isset($contents['sortOrder'])) {
            $contentsSortOrder = $contents['sortOrder'];
        } else {
            LoggerManager::getLogger()->warn('SavedSearch::handleSave() - contents sort order is not set');
        }

        $requestQuery = null;
        if (isset($_REQUEST['query'])) {
            $requestQuery = $_REQUEST['query'];
        } else {
            LoggerManager::getLogger()->warn('SavedSearch::handleSave() - request query is not set');
        }

        $requestSearchFormTab = null;
        if (isset($_REQUEST['searchFormTab'])) {
            $requestSearchFormTab = $_REQUEST['searchFormTab'];
        } else {
            LoggerManager::getLogger()->warn('SavedSearch::handleSave() - request search form tab is not set');
        }

        $contentsShowSSDIV = null;
        if (isset($contents['showSSDIV'])) {
            $contentsShowSSDIV = $contents['showSSDIV'];
        } else {
            LoggerManager::getLogger()->warn('SavedSearch::handleSave() - contents showSSDIV is not set');
        }


        $search_query =
                "&orderBy=" . $orderBy .
                "&sortOrder=" . $contentsSortOrder .
                "&query=" . $requestQuery .
                "&searchFormTab=" . $requestSearchFormTab .
                '&showSSDIV=' . $contentsShowSSDIV;

        if ($redirect) {
            $this->handleRedirect($focus->search_module, $search_query, $saved_search_id, 'true');
        }
    }

    public function handleRedirect($return_module, $search_query, $saved_search_id, $advanced = 'false')
    {
        $_SESSION['LastSavedView'][$return_module] = $saved_search_id;
        $return_action = 'index';
        $ajaxLoad = empty($_REQUEST['ajax_load']) ? "" : "&ajax_load=" . $_REQUEST['ajax_load'];
        //Reduce the params to avoid the problems caused by URL max length in IE ( the reduced params can be get from saved search according to saved_search_id).
        SugarApplication::headerRedirect("Location: index.php?action=$return_action&module=$return_module&saved_search_select={$saved_search_id}{$search_query}&advanced={$advanced}$ajaxLoad");
        die();
    }

    public function fill_in_additional_list_fields()
    {
        global $app_list_strings;
        // Fill in the assigned_user_name
        $this->search_module = $app_list_strings['moduleList'][$this->contents['search_module']];
        $this->assigned_user_name = get_assigned_user_name($this->assigned_user_id);
    }


    public function retrieveSavedSearch($id)
    {
        parent::retrieve($id);
        $this->contents = unserialize(base64_decode($this->contents));
    }

    public function populateRequest()
    {
        global $timedate;

        if (isset($this->contents['search_module'])) {
            $searchModuleBean = loadBean($this->contents['search_module']);
        }

        foreach ($this->contents as $key => $val) {
            if ($key != 'advanced' && $key != 'module' && !strpos($key, '_ORDER_BY') && $key != 'lvso') {
                if (isset($searchModuleBean) && !empty($val) && preg_match('/^(start_range_|end_range_|range_)?(.*?)(_advanced|_basic)$/', $key, $match)) {
                    $field = $match[2];
                    if (isset($searchModuleBean->field_defs[$field]['type']) && empty($searchModuleBean->field_defs[$field]['disable_num_format'])) {
                        $type = $searchModuleBean->field_defs[$field]['type'];

                        //Avoid macro values for the date types
                        if (($type == 'date' || $type == 'datetime' || $type == 'datetimecombo') && preg_match('/^\d{4}-\d{2}-\d{2}$/', $val) && !preg_match('/^\[.*?\]$/', $val)) {
                            $val = $timedate->to_display_date($val, false);
                        } elseif (($type == 'int' || $type == 'currency' || $type == 'decimal' || $type == 'float') && isset($this->contents[$key . '_unformatted_number']) && preg_match('/^\d+$/', $val)) {
                            require_once('modules/Currencies/Currency.php');
                            $val = format_number($val);
                            if ($type == 'currency' && isset($this->contents[$key . '_currency_symbol'])) {
                                $val = $this->contents[$key . '_currency_symbol'] . $val;
                            }
                        }
                    }
                }

                $_REQUEST[$key] = $val;
                $_GET[$key] = $val;
            }
        }
    }
}