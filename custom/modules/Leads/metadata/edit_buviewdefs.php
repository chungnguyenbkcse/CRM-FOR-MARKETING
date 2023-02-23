<?php
$viewdefs['Leads'] =
  array(
    'EditView' =>
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
            7 => '<input type="hidden" name="phone_number_primary" id = "phone_number_primary" value="{$bean->phone_number_primary}">',
          ),
          'buttons' =>
          array(
            0 => 'SAVE',
            1 => 'CANCEL',
          ),
          'headerTpl' => 'include/EditView/header.tpl',
          'footerTpl' => 'include/EditView/footer.tpl',
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
            'file' => 'custom/modules/Leads/handle_dropdown_bu.js',
          )
        ),
        'javascript' => '
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
        <script type="text/javascript" language="Javascript">function copyAddressRight(form)  {ldelim} form.alt_address_street.value = form.primary_address_street.value;form.alt_address_city.value = form.primary_address_city.value;form.alt_address_state.value = form.primary_address_state.value;form.alt_address_postalcode.value = form.primary_address_postalcode.value;form.alt_address_country.value = form.primary_address_country.value;return true; {rdelim} function copyAddressLeft(form)  {ldelim} form.primary_address_street.value =form.alt_address_street.value;form.primary_address_city.value = form.alt_address_city.value;form.primary_address_state.value = form.alt_address_state.value;form.primary_address_postalcode.value =form.alt_address_postalcode.value;form.primary_address_country.value = form.alt_address_country.value;return true; {rdelim} </script>
        ',
        'useTabs' => false,
        'tabDefs' =>
        array(
          'LBL_CONTACT_INFORMATION' =>
          array(
            'newTab' => false,
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
            1 => 'real_fee',
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
            1 => 'district_customer_live',
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
      ),
    ),
  );
