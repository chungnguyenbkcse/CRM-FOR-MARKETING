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
    'LBL_REPLY_ADDR' => '"Reply-to" ?????a ch???: ',
    'LBL_REPLY_NAME' => '"Reply-to" t??n: ',

    'LBL_MODULE_NAME' => 'Email qu???ng b??',
    'LBL_MODULE_TITLE' => 'Email qu???ng b??: Trang ch???',
    'LBL_LIST_FORM_TITLE' => 'Email Marketing Chi???n d???ch',
    'LBL_NAME' => 'T??n: ',
    'LBL_LIST_NAME' => 'T??n',
    'LBL_LIST_FROM_ADDR' => 't??? Email',
    'LBL_LIST_DATE_START' => 'Ng??y b???t ?????u',
    'LBL_LIST_TEMPLATE_NAME' => 'Email m???u',
    'LBL_LIST_STATUS' => 'Tr???ng th??i',
    'LBL_STATUS' => 'Tr???ng th??i',
    'LBL_STATUS_TEXT' => 'Tr???ng th??i:',
    'LBL_TEMPLATE_NAME' => 't??n m???u',
    'LBL_DATE_ENTERED' => 'Ng??y nh???p',
    'LBL_DATE_MODIFIED' => 'Ng??y ch???nh s???a',
    'LBL_MODIFIED' => 'Ch???nh s???a b???i: ',
    'LBL_CREATED' => 'T???o b???i: ',
    'LBL_MESSAGE_FOR' => 'G???i tin nh???n n??y t???i:',

    'LBL_FROM_NAME' => 'T??? t??n: ',
    'LBL_FROM_ADDR' => 'T??? ?????a ch???: ',
    'LBL_DATE_START' => 'Ng??y b???t ?????u',
    'LBL_TIME_START' => 'Th???i gian b???t ?????u',
    'LBL_START_DATE_TIME' => 'Ng??y v?? th???i gian b???t ?????u: ',
    'LBL_TEMPLATE' => 'Email m???u: ',

    'LBL_MODIFIED_BY' => 'Ch???nh s???a b???i: ',
    'LBL_CREATED_BY' => 'T???o b???i: ',

    'LNK_NEW_CAMPAIGN' => 'T???o chi???n d???ch',
    'LNK_CAMPAIGN_LIST' => 'Chi???n d???ch',
    'LNK_NEW_PROSPECT_LIST' => 'T???o danh s??ch m???c ti??u',
    'LNK_PROSPECT_LIST_LIST' => 'Danh s??ch m???c ti??u',
    'LNK_NEW_PROSPECT' => 'T???o m???c ti??u',
    'LNK_PROSPECT_LIST' => 'M???c ti??u',
    'LBL_DEFAULT_SUBPANEL_TITLE' => 'Email qu???ng b??',
    'LBL_CREATE_EMAIL_TEMPLATE' => 't???o',
    'LBL_EDIT_EMAIL_TEMPLATE' => 'S???a',
    'LBL_FROM_MAILBOX' => 'T??? h???p th??',
    'LBL_FROM_MAILBOX_NAME' => 'S??? d???ng h???p th??:',
    'LBL_OUTBOUND_EMAIL_ACCOUNT_NAME' => 'T??i kho???n email g???i ??i:',
    'LBL_PROSPECT_LIST_SUBPANEL_TITLE' => 'Danh s??ch m???c ti??u',
    'LBL_ALL_PROSPECT_LISTS' => 'b???m ????? ch???n t???t c??? m???c ti??u(s) trong chi???n d???ch.',
    'LBL_RELATED_PROSPECT_LISTS' => 't???t c??? m???c ti??u(s) li??n quan ?????n tin nh???n n??y.',
    'LBL_PROSPECT_LIST_NAME' => 't??n m???c ti??u',

    'LBL_LIST_PROSPECT_LIST_NAME' => 'Danh s??ch M???c ti??u',
    'LBL_MODULE_SEND_TEST' => 'Chi???n d???ch: G???i th??? nghi???m',
    'LBL_MODULE_SEND_EMAILS' => 'Chi???n d???ch: G???i email',
    'LBL_SCHEDULE_MESSAGE_TEST' => 'Vui l??ng ch???n c??c chi???n d???ch th?? m?? b???n mu???n ki???m tra:',
    'LBL_SCHEDULE_MESSAGE_EMAILS' => 'Vui l??ng ch???n c??c chi???n d???ch th?? m?? b???n mu???n l???p l???ch tr??nh ????? ph??n ph???i tr??n c??c ng??y ???????c ch??? ?????nh b???t ?????u v?? th???i gian:',
    'LBL_SCHEDULE_BUTTON_TITLE' => 'G???i',
    'LBL_SCHEDULE_BUTTON_LABEL' => 'G???i',
    'LBL_ERROR_ON_MARKETING' => 'Thi???u tr?????ng(s) y??u c???u',

    'LBL_CAMPAIGN_ID' => 'ID Chi???n d???ch',
    'LBL_OUTBOUND_EMAIL_ACOUNT_ID' => 'T??i kho???n email g???i ??i',
    'LBL_EMAIL_TEMPLATE' => 'Email m???u',
    'LBL_PROSPECT_LISTS' => 'Danh s??ch kh??ch h??ng ti???m n??ng',

);
