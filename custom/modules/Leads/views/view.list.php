<?php
    require_once('include/MVC/View/views/view.list.php');
    require_once('modules/Leads/LeadsListViewSmarty.php');

    class CustomLeadsViewList extends ViewList
    {

        

        public function listViewProcess()
        {
            global $current_user;
            $user = BeanFactory::getBean('Users', $current_user->id);


            

            if ($_COOKIE['role']){
                $role = $_COOKIE['role'];

                if ($role == "MKT"){
                    if ($this->where == ""){
                        $this->where .= " AND (leads.created_by = '{$user->id}' OR leads.modified_user_id = '{$user->id}' OR (leads.data_sources != '9' AND leads.data_sources != '10'))";
                    }
                    else {
                        $this->where .= "  AND (leads.created_by = '{$user->id}' OR leads.modified_user_id = '{$user->id}' OR (leads.data_sources != '9' AND leads.data_sources != '10'))";
                    }
                }

                if ($role == "RO"){
                    if ($user->id == '54e005cb-332b-9c26-c173-6406e116558f') {
                        $this->where .= " AND leads.sale_stage != '7' AND ( leads.owned_branch = 'HCM_2' OR (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true) OR ( leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != ''))";
                       
                    }
                    else if ($user->id == '640b5327-a567-bdd1-c73f-64a657064f4a') {
                        $this->where .= " AND leads.sale_stage != '7' AND ( leads.owned_branch = 'HCM_3' OR leads.owned_branch = '8' OR leads.owned_branch = 'HCM_4'  OR (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true) OR ( leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != ''))";
                    }
                    else if ($user->id == '351edcea-83d2-bf13-f595-64a80ff642b5') {
                        $this->where .= " AND leads.sale_stage != '7' AND ( leads.owned_branch = 'HCM_3' OR (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true) OR ( leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != ''))";
                    }
                    else if ($user->id == 'a5a5f967-0e9e-5d0c-6a51-63fdc413bf45') {
                        $this->where .= " AND leads.sale_stage != '7' AND ((leads.created_by = '1' AND leads.ro_name = '{$user->id}' AND lead_status = '1' AND sale_stage = '1') OR (ro_name  = 'a5a5f967-0e9e-5d0c-6a51-63fdc413bf45' AND data_sources = '10') OR (ro_name  = 'a5a5f967-0e9e-5d0c-6a51-63fdc413bf45' AND data_sources = '9') OR (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true)  OR (leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != ''))";
                    }
                    else if ($user->id == '9232e852-23f5-3a3a-db34-63fdc497d906') {
                        $this->where .= " AND leads.sale_stage != '7' AND ((leads.created_by = '1' AND leads.ro_name = '{$user->id}' AND lead_status = '1' AND sale_stage = '1') OR (ro_name  = '9232e852-23f5-3a3a-db34-63fdc497d906' AND data_sources = '9') OR (ro_name  = '9232e852-23f5-3a3a-db34-63fdc497d906' AND data_sources = '10') OR (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true)  OR (leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != ''))";
                    }
                    else if ($user->id == '497f0e21-37eb-a875-75b2-63fdb2c03264') {
                        $this->where .= " AND leads.sale_stage != '7' AND ((leads.created_by = '1' AND leads.ro_name = '{$user->id}' AND lead_status = '1' AND sale_stage = '1') OR ((leads.data_sources = '9' OR leads.data_sources = '10') AND leads.lead_status = '17') OR (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true)  OR (leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != ''))";
                    }
                    else if ($user->id == '874a0d88-138e-bbd8-a573-6440b69c3aa6' || $user->id == '1b67e2b2-99ce-71d9-6ab4-6440b68dbd20' || $user->id == '413fda5b-cf08-2583-7706-6406e1753591') {
                        $this->where .= " AND ((leads.created_by = '1' AND leads.ro_name = '{$user->id}' AND lead_status = '1' AND sale_stage = '1') OR ((leads.data_sources = '9' OR leads.data_sources = '10') AND leads.lead_status = '17') OR (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true)  OR (leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != ''))";
                    }
                    else if ($this->where == ""){
                        $this->where .= " AND leads.sale_stage != '7' AND ((leads.created_by = '1' AND leads.ro_name = '{$user->id}' AND lead_status = '1' AND sale_stage = '1') OR (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true)  OR (leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != ''))";
                    }
                    else {
                        $this->where .= " AND leads.sale_stage != '7' AND ( (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true) OR (leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != ''))";
                    }
                }

                if ($role == "HO"){
                    if ($this->where == ""){
                        $this->where .= " (leads.ho_name = '{$user->id}' AND leads.service = '1')";
                    }
                    else {
                        $this->where .= " OR leads.ho_name = '{$user->id}' AND leads.service = '1'";
                    }
                }
                
            }
            $this->lv->searchColumns = $this->searchForm->searchColumns;
            $this->processSearchForm();
            
            if (!$this->headers) {
                return;
            }
            if (empty($_REQUEST['search_form_only']) || $_REQUEST['search_form_only'] == false) {
                $this->lv->ss->assign("SEARCH", true);
                $this->lv->ss->assign('savedSearchData', $this->searchForm->getSavedSearchData());
                $saved_search_id = $this->searchForm->getSavedSearchData()["selected"]; 
                $check_show_edit = "false";
                // Truyền biến id vào file tpl

                $query_saved_search = "SELECT * FROM saved_search WHERE id = '{$saved_search_id}' AND deleted = 0";
                $result_saved_search = $GLOBALS['db']->query($query_saved_search);
                while($rows = $GLOBALS['db']->fetchByAssoc($result_saved_search)){
                    if ($rows["assigned_user_id"] == $user->id ) {
                        
                        $check_show_edit = "true";
                        
                    }
                    else {
                        if ($user->id == '54e005cb-332b-9c26-c173-6406e116558f') {
                            if ($rows["assigned_user_id"] == "a5a5f967-0e9e-5d0c-6a51-63fdc413bf45" || $rows["assigned_user_id"] == "9232e852-23f5-3a3a-db34-63fdc497d906") {
                                $check_show_edit = "true";
                            }
                            else {
                                $check_show_edit = "false";
                            }
                        }
                    }                   
                }
                

                setcookie("check_edit", "", time() - 3600);
                setcookie("check_edit", $check_show_edit, time() + (86400 * 30), "/");
                
                $new_query = preg_replace_callback('/(\d{4}-\d{2}-\d{2}) (17:00:00|16:59:59)/', function ($matches) {
                    // Tạo đối tượng DateTime từ ngày tìm thấy và tăng ngày lên 1
                    $date = DateTime::createFromFormat('Y-m-d', $matches[1]);
                    $date->modify('+1 day');
                
                    // Đặt giờ phù hợp dựa trên giờ tìm thấy
                    if ($matches[2] == '17:00:00') {
                        $date->setTime(0, 0, 0);
                    } else { // $matches[2] == '16:59:59'
                        $date->setTime(23, 59, 59);
                    }
                
                    return $date->format('Y-m-d H:i:s');
                }, $this->where);
                
                $this->lv->setup($this->seed, 'include/ListView/ListViewGeneric.tpl', $new_query, $this->params);
                $GLOBALS['log']->fatal($new_query);
                $savedSearchName = empty($_REQUEST['saved_search_select_name']) ? '' : (' - ' . $_REQUEST['saved_search_select_name']);
                echo $this->lv->display();
            }
        }

        /**
         * @see ViewList::preDisplay()
         */
        public function preDisplay()
        {
            require_once('modules/AOS_PDF_Templates/formLetter.php');
            formLetter::LVPopupHtml('Leads');
            echo '<script type="text/javascript" src="custom/modules/Leads/handle_realtime.js"></script>';
            //$this->params['custom_select'] = " DISTINCT leads.fullname";
            parent::preDisplay();

            $this->lv = new LeadsListViewSmarty();
        }


    
    }
