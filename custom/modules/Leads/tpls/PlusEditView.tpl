{php}
global $emailInstances;
if (empty($emailInstances))
	$emailInstances = array();
if (!isset($emailInstances[$this->_tpl_vars['module']]))
	$emailInstances[$this->_tpl_vars['module']] = 0;
$this->_tpl_vars['index'] = $emailInstances[$this->_tpl_vars['module']];
$emailInstances['module']++;
{/php}
<script type="text/javascript" language="javascript">
var emailAddressWidgetLoaded = false;
</script>
	<script type="text/javascript" src="include/SugarEmailAddress/SugarEmailAddress.js"></script>
<script type="text/javascript">
	var module = '{$module}';
</script>

<div class="col-xs-12">
	<div class="col-xs-12 email-address-add-line-container emailaddresses" id="{$module}emailAddressesTable{$index}">
		{capture assign="other_attributes"}id="{$module}{$index}_email_widget_add" onclick="SUGAR.EmailAddressWidget.instances.{$module}{$index}.addEmailAddress('{$module}emailAddressesTable{$index}','', false);"{/capture}
		<button type="button" class="btn btn-danger email-address-add-button" title="{$app_strings.LBL_ID_FF_ADD_EMAIL} " {$other_attributes}>
			<span class="suitepicon suitepicon-action-plus"></span><span></span>
		</button>
	</div>
	<div class="col-xs-12 email-address-lines-container">
		<div class="col-xs-12 template email-address-line-container hidden">
			<div class="col-xs-12 col-sm-6  email-address-input-container {if $module == "Leads"} email-address-users-profile{/if}">
				<div class="input-group email-address-input-group">
					<input type="email" id="email-address-input" class="form-control" placeholder="email@example.com" title="{$app_strings.LBL_EMAIL_TITLE}">
					<input type="hidden" id="record-id">
					<input type="hidden" id="verified-flag" class="verified-flag" value="true"/>
					<input type="hidden" id="verified-email-value" class="verified-email-value" value=""/>
					<input type=hidden id="{$module}_email_widget_id" name="{$module}_email_widget_id" value="">
					<input type=hidden id='emailAddressWidget' name='emailAddressWidget' value='1'>
					<span class="input-group-btn">
					<button type="button" id="email-address-remove-button" class="btn btn-danger email-address-remove-button" name="" title="{$app_strings.LBL_ID_FF_REMOVE_EMAIL}">
						<span class="suitepicon suitepicon-action-minus"></span>
					</button>
				</span>
				</div>
			</div>
		</div>

	</div>
</div>
<input type="hidden" name="useEmailWidget" value="true">
<script type="text/javascript" language="javascript">
SUGAR_callsInProgress++;
var eaw = SUGAR.EmailAddressWidget.instances.{$module}{$index} = new SUGAR.EmailAddressWidget("{$module}");
eaw.emailView = '{$emailView}';
eaw.emailIsRequired = "{$required}";
eaw.tabIndex = '{$tabindex}';
var addDefaultAddress = '{$addDefaultAddress}';
var prefillEmailAddress = '{$prefillEmailAddresses}';
var prefillData = {$prefillData};
if(prefillEmailAddress == 'true') {ldelim}
	eaw.prefillEmailAddresses('{$module}emailAddressesTable{$index}', prefillData);
{rdelim} else if(addDefaultAddress == 'true') {ldelim}
	eaw.addEmailAddress('{$module}emailAddressesTable{$index}', '',true);
{rdelim}
if('{$module}_email_widget_id') {ldelim}
   document.getElementById('{$module}_email_widget_id').value = eaw.count;
{rdelim}
SUGAR_callsInProgress--;
</script>
