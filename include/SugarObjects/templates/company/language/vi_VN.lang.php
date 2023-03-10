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
    'ERR_DELETE_RECORD' => 'M???t s??? h??? s?? ph???i ???????c x??c ?????nh ????? xo?? t??i kho???n n??y.',
    'LBL_ACCOUNT_NAME' => 'T??n c??ng ty:',
    'LBL_ACCOUNT' => 'C??ng ty:',
    'LBL_ACTIVITIES_SUBPANEL_TITLE' => 'Ho???t ?????ng',
    'LBL_ADDRESS_INFORMATION' => 'Th??ng tin ?????a ch???',
    'LBL_ANNUAL_REVENUE' => 'Doanh thu h??ng n??m:',
    'LBL_ANY_ADDRESS' => '?????a ch???:',
    'LBL_ANY_EMAIL' => 'Email:',
    'LBL_EMAIL_NON_PRIMARY' => 'E-mail kh??ng ch??nh th???c',
    'LBL_ANY_PHONE' => '??i???n tho???i:',
    'LBL_ASSIGNED_TO_NAME' => 'Ng?????i d??ng:',
    'LBL_RATING' => 'X???p h???ng',
    'LBL_ASSIGNED_TO' => 'Giao cho:',
    'LBL_ASSIGNED_USER' => 'Giao cho:',
    'LBL_ASSIGNED_TO_ID' => 'Giao cho:',
    'LBL_BILLING_ADDRESS_CITY' => 'Th??nh ph???:',
    'LBL_BILLING_ADDRESS_COUNTRY' => 'Qu???c gia:',
    'LBL_BILLING_ADDRESS_POSTALCODE' => 'M?? b??u ch??nh:',
    'LBL_BILLING_ADDRESS_STATE' => 'Qu???n huy???n:',
    'LBL_BILLING_ADDRESS_STREET_2' => 'T??n ???????ng 2',
    'LBL_BILLING_ADDRESS_STREET_3' => 'T??n ???????ng 3',
    'LBL_BILLING_ADDRESS_STREET_4' => 'T??n ???????ng 4',
    'LBL_BILLING_ADDRESS_STREET' => 'T??n ???????ng:',
    'LBL_BILLING_ADDRESS' => '?????a ch???:',
    'LBL_ACCOUNT_INFORMATION' => 'Th??ng tin c??ng ty',
    'LBL_CITY' => 'Th??nh ph???:',
    'LBL_CONTACTS_SUBPANEL_TITLE' => 'Li??n h???',
    'LBL_COUNTRY' => 'Qu???c gia:',
    'LBL_DATE_ENTERED' => 'Ng??y t???o:',
    'LBL_DATE_MODIFIED' => 'Ng??y ch???nh s???a:',
    'LBL_DEFAULT_SUBPANEL_TITLE' => 'T??i kho???n',
    'LBL_DESCRIPTION_INFORMATION' => 'Th??ng tin m?? t???',
    'LBL_DESCRIPTION' => 'M?? t???:',
    'LBL_DUPLICATE' => 'C?? kh??? n??ng tr??ng l???p t??i kho???n',
    'LBL_EMAIL' => '?????a ch??? Email:',
    'LBL_EMPLOYEES' => 'Nh??n vi??n:',
    'LBL_FAX' => 'Fax:',
    'LBL_INDUSTRY' => 'Lo???i h??nh:',
    'LBL_LIST_ACCOUNT_NAME' => 'T??n t??i kho???n',
    'LBL_LIST_CITY' => 'Th??nh ph???',
    'LBL_LIST_EMAIL_ADDRESS' => '?????a ch??? Email',
    'LBL_LIST_PHONE' => '??i???n tho???i',
    'LBL_LIST_STATE' => 'Ti???u bang',
    'LBL_MEMBER_OF' => 'Th??nh vi??n c???a:',
    'LBL_MEMBER_ORG_SUBPANEL_TITLE' => 'T??? ch???c th??nh vi??n',
    'LBL_NAME' => 'T??n:',
    'LBL_OTHER_EMAIL_ADDRESS' => 'Email kh??c:',
    'LBL_OTHER_PHONE' => '??i???n tho???i kh??c:',
    'LBL_OWNERSHIP' => 'Quy???n s??? h???u:',
    'LBL_PARENT_ACCOUNT_ID' => 'ID Kh??ch h??ng c???p tr??n',
    'LBL_PHONE_ALT' => '??i???n tho???i kh??c:',
    'LBL_PHONE_FAX' => 'S??? Fax:',
    'LBL_PHONE_OFFICE' => '??i???n tho???i VP:',
    'LBL_PHONE' => '??i???n tho???i:',
    'LBL_EMAIL_ADDRESS' => '?????a ch??? Email',
    'LBL_EMAIL_ADDRESSES' => '?????a ch??? email',
    'LBL_POSTAL_CODE' => 'M?? b??u ch??nh:',
    'LBL_SAVE_ACCOUNT' => 'L??u',
    'LBL_SHIPPING_ADDRESS_CITY' => 'Th??nh ph???:',
    'LBL_SHIPPING_ADDRESS_COUNTRY' => 'Qu???c gia:',
    'LBL_SHIPPING_ADDRESS_POSTALCODE' => 'M?? b??u ch??nh:',
    'LBL_SHIPPING_ADDRESS_STATE' => 'Ti???u bang:',
    'LBL_SHIPPING_ADDRESS_STREET_2' => '?????a ch??? giao h??ng 2',
    'LBL_SHIPPING_ADDRESS_STREET_3' => '?????a ch??? giao h??ng 3',
    'LBL_SHIPPING_ADDRESS_STREET_4' => '?????a ch??? giao h??ng 4',
    'LBL_SHIPPING_ADDRESS_STREET' => '?????a ch??? giao h??ng:',
    'LBL_SHIPPING_ADDRESS' => '?????a ch??? giao h??ng:',

    'LBL_STATE' => 'Ti???u bang ho???c khu v???c:', //For address fields
    'LBL_TICKER_SYMBOL' => 'Bi???u t?????ng ticker:',
    'LBL_TYPE' => 'Lo???i:',
    'LBL_WEBSITE' => 'Trang web:',

    'LNK_ACCOUNT_LIST' => 'Kh??ch H??ng',
    'LNK_NEW_ACCOUNT' => 'T???o Account',

    'MSG_DUPLICATE' => 'B???n ghi t??i kho???n b???n ??ang t???o ra c?? th??? l?? m???t b???n sao c???a m???t b???n ghi t??i kho???n ???? t???n t???i. H??? s?? t??i kho???n c?? t??n t????ng t??? ???????c li???t k?? d?????i ????y. <br>Nh???p v??o t???o t??i kho???n ????? ti???p t???c t???o t??i kho???n m???i n??y, ho???c ch???n m???t t??i kho???n s???n c?? li???t k?? d?????i ????y.',
    'MSG_SHOW_DUPLICATES' => 'B???n ghi t??i kho???n b???n ??ang t???o ra c?? th??? l?? m???t b???n sao c???a m???t b???n ghi t??i kho???n ???? t???n t???i. H??? s?? t??i kho???n c?? t??n t????ng t??? ???????c li???t k?? d?????i ????y. <br>Nh???p v??o t???o t??i kho???n ????? ti???p t???c t???o t??i kho???n m???i n??y, ho???c ch???n m???t t??i kho???n s???n c?? li???t k?? d?????i ????y.',

    'NTC_DELETE_CONFIRMATION' => 'B???n ch???c mu???n xo?? ho??n to??n b???n ghi?',

    'LBL_EDIT_BUTTON' => 'Ch???nh s???a  ',
    'LBL_REMOVE' => 'X??a b???',

);