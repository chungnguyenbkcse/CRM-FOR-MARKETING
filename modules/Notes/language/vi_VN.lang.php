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
    'ERR_DELETE_RECORD' => 'B???n ph???i ch??? ?????nh m???t b???n ghi ????? x??a t??i kho???n.',
    'LBL_ACCOUNT_ID' => 'ID Kh??ch h??ng:',
    'LBL_CASE_ID' => 'ID V??? vi???c:',
    'LBL_CLOSE' => '????ng:',
    'LBL_CONTACT_ID' => 'ID Li??n h???:',
    'LBL_CONTACT_NAME' => 'Li??n h???:',
    'LBL_DEFAULT_SUBPANEL_TITLE' => 'Ghi ch??',
    'LBL_DESCRIPTION' => 'Ghi ch??',
    'LBL_EMAIL_ADDRESS' => 'Email :',
    'LBL_EMAIL_ATTACHMENT' => 'Email ????nh k??m',
    'LBL_FILE_MIME_TYPE' => 'Ki???u Mime ',
    'LBL_FILE_URL' => 'T???p tin URL',
    'LBL_FILENAME' => '????nh k??m:',
    'LBL_LEAD_ID' => 'ID ?????u m???i:',
    'LBL_LIST_CONTACT_NAME' => 'Li??n h???',
    'LBL_LIST_DATE_MODIFIED' => 'S???a l???n cu???i',
    'LBL_LIST_FILENAME' => '????nh k??m',
    'LBL_LIST_FORM_TITLE' => 'Danh s??ch ghi ch??',
    'LBL_LIST_RELATED_TO' => 'Li??n quan ?????n',
    'LBL_LIST_SUBJECT' => '?????i t?????ng',
    'LBL_LIST_STATUS' => 'Tr???ng th??i',
    'LBL_LIST_CONTACT' => 'Li??n h???',
    'LBL_MODULE_NAME' => 'Ghi ch??',
    'LBL_MODULE_TITLE' => 'Ghi ch??: Trang ch???',
    'LBL_NEW_FORM_TITLE' => 't???o ghi ch?? ho???c ????nh k??m',
    'LBL_NOTE_STATUS' => 'Ghi ch??',
    'LBL_NOTE_SUBJECT' => 'Ch??? ?????:',
    'LBL_NOTES_SUBPANEL_TITLE' => '????nh k??m',
    'LBL_NOTE' => 'Ghi ch??:',
    'LBL_OPPORTUNITY_ID' => 'ID C?? h???i:',
    'LBL_PARENT_ID' => 'ID C???p tr??n:',
    'LBL_PARENT_TYPE' => 'Lo???i C???p tr??n',
    'LBL_PHONE' => '??i???n tho???i:',
    'LBL_PORTAL_FLAG' => 'Hi???n ??? c???ng th??ng tin?',
    'LBL_EMBED_FLAG' => 'Nh??ng v??o email?',
    'LBL_PRODUCT_ID' => 'ID S???n ph???m:',
    'LBL_QUOTE_ID' => 'ID B??o gi??:',
    'LBL_RELATED_TO' => 'Li??n quan ?????n:',
    'LBL_SEARCH_FORM_TITLE' => 'T??m ki???m ghi ch??',
    'LBL_STATUS' => 'Tr???ng th??i',
    'LBL_SUBJECT' => 'Ch??? ?????:',
    'LNK_IMPORT_NOTES' => 'Nh???p ghi ch??',
    'LNK_NEW_NOTE' => 'T???o ghi ch?? ho???c ????nh k??m',
    'LNK_NOTE_LIST' => 'Xem ghi ch??',
    'LBL_MEMBER_OF' => 'Th??nh vi??n c???a:',
    'LBL_LIST_ASSIGNED_TO_NAME' => '???? ch??? ?????nh cho ng?????i d??ng',
    'LBL_REMOVING_ATTACHMENT' => '??ang x??a ????nh k??m...',
    'ERR_REMOVING_ATTACHMENT' => 'L???i lo???i b??? ????nh k??m...',
    'LBL_CREATED_BY' => '???????c t???o b???i',
    'LBL_MODIFIED_BY' => '???????c s???a b???i',
    'LBL_SEND_ANYWAYS' => 'Email n??y kh??ng c?? ch??? ?????.  B???n mu???n ti???p t???c G???i/l??u?',
    'LBL_NOTE_INFORMATION' => 'T???ng qu??t', //Can be translated in all caps. This string will be used by SuiteP template menu actions
    'LBL_MY_NOTES_DASHLETNAME' => 'Ghi ch?? c???a t??i',
    'LBL_EDITLAYOUT' => 'S???a khung' /*for 508 compliance fix*/,
    //For export labels
    'LBL_FIRST_NAME' => 'T??n',
    'LBL_LAST_NAME' => 'H???',
    'LBL_DATE_ENTERED' => 'Ng??y t???o',
    'LBL_DATE_MODIFIED' => 'Ng??y s???a',
    'LBL_DELETED' => '???? x??a',
);
