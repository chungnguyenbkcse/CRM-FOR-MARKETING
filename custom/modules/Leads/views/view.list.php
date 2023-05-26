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
                        $this->where .= " (leads.created_by = '{$user->id}' OR leads.modified_user_id = '{$user->id}') AND leads.data_sources != '9' AND leads.data_sources != '10'";
                    }
                    else {
                        $this->where .= " OR (leads.created_by = '{$user->id}' OR leads.modified_user_id = '{$user->id}') AND leads.data_sources != '9' AND leads.data_sources != '10'";
                    }
                }

                if ($role == "RO"){
                    if ($user->id == '54e005cb-332b-9c26-c173-6406e116558f') {
                        $this->where .= "    (ro_name  = '349fe455-c77c-8f0b-b391-6440b692e560' AND data_sources = '9') OR (ro_name  = '9232e852-23f5-3a3a-db34-63fdc497d906' AND data_sources = '9') OR (ro_name  = '349fe455-c77c-8f0b-b391-6440b692e560' AND data_sources = '10')     OR (ro_name  = '9232e852-23f5-3a3a-db34-63fdc497d906' AND data_sources = '10')     OR (ro_name  = 'a5a5f967-0e9e-5d0c-6a51-63fdc413bf45' AND data_sources = '10')     OR (ro_name  = 'a5a5f967-0e9e-5d0c-6a51-63fdc413bf45' AND data_sources = '9')     OR (leads.created_by = '1' AND leads.ro_name = 'a5a5f967-0e9e-5d0c-6a51-63fdc413bf45') OR (leads.created_by = '1' AND leads.ro_name = '349fe455-c77c-8f0b-b391-6440b692e560')     OR (leads.created_by = '1' AND leads.ro_name = '9232e852-23f5-3a3a-db34-63fdc497d906')     OR (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '349fe455-c77c-8f0b-b391-6440b692e560')     OR (leads.created_by = '9232e852-23f5-3a3a-db34-63fdc497d906')     OR (leads.created_by = 'a5a5f967-0e9e-5d0c-6a51-63fdc413bf45')     OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '349fe455-c77c-8f0b-b391-6440b692e560' AND leads.ro_modified_sale_stage = true)      OR (leads.ro_name = '9232e852-23f5-3a3a-db34-63fdc497d906' AND leads.ro_modified_sale_stage = true)      OR (leads.ro_name = 'a5a5f967-0e9e-5d0c-6a51-63fdc413bf45' AND leads.ro_modified_sale_stage = true)     OR (leads.ro_name = '{$user->id}')      OR (leads.ro_name = '9232e852-23f5-3a3a-db34-63fdc497d906' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != '')     OR (leads.ro_name = 'a5a5f967-0e9e-5d0c-6a51-63fdc413bf45' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != '') OR (leads.ro_name = '349fe455-c77c-8f0b-b391-6440b692e560' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != '')    OR (leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != '')";
                       
                    }
                    else if ($user->id == 'a5a5f967-0e9e-5d0c-6a51-63fdc413bf45') {
                        $this->where .= " (ro_name  = 'a5a5f967-0e9e-5d0c-6a51-63fdc413bf45' AND data_sources = '10') OR (ro_name  = 'a5a5f967-0e9e-5d0c-6a51-63fdc413bf45' AND data_sources = '9') OR (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true)  OR (leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != '')";
                    }
                    else if ($user->id == '9232e852-23f5-3a3a-db34-63fdc497d906') {
                        $this->where .= " (ro_name  = '9232e852-23f5-3a3a-db34-63fdc497d906' AND data_sources = '9') OR (ro_name  = '9232e852-23f5-3a3a-db34-63fdc497d906' AND data_sources = '10') OR (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true)  OR (leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != '')";
                    }
                    else if ($user->id == '497f0e21-37eb-a875-75b2-63fdb2c03264') {
                        $this->where .= "((leads.data_sources = '9' OR leads.data_sources = '10') AND leads.lead_status = '17') OR (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true)  OR (leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != '')";
                    }
                    else if ($this->where == ""){
                        $this->where .= " (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true)  OR (leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != '')";
                    }
                    else {
                        $this->where .= " OR (leads.created_by = '1' AND leads.ro_name = '{$user->id}') OR (leads.created_by = '{$user->id}') OR (leads.ro_name = '{$user->id}' AND leads.ro_modified_sale_stage = true) OR leads.ro_name = '{$user->id}' AND leads.sale_stage = '10' AND leads.sale_stage IS NOT NULL AND leads.sale_stage != '0' AND leads.sale_stage != ''";
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
                
                
                $this->lv->setup($this->seed, 'include/ListView/ListViewGeneric.tpl', $this->where, $this->params);
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
