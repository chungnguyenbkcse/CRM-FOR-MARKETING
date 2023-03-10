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

$mod_strings = array(
    'LBL_MODULE_NAME' => 'L???i',
    'LBL_MODULE_TITLE' => 'Theo d??i L???i: Tr.ch??nh',
    'LBL_MODULE_ID' => 'L???i',
    'LBL_SEARCH_FORM_TITLE' => 'T??m ki???m',
    'LBL_LIST_FORM_TITLE' => 'Danh s??ch L???i',
    'LBL_NEW_FORM_TITLE' => 'L???i m???i',
    'LBL_SUBJECT' => 'Ch??? ?????:',
    'LBL_NUMBER' => 'S???:',
    'LBL_STATUS' => 'T??nh tr???ng:',
    'LBL_PRIORITY' => '??u ti??n:',
    'LBL_DESCRIPTION' => 'M?? t???:',
    'LBL_CONTACT_NAME' => 'T??n li??n l???c:',
    'LBL_CONTACT_ROLE' => 'Vai tr??:',
    'LBL_LIST_NUMBER' => 'S???.',
    'LBL_LIST_SUBJECT' => 'Ch??? ?????',
    'LBL_LIST_STATUS' => 'T??nh tr???ng',
    'LBL_LIST_PRIORITY' => '??u ti??n',
    'LBL_LIST_RESOLUTION' => 'Gi???i ph??p',
    'LBL_LIST_LAST_MODIFIED' => 'L???n s???a cu???i',
    'LBL_INVITEE' => 'Li??n h???',
    'LBL_TYPE' => 'Lo???i:',
    'LBL_LIST_TYPE' => 'Lo???i',
    'LBL_RESOLUTION' => 'Gi???i ph??p:',
    'LBL_RELEASE' => 'Ph??t h??nh:',
    'LNK_NEW_BUG' => 'B??o c??o L???i',
    'LNK_BUG_LIST' => 'Xem L???i',
    'ERR_DELETE_RECORD' => 'B???n ph???i x??c ?????nh m???t b???n ghi trong danh s??ch ????? x??a c??c l???i.',
    'LBL_LIST_MY_BUGS' => 'L???i ???????c ch??? ?????nh',
    'LNK_IMPORT_BUGS' => 'Nh???p L???i',
    'LBL_FOUND_IN_RELEASE' => 'T??m th???y:',
    'LBL_FIXED_IN_RELEASE' => 'S???a ch???a:',
    'LBL_LIST_FIXED_IN_RELEASE' => 'S???a ch???a',
    'LBL_WORK_LOG' => 'L???ch s??? l??m vi???c:',
    'LBL_SOURCE' => 'Ngu???n:',
    'LBL_PRODUCT_CATEGORY' => 'Ch???ng lo???i:',

    'LBL_CREATED_BY' => 'T???o b???i:',
    'LBL_MODIFIED_BY' => 'S???a l???n cu???i b???i:',

    'LBL_LIST_EMAIL_ADDRESS' => '?????a ch??? Email',
    'LBL_LIST_CONTACT_NAME' => 'T??n li??n l???c',
    'LBL_LIST_ACCOUNT_NAME' => 'T??n t??i kho???n',
    'LBL_LIST_PHONE' => '??i???n tho???i',
    'NTC_DELETE_CONFIRMATION' => 'B???n c?? ch???c b???n mu???n lo???i b??? li??n h??? n??y kh???i l???i n??y kh??ng?',

    'LBL_DEFAULT_SUBPANEL_TITLE' => 'Qu???n l?? L???i',
    'LBL_ACTIVITIES_SUBPANEL_TITLE' => 'Ho???t ?????ng',
    'LBL_HISTORY_SUBPANEL_TITLE' => 'L???ch s???',
    'LBL_CONTACTS_SUBPANEL_TITLE' => 'Li??n h???',
    'LBL_ACCOUNTS_SUBPANEL_TITLE' => 'T??i kho???n',
    'LBL_CASES_SUBPANEL_TITLE' => 'V??? vi???c',
    'LBL_PROJECTS_SUBPANEL_TITLE' => 'D??? ??n',
    'LBL_DOCUMENTS_SUBPANEL_TITLE' => 'T??i li???u',
    'LBL_LIST_ASSIGNED_TO_NAME' => '???? ch??? ?????nh cho ng?????i d??ng',
    'LBL_ASSIGNED_TO_NAME' => 'Ch??? ?????nh cho',

    'LBL_BUG_INFORMATION' => 'Xem to??n b???', //Can be translated in all caps. This string will be used by SuiteP template menu actions

);