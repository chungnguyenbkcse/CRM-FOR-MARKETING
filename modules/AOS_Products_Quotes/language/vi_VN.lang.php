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
    'LBL_ASSIGNED_TO_ID' => 'T??n ng?????i d??ng ???????c ch??? ?????nh',
    'LBL_ASSIGNED_TO_NAME' => 'Ch??? ?????nh cho',
    'LBL_ID' => 'ID',
    'LBL_DATE_ENTERED' => 'Ng??y t???o',
    'LBL_DATE_MODIFIED' => 'Ng??y ch???nh s???a',
    'LBL_MODIFIED' => '???????c s???a b???i',
    'LBL_MODIFIED_NAME' => 'Ch???nh s???a b???i T??n',
    'LBL_CREATED' => 'Kh???i t???o b???i',
    'LBL_DESCRIPTION' => 'Ghi ch??',
    'LBL_DELETED' => '???? x??a',
    'LBL_NAME' => 'T??n',
    'LBL_NUMBER' => 'S???', //PR 3296
    'LBL_CREATED_USER' => 'T???o b???i ng?????i d??ng',
    'LBL_MODIFIED_USER' => 'S???a b???i ng?????i d??ng',
    'LBL_LIST_FORM_TITLE' => 'Danh s??ch b??o gi?? s???n ph???m',
    'LBL_MODULE_NAME' => 'C??c h??ng m???c',
    'LBL_MODULE_TITLE' => 'B??o gi?? s???n ph???m: Trang ch???',
    'LBL_HOMEPAGE_TITLE' => 'B??o gi?? s???n ph???m c???a t??i',
    'LNK_NEW_RECORD' => 'T???o b??o gi?? s???n ph???m',
    'LNK_LIST' => 'B??o gi?? s???n ph???m',
    'LBL_SEARCH_FORM_TITLE' => 'T??m b??o gi?? s???n ph???m',
    'LBL_HISTORY_SUBPANEL_TITLE' => 'Xem l???ch s???',
    'LBL_ACTIVITIES_SUBPANEL_TITLE' => 'Ho???t ?????ng',
    'LBL_NEW_FORM_TITLE' => 'B??o gi?? s???n ph???m m???i',
    'LBL_PRODUCT_NAME' => 'T??n',
    'LBL_PRODUCT_NUMBER' => 'S???', //PR 3296
    'LBL_PRODUCT_QTY' => 'S??? l?????ng',
    'LBL_PRODUCT_COST_PRICE' => 'Chi ph?? gi?? c???',
    'LBL_PRODUCT_LIST_PRICE' => 'Danh s??ch gi??',
    'LBL_PRODUCT_UNIT_PRICE' => '????n gi??',
    'LBL_PRODUCT_DISCOUNT' => 'Chi???t kh???u',
    'LBL_PRODUCT_DISCOUNT_AMOUNT' => 'S??? ti???n gi???m gi??',
    'LBL_PART_NUMBER' => 'Part Number',
    'LBL_PRODUCT_DESCRIPTION' => 'M?? t???',
    'LBL_DISCOUNT' => 'Ki???u gi???m gi??',
    'LBL_VAT_AMT' => 'T???ng s??? ti???n thu???',
    'LBL_VAT' => 'Thu???',
    'LBL_PRODUCT_TOTAL_PRICE' => 'T???ng gi??',
    'LBL_PRODUCT_NOTE' => 'Ghi ch??',
    'Quote' => '',
    'LBL_FLEX_RELATE' => 'Li??n quan ?????n',
    'LBL_PRODUCT' => 'S???n ph???m',

    'LBL_SERVICE_MODULE_NAME' => 'D???ch v???',
    'LBL_SERVICE_NUMBER' => 'S???', //PR 3296
    'LBL_LIST_NUM' => 'S???',
    'LBL_PARENT_ID' => 'Nh??m cha',
    'LBL_GROUP_NAME' => 'Nh??m',
    'LBL_GROUP_DESCRIPTION' => 'M?? t???', //PR 3296
    'LBL_PRODUCT_COST_PRICE_USDOLLAR' => 'Chi ph?? gi?? c??? (ti???n t??? m???c ?????nh)',
    'LBL_PRODUCT_LIST_PRICE_USDOLLAR' => 'Danh s??ch gi?? (ti???n t??? m???c ?????nh)',
    'LBL_PRODUCT_UNIT_PRICE_USDOLLAR' => '????n gi?? (ti???n t??? m???c ?????nh)',
    'LBL_PRODUCT_TOTAL_PRICE_USDOLLAR' => 'T???ng gi?? (ti???n t??? m???c ?????nh)',
    'LBL_PRODUCT_DISCOUNT_USDOLLAR' => 'Gi???m gi?? (ti???n t??? m???c ?????nh)',
    'LBL_PRODUCT_DISCOUNT_AMOUNT_USDOLLAR' => 'T???ng gi???m gi?? (ti???n t??? m???c ?????nh)',
    'LBL_VAT_AMT_USDOLLAR' => 'T???ng thu??? (ti???n t??? m???c ?????nh)',
    'LBL_PRODUCTS_SERVICES' => 'S???n ph???m / d???ch v???',
    'LBL_PRODUCT_ID' => 'ID s???n ph???m',

    'LBL_AOS_CONTRACTS' => 'H???p ?????ng',
    'LBL_AOS_INVOICES' => 'H??a ????n',
    'LBL_AOS_PRODUCTS' => 'S???n ph???m',
    'LBL_AOS_QUOTES' => 'B??o gi??',
);