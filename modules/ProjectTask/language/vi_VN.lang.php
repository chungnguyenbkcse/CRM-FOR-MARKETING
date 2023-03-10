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
    'LBL_MODULE_NAME' => 'D??? ??n nh???ng ph???n vi???c',
    'LBL_MODULE_TITLE' => 'C??ng vi???c d??? ??n: Trang ch???',

    'LBL_ID' => 'ID:',
    'LBL_PROJECT_TASK_ID' => 'Id c??ng vi???c c???a d??? ??n:',
    'LBL_PROJECT_ID' => 'Id c???a d??? ??n:',
    'LBL_DATE_ENTERED' => 'Ng??y t???o:',
    'LBL_DATE_MODIFIED' => 'Ng??y s???a:',
    'LBL_ASSIGNED_USER_ID' => 'Giao cho:',
    'LBL_MODIFIED_USER_ID' => 'S???a ?????i Id ng?????i d??ng:',
    'LBL_CREATED_BY' => 'T???o b???i:',
    'LBL_NAME' => 'T??n:',
    'LBL_STATUS' => 'Tr???ng th??i:',
    'LBL_DATE_DUE' => 'Ng??y h???t h???n:',
    'LBL_TIME_DUE' => 'Th???i gian h???t h???n:',
    'LBL_PREDECESSORS' => 'ti???n nhi???m:',
    'LBL_DATE_START' => 'Ng??y b???t ?????u:',
    'LBL_DATE_FINISH' => 'Ng??y k???t th??c:',
    'LBL_TIME_START' => 'Th???i gian b???t ?????u:',
    'LBL_TIME_FINISH' => 'Th???i gian k???t th??c:',
    'LBL_DURATION' => 'Th???i l?????ng:',
    'LBL_DURATION_UNIT' => '????n v??? t??nh:',
    'LBL_ACTUAL_DURATION' => 'Th???i l?????ng th???c t???:',
    'LBL_PARENT_ID' => 'D??? ??n:',
    'LBL_PARENT_TASK_ID' => 'Id t??c v??? cha:',
    'LBL_PERCENT_COMPLETE' => '% Ho??n th??nh:',
    'LBL_PRIORITY' => '??u ti??n:',
    'LBL_DESCRIPTION' => 'Ghi ch??:',
    'LBL_ORDER_NUMBER' => 'S??? th??? t???:',
    'LBL_TASK_NUMBER' => 'S??? c??ng vi???c:',
    'LBL_TASK_ID' => 'T??c v??? Id:',
    'LBL_MILESTONE_FLAG' => 'M???c:',
    'LBL_ESTIMATED_EFFORT' => '?????c l?????ng chi ph?? (hrs):',
    'LBL_ACTUAL_EFFORT' => 'Chi ph?? th???c t??? (hrs):',
    'LBL_UTILIZATION' => 'S??? d???ng (%):',
    'LBL_DELETED' => '???? x??a:',

    'LBL_LIST_NAME' => 'T??n',
    'LBL_LIST_PARENT_NAME' => 'D??? ??n',
    'LBL_LIST_PERCENT_COMPLETE' => '% Ho??n th??nh',
    'LBL_LIST_STATUS' => 'Tr???ng th??i',
    'LBL_LIST_ASSIGNED_USER_ID' => 'Giao cho',
    'LBL_LIST_DATE_DUE' => 'Ng??y h???t h???n',
    'LBL_LIST_PRIORITY' => '??u ti??n',
    'LBL_LIST_CLOSE' => '????ng',
    'LBL_PROJECT_NAME' => 'T??n d??? ??n',

    'LNK_NEW_PROJECT' => 'T???o d??? ??n',
    'LNK_PROJECT_LIST' => 'Danh s??ch d??? ??n',
    'LNK_NEW_PROJECT_TASK' => 'T???o c??ng vi???c d??? ??n',
    'LNK_PROJECT_TASK_LIST' => 'D??? ??n nh???ng ph???n vi???c',

    'LBL_LIST_MY_PROJECT_TASKS' => 'C??ng vi???c d??? ??n c???a t??i',
    'LBL_DEFAULT_SUBPANEL_TITLE' => 'D??? ??n nh???ng ph???n vi???c',
    'LBL_NEW_FORM_TITLE' => 'C??ng vi???c d??? ??n m???i',

    'LBL_HISTORY_TITLE' => 'L???ch s???',
    'LBL_ACTIVITIES_SUBPANEL_TITLE' => 'Ho???t ?????ng',
    'LBL_HISTORY_SUBPANEL_TITLE' => 'L???ch s???',

    'LBL_ASSIGNED_USER_NAME' => 'Giao cho',
    'LBL_PARENT_NAME' => 'T??n d??? ??n',
    'LBL_EDITLAYOUT' => 'S???a khung' /*for 508 compliance fix*/,
    'LBL_PANEL_TIMELINE' => 'D??ng th???i gian',

    'LBL_SUBTASK' => 'T??c v??? ph???',
    'LBL_LAG' => 'T???t h???u',
    'LBL_DAYS' => 'Ng??y',
    'LBL_HOURS' => 'Gi???',
    'LBL_RELATIONSHIP_TYPE' => 'Ki???u quan h???',
);
