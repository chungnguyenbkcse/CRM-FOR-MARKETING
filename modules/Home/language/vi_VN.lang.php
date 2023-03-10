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
    'LBL_MODULE_NAME' => 'Trang ch???',
    'LBL_NEW_FORM_TITLE' => 'Li??n h??? m???i',
    'LBL_FIRST_NAME' => 'T??n:',
    'LBL_LAST_NAME' => 'H???:',
    'LBL_LIST_LAST_NAME' => 'H???',
    'LBL_PHONE' => '??T:',
    'LBL_EMAIL_ADDRESS' => '?????a ch??? Email:',
    'LBL_MY_PIPELINE_FORM_TITLE' => 'Bi???u ????? Pipeline',
    'LBL_PIPELINE_FORM_TITLE' => 'h??nh tr??nh b???i giai ??o???n',
    'LBL_RGraph_PIPELINE_FORM_TITLE' => 'h??nh tr??nh b???i giai ??o???n',
    'LNK_NEW_CONTACT' => 'T???o li??n h???',
    'LNK_NEW_ACCOUNT' => 't???o t??i kho???n',
    'LNK_NEW_OPPORTUNITY' => 't???o c?? h???i',
    'LNK_NEW_LEAD' => 'T???o KH ti???m n??ng',
    'LNK_NEW_CASE' => 't???o k???ch b???n',
    'LNK_NEW_NOTE' => 'T???o ghi ch?? ho???c ????nh k??m',
    'LNK_NEW_CALL' => 'Nh???t k?? cu???c g???i',
    'LNK_NEW_EMAIL' => 'L??u tr??? Email',
    'LNK_NEW_MEETING' => 'L???ch h???p',
    'LNK_NEW_TASK' => 'T???o c??ng vi???c',
    'LNK_NEW_BUG' => 'B??o c??o L???i',
    'LBL_ADD_BUSINESSCARD' => 'Nh???p Business Card',
    'LNK_NEW_SEND_EMAIL' => 'So???n email',
    'LBL_NO_ACCESS' => 'B???n kh??ng c?? quy???n truy c???p v??o khu v???c n??y. Li??n h??? v???i qu???n tr??? trang web c???a b???n ????? c?? ???????c quy???n truy c???p',
    'LBL_NO_RESULTS_IN_MODULE' => '-- Kh??ng c?? k???t qu??? --',
    'LBL_NO_RESULTS' => '<h2>Kh??ng t??m th???y k???t qu???. Xin vui l??ng t??m ki???m l???i.</h2><br>',
    'LBL_NO_RESULTS_TIPS' => '<h3>M???o t??m ki???m:</h3><ul><li>?????m b???o b???n c?? c??c danh m???c ph?? h???p ???????c ch???n ??? tr??n.</li><li>M??? r???ng c??c ti??u ch?? t??m ki???m c???a b???n.</li><li>N???u b???n v???n kh??ng th??? t??m th???y b???t k??? k???t qu??? n??o h??y th??? t??y ch???n t??m ki???m n??ng cao.</li></ul>',

    'LBL_ADD_DASHLETS' => 'Th??m SuiteCRM Dashlets',
    'LBL_WEBSITE_TITLE' => 'Trang web',
    'LBL_RSS_TITLE' => 'Tin m???i',
    'LBL_CLOSE_DASHLETS' => '????ng',
    'LBL_OPTIONS' => 'T??y ch???n',
    // dashlet search fields
    'LBL_TODAY' => 'Xem L???ch',
    'LBL_YESTERDAY' => 'H??m qua',
    'LBL_TOMORROW' => 'Ng??y mai',
    'LBL_NEXT_WEEK' => 'Tu???n t???i',
    'LBL_LAST_7_DAYS' => '7 ng??y tr?????c',
    'LBL_NEXT_7_DAYS' => '7 ng??y t???i',
    'LBL_LAST_MONTH' => 'Th??ng tr?????c',
    'LBL_NEXT_MONTH' => 'Th??ng t???i',
    'LBL_LAST_YEAR' => 'N??m tr?????c',
    'LBL_NEXT_YEAR' => 'N??m t???i',
    'LBL_LAST_30_DAYS' => '30 ng??y tr?????c',
    'LBL_NEXT_30_DAYS' => '30 ng??y t???i',
    'LBL_THIS_MONTH' => 'Th??ng n??y',
    'LBL_THIS_YEAR' => 'N??m nay',

    'LBL_MODULES' => 'M??-??un',
    'LBL_CHARTS' => 'Bi???u ?????',
    'LBL_TOOLS' => 'C??ng c???',
    'LBL_WEB' => 'Web',
    'LBL_SEARCH_RESULTS' => 'K???t qu??? t??m ki???m',

    // Dashlet Categories
    'dashlet_categories_dom' => array(
        'Module Views' => 'Xem Module',
        'Portal' => 'C???ng th??ng tin',
        'Charts' => 'Bi???u ?????',
        'Tools' => 'C??ng c???',
        'Miscellaneous' => 'Linh tinh'
    ),
    'LBL_ADDING_DASHLET' => 'Th??m SuiteCRM Dashlet...',
    'LBL_ADDED_DASHLET' => 'SuiteCRM Dashlet th??m',
    'LBL_REMOVE_DASHLET_CONFIRM' => 'B???n c?? ch???c b???n mu???n lo???i b??? n??y SuiteCRM Dashlet?',
    'LBL_REMOVING_DASHLET' => 'Lo???i b??? c??c SuiteCRM Dashlet...',
    'LBL_REMOVED_DASHLET' => 'SuiteCRM Dashlet removed',
    'LBL_DASHLET_CONFIGURE_GENERAL' => 'T???ng quan',
    'LBL_DASHLET_CONFIGURE_FILTERS' => 'S??ng l???c',
    'LBL_DASHLET_CONFIGURE_MY_ITEMS_ONLY' => 'Ch??? m???u c???a t??i',
    'LBL_DASHLET_CONFIGURE_TITLE' => 'Ti??u ?????',
    'LBL_DASHLET_CONFIGURE_DISPLAY_ROWS' => 'C??c d??ng hi???n th???',

    'LBL_DASHLET_DELETE' => 'X??a SuiteCRM Dashlet',
    'LBL_DASHLET_REFRESH' => 'L??m m???i SuiteCRM Dashlet',
    'LBL_DASHLET_EDIT' => 'Ch???nh s???a SuiteCRM Dashlet',

    // Default out-of-box names for tabs
    'LBL_HOME_PAGE_1_NAME' => 'My CRM',
    'LBL_CLOSE_SITEMAP' => '????ng',

    'LBL_SEARCH' => 'T??m',
    'LBL_CLEAR' => 'X??a',

    'LBL_BASIC_CHARTS' => 'Bi???u ????? c?? b???n',

    'LBL_DASHLET_SEARCH' => 'T??m SuiteCRM Dashlet',

//ABOUT page
    'LBL_VERSION' => 'Phi??n b???n',
    'LBL_BUILD' => '????ng g??i',

    'LBL_SOURCE_SUGAR' => 'SugarCRM Inc - nh?? cung c???p CE framework',

    'LBL_DASHLET_TITLE' => 'trang c???a t??i',
    'LBL_DASHLET_OPT_TITLE' => 'Ti??u ?????',
    'LBL_DASHLET_INCORRECT_URL' => 'Trang web kh??ng ????ng v??? tr?? ???????c ch??? ?????nh',
    'LBL_DASHLET_OPT_URL' => 'V??? tr?? trang web',
    'LBL_DASHLET_OPT_HEIGHT' => 'Chi???u cao Dashlet (theo ??i???m ???nh)',
    'LBL_DASHLET_SUGAR_NEWS' => 'Tin t???c SuiteCRM',
    'LBL_DASHLET_DISCOVER_SUGAR_PRO' => 'Kh??m ph?? SuiteCRM',
    'LBL_BASIC_SEARCH' => 'L???c nhanh' /*for 508 compliance fix*/,
    'LBL_ADVANCED_SEARCH' => 'B??? l???c n??ng cao' /*for 508 compliance fix*/,
    'LBL_TOUR_HOME' => 'Bi???u t?????ng trang ch???',
    'LBL_TOUR_HOME_DESCRIPTION' => 'Nhanh ch??ng quay v??? trang t???ng quan c???a trang ch??? trong m???t c?? nh???p chu???t.',
    'LBL_TOUR_MODULES' => 'M??-??un',
    'LBL_TOUR_MODULES_DESCRIPTION' => 'T???t c??? c??c module quan tr???ng c???a b???n ??ang ??? ????y.',
    'LBL_TOUR_MORE' => 'Th??m c??c module',
    'LBL_TOUR_MORE_DESCRIPTION' => 'Ph???n c??n l???i c???a c??c module c???a b???n ??ang ??? ????y.',
    'LBL_TOUR_SEARCH' => 'T??m ki???m v??n b???n ?????y ?????',
    'LBL_TOUR_SEARCH_DESCRIPTION' => 'T??m ki???m ch??? ????? nh???n ???????c thao t??c t???t h??n.',
    'LBL_TOUR_NOTIFICATIONS' => 'Ch?? ??',
    'LBL_TOUR_NOTIFICATIONS_DESCRIPTION' => 'Th??ng b??o ???ng d???ng SuiteCRM s??? xu???t hi???n ??? ????y.',
    'LBL_TOUR_PROFILE' => 'H??? s??',
    'LBL_TOUR_PROFILE_DESCRIPTION' => 'Truy c???p h??? s??, c??i ?????t v?? ????ng xu???t.',
    'LBL_TOUR_QUICKCREATE' => 'T???o nhanh',
    'LBL_TOUR_QUICKCREATE_DESCRIPTION' => 'Nhanh ch??ng t???o h??? s?? m?? kh??ng l??m m???t v??? tr?? c???a b???n.',
    'LBL_TOUR_FOOTER' => 'N???i l???i trang cu???i',
    'LBL_TOUR_FOOTER_DESCRIPTION' => 'D??? d??ng m??? r???ng v?? thu g???n cu???i trang.',
    'LBL_TOUR_CUSTOM' => 'Tu??? ch???nh Apps',
    'LBL_TOUR_CUSTOM_DESCRIPTION' => 'Tu??? ch???nh t??ch h???p s??? ??i ?????n ????y.',
    'LBL_TOUR_BRAND' => 'Th????ng hi???u c???a b???n',
    'LBL_TOUR_BRAND_DESCRIPTION' => 'Logo c???a b???n ??i ??? ????y. B???n c?? th??? di chu???t qua ????? xem th??m th??ng tin.',
    'LBL_TOUR_WELCOME' => 'Ch??o m???ng ?????n v???i SuiteCRM',
    'LBL_TOUR_WATCH' => 'Xem nh???ng g?? t??nh n??ng m???i trong SuiteCRM',
    'LBL_TOUR_FEATURES' => '<ul style=""><li class="icon-ok">Thanh ??i???u h?????ng ????n gi???n m???i</li><li class="icon-ok">Ch??n trang ????ng l???i m???i</li><li class="icon-ok"> C???i ti???n t??m ki???m</li><li class="icon-ok">Tr??nh ????n t??c v??? ???? c???p nh???t</li></ul> <p>v?? nhi???u h??n n???a!</p>',
    'LBL_TOUR_VISIT' => '????? bi???t th??m th??ng tin h??y truy c???p ???ng d???ng c???a ch??ng t??i',
    'LBL_TOUR_DONE' => 'B???n ???? ho??n t???t!',
    'LBL_TOUR_REFERENCE_1' => 'B???n c?? th??? lu??n lu??n tham kh???o t??? ch??ng t??i',
    'LBL_TOUR_REFERENCE_2' => 'th??ng qua c??c li??n k???t "H??? tr???" trong tab h??? s??.',
    'LNK_TOUR_DOCUMENTATION' => 't??i li???u h?????ng d???n',
    'LBL_TOUR_CALENDAR_URL_1' => 'B???n c?? chia s??? l???ch c???a SuiteCRM v???i c??c ???ng d???ng b??n th??? ba, ch???ng h???n nh?? Microsoft Outlook ho???c Exchange? N???u v???y, b???n c?? m???t URL m???i. URL n??y an to??n h??n bao g???m kh??a c?? nh??n s??? ng??n vi???c xu???t b???n tr??i ph??p l???ch c???a b???n.',
    'LBL_TOUR_CALENDAR_URL_2' => 'Truy xu???t l???ch URL ???????c chia s??? m???i c???a b???n.',
    'LBL_CONTRIBUTORS' => 'Nh????ng ng??????i ??o??ng go??p',
    'LBL_ABOUT_SUITE' => 'V??? SuiteCRM',
    'LBL_PARTNERS' => '?????i t??c',
    'LBL_FEATURING' => 'AOS, AOW, AOR, AOP, AOE v?? ?????nh l???i c??c module theo SalesAgility.',

    'LBL_CONTRIBUTOR_SUITECRM' => 'SuiteCRM - m?? ngu???n m??? CRM cho th??? gi???i',
    'LBL_CONTRIBUTOR_SECURITY_SUITE' => 'SecuritySuite b???i Jason Eggers',
    'LBL_CONTRIBUTOR_JJW_GMAPS' => 'JJWDesign Google Maps b???i Jeffrey J. Walters',
    'LBL_CONTRIBUTOR_CONSCIOUS' => 'SuiteCRM LOGO cung c???p b???i c??c gi???i ph??p c?? ?? th???c',
    'LBL_CONTRIBUTOR_RESPONSETAP' => '????ng g??p ????? SuiteCRM 7.3 ph??t h??nh b???i ResponseTap',
    'LBL_CONTRIBUTOR_GMBH' => 'C??c tr?????ng t??nh to??n c???a Workflow ???????c ????ng g??p b???i diligent technology & business consulting GmbH',

    'LBL_LANGUAGE_ABOUT' => 'V??? b???n d???ch SuiteCRM',
    'LBL_LANGUAGE_COMMUNITY_ABOUT' => 'B???n d???ch h???p t??c c???a c???ng ?????ng SuiteCRM',
    'LBL_LANGUAGE_COMMUNITY_PACKS' => 'B???n d???ch ???????c t???o b???ng Crowdin',

    'LBL_ABOUT_SUITE_2' => 'SuiteCRM ???????c xu???t b???n theo m???t gi???y ph??p m?? ngu???n m??? - AGPLv3',
    'LBL_ABOUT_SUITE_4' => 'T???t c??? c??c m?? SuiteCRM qu???n l?? v?? ph??t tri???n b???i d??? ??n s??? ???????c ph??t h??nh m?? ngu???n m??? - AGPLv3',
    'LBL_ABOUT_SUITE_5' => 'H??? tr??? SuiteCRM c?? s???n trong c??? hai l???a ch???n mi???n ph?? v?? tr??? ti???n',

    'LBL_SUITE_PARTNERS' => 'Ch??ng t??i c?? ?????i t??c trung th??nh v???i SuiteCRM, nh???ng ng?????i lu??n say m?? v??? m?? ngu???n m???. ????? xem danh s??ch ?????i t??c ?????y ????? c???a ch??ng t??i, h??y xem trang web c???a ch??ng t??i.',

    'LBL_SAVE_BUTTON' => 'L??u',
    'LBL_DELETE_BUTTON' => 'X??a',
    'LBL_APPLY_BUTTON' => '??p d???ng',
    'LBL_SEND_INVITES' => 'G???i th?? m???i',
    'LBL_CANCEL_BUTTON' => 'H???y',
    'LBL_CLOSE_BUTTON' => '????ng',

    'LBL_CREATE_NEW_RECORD' => 'T???o ho???t ?????ng',
    'LBL_CREATE_CALL' => 'Log Cu???c g???i',
    'LBL_CREATE_MEETING' => 'L???ch h???p',

    'LBL_GENERAL_TAB' => 'Chi ti???t',
    'LBL_PARTICIPANTS_TAB' => 'Ng?????i ???????c m???i',
    'LBL_REPEAT_TAB' => 'T??i ph??t',

    'LBL_REPEAT_TYPE' => 'L???p l???i',
    'LBL_REPEAT_INTERVAL' => 'M???i',
    'LBL_REPEAT_END' => 'K???t th??c',
    'LBL_REPEAT_END_AFTER' => 'Sau',
    'LBL_REPEAT_OCCURRENCES' => 't??i ph??t',
    'LBL_REPEAT_END_BY' => 'B???i',
    'LBL_REPEAT_DOW' => 'Tr??n',
    'LBL_REPEAT_UNTIL' => 'L???p l???i cho ?????n khi',
    'LBL_REPEAT_COUNT' => 'S??? l?????ng c??c t??i ph??t',
    'LBL_REPEAT_LIMIT_ERROR' => 'Y??u c???u c???a b???n s??? t???o ra nhi???u h??n cu???c h???p $limit.',

    //Events PR 5641
    'LNK_EVENT' => 'S??? ki???n',
    'LNK_EVENT_VIEW' => 'Xem s??? ki???n',
    'LBL_DATE' => 'Ng??y: ',
    'LBL_DURATION' => 'Kho???ng th???i gian: ',
    'LBL_NAME' => 'Ti??u ?????: ',
    'LBL_HOUR_ABBREV' => 'gi???',
    'LBL_HOURS_ABBREV' => 'gi???',
    'LBL_MINSS_ABBREV' => 'ph??t',
    'LBL_LOCATION' => '?????a ??i???m: ',
    'LBL_STATUS' => 'Tr???ng th??i: ',
    'LBL_DESCRIPTION' => 'M?? t???: ',
    //End Events

    'LBL_ELASTIC_SEARCH_EXCEPTION_SEARCH_INVALID_REQUEST' => 'C?? l???i x???y ra khi th???c hi???n t??m ki???m. C?? ph??p truy v???n c???a b???n kh??ng h???p l???.',
    'LBL_ELASTIC_SEARCH_EXCEPTION_SEARCH_ENGINE_NOT_FOUND' => 'Kh??ng th??? t??m th???y B??? m??y t??m ki???m ???????c y??u c???u. H??y th??? th???c hi???n t??m ki???m m???t l???n n???a.',
    'LBL_ELASTIC_SEARCH_EXCEPTION_NO_NODES_AVAILABLE' => 'K???t n???i t???i m??y ch??? Elastic Search th???t b???i.',
    'LBL_ELASTIC_SEARCH_EXCEPTION_SEARCH' => '???? x???y ra l???i n???i b??? ?????i v???i T??m ki???m.',
    'LBL_ELASTIC_SEARCH_EXCEPTION_DEFAULT' => 'M???t l???i kh??ng x??c ?????nh ???? x???y ra trong khi th???c hi???n t??m ki???m.',
    'LBL_ELASTIC_SEARCH_EXCEPTION_END_MESSAGE' => 'Li??n h??? v???i qu???n tr??? vi??n n???u v???n ????? v???n c??n. Th??ng tin th??m c?? s???n trong logs.',
);