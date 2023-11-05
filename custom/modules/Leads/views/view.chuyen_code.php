<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

require_once('include/MVC/View/SugarView.php');

class CustomLeadsViewchuyen_Code extends SugarView
{
    public function display()
    {
        global $mod_strings, $current_user;
        $user = BeanFactory::getBean('Users', $current_user->id);
        $smarty = new Sugar_Smarty();

        parent::display();
        $smarty->display('custom/modules/Leads/tpls/chuyen_code.tpl');
    }
}