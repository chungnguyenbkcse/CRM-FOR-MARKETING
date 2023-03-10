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
    'LNK_NEW_CALL' => 'Nh???t k?? cu???c g???i',
    'LNK_NEW_MEETING' => 'L???ch h???p',
    'LNK_NEW_TASK' => 'T???o c??ng vi???c',
    'LNK_NEW_NOTE' => 't???o ghi ch?? ho???c ????nh k??m',
    'LNK_NEW_EMAIL' => 'So???n Email',
    'LNK_CALL_LIST' => 'Cu???c g???i',
    'LNK_MEETING_LIST' => 'H???i h???p',
    'LNK_TASK_LIST' => 'C??ng vi???c',
    'LNK_NOTE_LIST' => 'Ghi ch??',
    'LBL_ADD_FIELD' => 'Th??m v??ng:',
    'LBL_SEARCH_FORM_TITLE' => 'Module t??m ki???m',
    'COLUMN_TITLE_NAME' => 'T??n v??ng',
    'COLUMN_TITLE_DISPLAY_LABEL' => 'Hi???n th??? nh??n',
    'COLUMN_TITLE_LABEL_VALUE' => 'Gi?? tr??? nh??n',
    'COLUMN_TITLE_LABEL' => 'Nh??n h??? th???ng',
    'COLUMN_TITLE_DATA_TYPE' => 'Ki???u d??? li???u',
    'COLUMN_TITLE_MAX_SIZE' => 'K??ch th?????c l???n nh???t',
    'COLUMN_TITLE_HELP_TEXT' => 'V??ng gi??p ?????',
    'COLUMN_TITLE_COMMENT_TEXT' => 'V??ng b??nh lu???n',
    'COLUMN_TITLE_REQUIRED_OPTION' => 'V??ng y??u c???u',
    'COLUMN_TITLE_DEFAULT_VALUE' => 'Gi?? tr??? m???c ?????nh',
    'COLUMN_TITLE_FRAME_HEIGHT' => 'Chi???u cao IFrame',
    'COLUMN_TITLE_HTML_CONTENT' => 'HTML',
    'COLUMN_TITLE_URL' => 'URL m???c ?????nh',
    'COLUMN_TITLE_AUDIT' => 'Ki???m to??n',
    'COLUMN_TITLE_MIN_VALUE' => 'Gi?? tr??? nh??? nh???t',
    'COLUMN_TITLE_MAX_VALUE' => 'Gi?? tr??? l???n nh???t',
    'COLUMN_TITLE_LABEL_ROWS' => 'h??ng',
    'COLUMN_TITLE_LABEL_COLS' => 'C???t',
    'COLUMN_TITLE_DISPLAYED_ITEM_COUNT' => '# M???c ???????c hi???n th???',
    'COLUMN_TITLE_AUTOINC_NEXT' => 'T??? ?????ng t??ng gi?? tr??? ti???p theo',
    'COLUMN_DISABLE_NUMBER_FORMAT' => 'V?? hi???u h??a d???nh d???ng',
    'COLUMN_TITLE_ENABLE_RANGE_SEARCH' => 'M??? v??ng t??m ki???m',
    'LBL_DROP_DOWN_LIST' => 'Th??? xu???ng danh s??ch',
    'LBL_RADIO_FIELDS' => 'Tr?????ng v?? tuy???n',
    'LBL_MULTI_SELECT_LIST' => 'Danh s??ch ch???n nhi???u',
    'COLUMN_TITLE_PRECISION' => 'T??nh ch??nh x??c',
    'LBL_MODULE' => 'Ch???c n??ng',
    'COLUMN_TITLE_MASS_UPDATE' => 'Kh???i l?????ng C???p Nh???t',
    'COLUMN_TITLE_IMPORTABLE' => 'C?? th??? nh???p',
    'COLUMN_TITLE_DUPLICATE_MERGE' => 'H???p nh???t tr??ng l???p',
    'LBL_LABEL' => 'Nh??n',
    'LBL_DATA_TYPE' => 'Ki???u d??? li???u',
    'LBL_DEFAULT_VALUE' => 'Gi?? tr??? m???c ?????nh',
    'ERR_RESERVED_FIELD_NAME' => "T??? kho?? D??nh ri??ng",
    'ERR_SELECT_FIELD_TYPE' => 'Vui l??ng ch???n m???t lo???i tr?????ng',
    'ERR_FIELD_NAME_ALREADY_EXISTS' => 'T??n tr?????ng ???? t???n t???i',
    'LBL_BTN_ADD' => 'Th??m',
    'LBL_BTN_EDIT' => 'S???a',
    'LBL_GENERATE_URL' => 'T???o URL',
    'LBL_CALCULATED' => 'Gi?? tr??? ???? t??nh',
    'LBL_LINK_TARGET' => 'M??? Li??n K???t',
    'LBL_IMAGE_WIDTH' => 'Chi???u r???ng',
    'LBL_IMAGE_HEIGHT' => 'Chi???u cao',
    'LBL_IMAGE_BORDER' => '???????ng vi???n',
    'LBL_HELP' => 'Gi??p ?????' /*for 508 compliance fix*/,
    'COLUMN_TITLE_INLINE_EDIT_TEXT' => 'S???a tr???c ti???p',
    'COLUMN_TITLE_PARENT_ENUM' => 'Parent th??? xu???ng',
);