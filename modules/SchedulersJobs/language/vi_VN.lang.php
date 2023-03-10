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
    'LBL_NAME' => 'T??n c??ng vi???c',
    'LBL_EXECUTE_TIME' => 'Th???i gian th???c hi???n',
    'LBL_SCHEDULER_ID' => 'L???ch bi???u',
    'LBL_STATUS' => 'T??nh tr???ng c??ng vi???c',
    'LBL_RESOLUTION' => 'K???t qu???',
    'LBL_MESSAGE' => 'Th??ng ??i???p',
    'LBL_DATA' => 'D??? li???u vi???c l??m',
    'LBL_REQUEUE' => 'Th??? l???i khi th???t b???i',
    'LBL_RETRY_COUNT' => 'Th??? l???i t???i ??a',
    'LBL_FAIL_COUNT' => 'Th???t b???i',
    'LBL_INTERVAL' => 'Kho???ng c??ch gi???a c??c l???n th??? t???i thi???u',
    'LBL_CLIENT' => 'S??? h???u kh??ch h??ng',
    'LBL_PERCENT' => 'Ph???n tr??m ho??n th??nh',
// Errors
    'ERR_CALL' => "Kh??ng th??? g???i ch???c n??ng: %s",
    'ERR_CURL' => "Kh??ng CURL - kh??ng th??? ch???y c??c c??ng vi???c URL",
    'ERR_FAILED' => "Unexpected failure, please check PHP logs and sugarcrm.log",
    'ERR_PHP' => "%s [%d]: %s trong %s tr??n ???????ng %d",
    'ERR_NOUSER' => "Kh??ng c?? ID ng?????i d??ng ???????c ch??? ?????nh cho c??ng vi???c",
    'ERR_NOSUCHUSER' => "ID Ng?????i d??ng %s kh??ng t??m th???y",
    'ERR_JOBTYPE' => "Lo???i c??ng vi???c kh??ng x??c ?????nh: %s",
    'ERR_TIMEOUT' => "???? th???t b???i v?? h???t th???i h???n",
    'ERR_JOB_FAILED_VERBOSE' => 'C??ng vi???c %1$s (%2$s) ???? th???t b???i trong ch???y CRON',
);
