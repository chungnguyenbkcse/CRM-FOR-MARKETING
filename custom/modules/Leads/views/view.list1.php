<?php
    require_once('include/MVC/View/views/view.list.php');
    require_once('modules/Leads/LeadsListViewSmarty.php');

    class CustomLeadsViewList1 extends ViewList
    {
        public function listViewProcess()
        {
            global $current_user;
            $user = BeanFactory::getBean('Users', $current_user->id);

            $GLOBALS['log']->fatal("WHERE: "); 
            $GLOBALS['log']->fatal($this->where);

            $this->processSearchForm();

            if ($this->where == ""){
                $this->where .= " leads.sale_stage = '11' AND leads.lead_status = '23' ";
            }
            else {
                $this->where .= " OR leads.owned_branch = '11' AND leads.sale_stage = '23' ";
            }

            $this->lv->searchColumns = $this->searchForm->searchColumns;
            
            if (!$this->headers) {
                return;
            }
            if (empty($_REQUEST['search_form_only']) || $_REQUEST['search_form_only'] == false) {
                $this->lv->ss->assign("SEARCH", true);
                $this->lv->ss->assign('savedSearchData', $this->searchForm->getSavedSearchData());
                $GLOBALS['log']->fatal("WHERE1: "); 
                $GLOBALS['log']->fatal($this->where);
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
            parent::preDisplay();

            $this->lv = new LeadsListViewSmarty();
        }
    }
