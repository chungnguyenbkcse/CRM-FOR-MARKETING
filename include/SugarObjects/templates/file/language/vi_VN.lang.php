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
    //module
    'LBL_MODULE_NAME' => 'T??i li???u',
    'LBL_MODULE_TITLE' => 'T??i li???u: Trang ch???',
    'LNK_NEW_DOCUMENT' => 'T???o T??i li???u',
    'LNK_DOCUMENT_LIST' => 'Danh s??ch t??i li???u',
    'LBL_SEARCH_FORM_TITLE' => 'T??m ki???m T??i li???u',
    //vardef labels
    'LBL_NAME' => 'T??n T??i li???u',
    'LBL_DESCRIPTION' => 'M?? t???',
    'LBL_ASSIGNED_TO' => 'Giao cho:',
    'LBL_CATEGORY' => 'Ch???ng lo???i',
    'LBL_SUBCATEGORY' => 'Ch???ng lo???i ph???',
    'LBL_STATUS' => 'T??nh tr???ng',
    'LBL_IS_TEMPLATE' => 'l??m M???u',
    'LBL_TEMPLATE_TYPE' => 'Lo???i T??i li???u',
    'LBL_REVISION_NAME' => 'S??? B???n s???a',
    'LBL_MIME' => 'Lo???i Mime',
    'LBL_REVISION' => 'B???n s???a',
    'LBL_DOCUMENT' => 'T??i li???u li??n quan',
    'LBL_LATEST_REVISION' => 'B???n ??i???u ch???nh cu???i',
    'LBL_CHANGE_LOG' => 'Log Thay ?????i',
    'LBL_ACTIVE_DATE' => 'Ng??y ph??t h??nh',
    'LBL_EXPIRATION_DATE' => 'Ng??y h???t h???n',
    'LBL_FILE_EXTENSION' => 'T???p tin m??? r???ng',

    'LBL_CAT_OR_SUBCAT_UNSPEC' => 'Kh??ng x??c ?????nh',
    //quick search
    'LBL_NEW_FORM_TITLE' => 'T??i li???u m???i',
    //document edit and detail view
    'LBL_DOC_NAME' => 'T??n T??i li???u:',
    'LBL_FILENAME' => 'T??n t???p tin:',
    'LBL_FILE_UPLOAD' => 'T???p tin:',
    'LBL_DOC_VERSION' => 'Phi??n b???n:',
    'LBL_CATEGORY_VALUE' => 'Ch???ng lo???i:',
    'LBL_SUBCATEGORY_VALUE' => 'Ch???ng lo???i ph???:',
    'LBL_DOC_STATUS' => 'T??nh tr???ng:',
    'LBL_DET_TEMPLATE_TYPE' => 'Lo???i T??i li???u:',
    'LBL_DOC_DESCRIPTION' => 'M?? t???:',
    'LBL_DOC_ACTIVE_DATE' => 'Ng??y ph??t h??nh:',
    'LBL_DOC_EXP_DATE' => 'Ng??y h???t h???n:',

    //document list view.
    'LBL_LIST_FORM_TITLE' => 'Danh s??ch T??i li???u',
    'LBL_LIST_DOCUMENT' => 'T??i li???u',
    'LBL_LIST_CATEGORY' => 'Ch???ng lo???i',
    'LBL_LIST_SUBCATEGORY' => 'Ch???ng lo???i ph???',
    'LBL_LIST_REVISION' => 'B???n s???a',
    'LBL_LIST_LAST_REV_CREATOR' => 'ph??t h??nh b???i',
    'LBL_LIST_LAST_REV_DATE' => 'Ng??y B???n s???a',
    'LBL_LIST_VIEW_DOCUMENT' => 'Xem',
    'LBL_LIST_ACTIVE_DATE' => 'Ng??y ph??t h??nh',
    'LBL_LIST_EXP_DATE' => 'Ng??y h???t h???n',
    'LBL_LIST_STATUS' => 'T??nh tr???ng',

    //document search form.
    'LBL_SF_CATEGORY' => 'Ch???ng lo???i:',
    'LBL_SF_SUBCATEGORY' => 'Ch???ng lo???i ph???:',

    'DEF_CREATE_LOG' => 'T??i li???u ???? ???????c t???o',

    //error messages
    'ERR_DOC_NAME' => 'T??n T??i li???u',
    'ERR_DOC_ACTIVE_DATE' => 'Ng??y ph??t h??nh',
    'ERR_FILENAME' => 'T??n t???p tin',

    //sub-panel vardefs.
    'LBL_LIST_DOCUMENT_NAME' => 'T??n T??i li???u',

    'LBL_EDIT_BUTTON' => 'Ch???nh s???a ',
    'LBL_REMOVE' => 'X??a b???',

);
