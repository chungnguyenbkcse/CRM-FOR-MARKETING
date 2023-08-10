<?php
if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

require_once('include/MVC/View/SugarView.php');

class LeadsViewImport extends SugarView
{
    public function display()
    {
        $html = <<<"HTML"
            <h1>Import dữ liệu</h1>
            <div class="row">
                <div class="col-md-6">
                    <input type="file" name="file">
                </div>
                <div class="col-md-6">
                    <input type="submit" value="Import">
                </div>
            </div>
            HTML;

        echo $html;
    }
}