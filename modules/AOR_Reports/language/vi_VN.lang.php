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
    'LBL_DESCRIPTION' => 'M?? t???',
    'LBL_DELETED' => '???? x??a',
    'LBL_NAME' => 't??n',
    'LBL_CREATED_USER' => 'T???o b???i ng?????i d??ng',
    'LBL_MODIFIED_USER' => 'S???a b???i ng?????i d??ng',
    'LBL_LIST_NAME' => 't??n',
    'LBL_EDIT_BUTTON' => 'S???a',
    'LBL_REMOVE' => 'X??a b???',
    'LBL_LIST_FORM_TITLE' => 'Danh s??ch b??o c??o',
    'LBL_MODULE_NAME' => 'B??o c??o',
    'LBL_MODULE_TITLE' => 'B??o c??o',
    'LBL_HOMEPAGE_TITLE' => 'C??c b??o c??o c???a t??i',
    'LNK_NEW_RECORD' => 'T???o b??o c??o',
    'LNK_LIST' => 'B??o c??o',
    'LBL_SEARCH_FORM_TITLE' => 'T??m b??o c??o',
    'LBL_HISTORY_SUBPANEL_TITLE' => 'Xem l???ch s???',
    'LBL_ACTIVITIES_SUBPANEL_TITLE' => 'Ho???t ?????ng',
    'LBL_NEW_FORM_TITLE' => 'B??o c??o m???i',
    'LBL_REPORT_MODULE' => 'Module b??o c??o',
    'LBL_GRAPHS_PER_ROW' => 'Bi???u ????? theo d??ng',
    'LBL_FIELD_LINES' => 'C??c tr?????ng hi???n th???',
    'LBL_ADD_FIELD' => 'Th??m c??c tr?????ng',
    'LBL_CONDITION_LINES' => '??i???u ki???n',
    'LBL_ADD_CONDITION' => 'Th??m ??i???u ki???n',
    'LBL_EXPORT' => 'Xu???t ra',
    'LBL_DOWNLOAD_PDF' => 'T???i PDF',
    'LBL_ADD_TO_PROSPECT_LIST' => 'Th??m v??o m???c ti??u',
    'LBL_AOR_MODULETREE_SUBPANEL_TITLE' => 'C??y module',
    'LBL_AOR_FIELDS_SUBPANEL_TITLE' => 'C??c tr?????ng',
    'LBL_AOR_CONDITIONS_SUBPANEL_TITLE' => '??i???u ki???n',
    'LBL_TOTAL' => 'T???ng c???ng',
    'LBL_AOR_CHARTS_SUBPANEL_TITLE' => 'Bi???u ?????',
    'LBL_ADD_CHART' => 'Th??m bi???u ?????',
    'LBL_ADD_PARENTHESIS' => 'Ch??n d???u ngo???c ????n',// PR 5471 to be removed after merged
    'LBL_INSERT_PARENTHESIS' => 'Ch??n d???u ngo???c ????n', // PR 5471
    'LBL_CHART_TITLE' => 'Ti??u ?????',
    'LBL_CHART_TYPE' => 'Lo???i',
    'LBL_CHART_X_FIELD' => 'Tr???c X',
    'LBL_CHART_Y_FIELD' => 'Tr???c Y',
    'LBL_AOR_REPORTS_DASHLET' => 'B??o c??o',
    'LBL_DASHLET_TITLE' => 'Ti??u ?????',
    'LBL_DASHLET_REPORT' => 'B??o c??o',
    'LBL_DASHLET_CHOOSE_REPORT' => 'Vui l??ng ch???n m???t b??o c??o',
    'LBL_DASHLET_SAVE' => 'L??u',
    'LBL_DASHLET_CHARTS' => 'Bi???u ?????',
    'LBL_DASHLET_ONLY_CHARTS' => 'Ch??? hi???n th??? bi???u ?????',
    'LBL_UPDATE_PARAMETERS' => 'C???p nh???t',
    'LBL_PARAMETERS' => 'Tham s???',
    'LBL_TOOLTIP_DRAG_DROP_ELEMS' => 'K??o v?? th??? c??c ph???n t??? v??o c??c tr?????ng ho???c v??ng ??i???u ki???n',
    'LBL_MAIN_GROUPS' => 'Nh??m ch??nh:',
    'LBL_CHAR_UNNAMED_DEFAULT_TITLE' => 'Bi???u ????? kh??ng t??n',
    'LBL_REPORT' => 'B??o c??o',
);
