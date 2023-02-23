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

$viewdefs['Leads'] =
  array(
    'DetailView_1' =>
    array(
      'templateMeta' =>
      array(
        'form' =>
        array(
          'hidden' =>
          array(
            0 => '<input type="hidden" name="prospect_id" value="{if isset($smarty.request.prospect_id)}{$smarty.request.prospect_id}{else}{$bean->prospect_id}{/if}">',
            1 => '<input type="hidden" name="account_id" value="{if isset($smarty.request.account_id)}{$smarty.request.account_id}{else}{$bean->account_id}{/if}">',
            2 => '<input type="hidden" name="contact_id" value="{if isset($smarty.request.contact_id)}{$smarty.request.contact_id}{else}{$bean->contact_id}{/if}">',
            3 => '<input type="hidden" name="opportunity_id" value="{if isset($smarty.request.opportunity_id)}{$smarty.request.opportunity_id}{else}{$bean->opportunity_id}{/if}">',
            4 => '<input type="hidden" name="lead_status_id" id = "lead_status_id" value="{$bean->lead_status}">',
            5 => '<input type="hidden" name="lead_id" id = "lead_id" value="{$bean->id}">',
            6 => '<input type="hidden" name="ro_name_val" id = "ro_name_val" value="{$bean->ro_name}">',
            7 => '<input type="hidden" name="owner_branch_val" id = "owner_branch_val" value="{$bean->owned_branch}">',
            8 => '<input type="hidden" name="lead_fullname" id = "lead_fullname" value="{$bean->fullname}">',
          ),
          'buttons' =>
          array(
            0 => array(
              'customCode' => '
              <input 
                title="Edit" 
                accesskey="a" 
                class="button primary" 
                type="button" 
                name="button" 
                onClick="window.location=`http://localhost/suitecrm/index.php?module=Leads&offset=1&stamp=1663039588048580100&return_module=Leads&action=edit_bu&record=${lead_id}`"
                value="Edit" 
                id="EDIT"
              >'
            ),
          ),
          'headerTpl' => 'modules/Leads/tpls/DetailViewHeader.tpl',
        ),
        'maxColumns' => '2',
        'widths' =>
        array(
          0 =>
          array(
            'label' => '10',
            'field' => '30',
          ),
          1 =>
          array(
            'label' => '10',
            'field' => '30',
          ),
        ),
        'includes' =>
        array(
          0 =>
          array(
            'file' => 'custom/modules/Leads/handle_detailview.js',
          ),
        ),
        'useTabs' => true,
        'tabDefs' =>
        array(
          'LBL_CONTACT_INFORMATION' =>
          array(
            'newTab' => true,
            'panelDefault' => 'expanded',
          ),
          'LBL_PANEL_ADVANCED' =>
          array(
            'newTab' => true,
            'panelDefault' => 'expanded',
          ),
          'LBL_PANEL_ASSIGNMENT' =>
          array(
            'newTab' => true,
            'panelDefault' => 'expanded',
          ),
        ),
      ),
      'panels' =>
      array(
        'LBL_CONTACT_INFORMATION' =>
        array(
          0 =>
          array(
            0 => 'fullname',
            1 => "bank",
          ),
          1 =>
          array(
            0 => 'citizen_identification',
            1 => 'card_bark_type',
          ),
          2 =>
          array(
            0 => 'citizen_identification_issuance_date',
            1 => 'phone_number_extra',
          ),
          3 =>
          array(
            0 => 'citizen_identification_issuance_place',
            1 => 'real_transaction_amount',
          ),
          4 =>
          array(
            0 => 'address_follow_citizen_identification',
            1 => 'district_customer_live',
          ),
          5 =>
          array(
            0 => 'birthday',
            1 => 'career',
          ),
          6 =>
          array(
            0 => 'payment_day',
            1 => 'service',
          ),
          7 =>
          array(
            0 => "successful_trading_day",
            1 => '',
          ),
          8 =>
          array(
            0 => "sale_stage",
            1 => 'lead_status',
          ),
          9 =>
          array(
            0 => "date_modified",
          ),
        ),
        'LBL_PANEL_ADVANCED' =>
        array(
          0 =>
          array(
            0 => 'status',
            1 => 'lead_source',
          ),
          1 =>
          array(
            0 => 'status_description',
            1 => 'lead_source_description',
          ),
          2 =>
          array(
            0 => 'opportunity_amount',
            1 => 'refered_by',
          ),
          3 =>
          array(
            0 =>
            array(
              'name' => 'campaign_name',
              'label' => 'LBL_CAMPAIGN',
            ),
          ),
        ),
        'LBL_PANEL_ASSIGNMENT' =>
        array(
          0 =>
          array(
            0 =>
            array(
              'name' => 'date_modified',
              'label' => 'LBL_DATE_MODIFIED',
              'customCode' => '{$fields.date_modified.value} {$APP.LBL_BY} {$fields.modified_by_name.value}',
            ),
            1 =>
            array(
              'name' => 'date_entered',
              'customCode' => '{$fields.date_entered.value} {$APP.LBL_BY} {$fields.created_by_name.value}',
            ),
          ),
        ),
      ),
    ),
  );
