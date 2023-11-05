<?php
$html = "";
$lst = array('', '__Select Data Source');
$query = "SELECT id, name FROM data_sources";
$result = $GLOBALS['db']->query($query);
while ($rows = $GLOBALS['db']->fetchByAssoc($result)) {
    $lst[$rows['id']] = $rows['name'];
}



$html = "";
foreach ($lst as $k => $v) {
    if (isset($_GET['data_source_selected'])) {
        if ($_GET['data_source_selected'] == $k) {
            $html .= sprintf("<option value='%s' selected>%s</option>", $k, $v);
        }else {
            $html .= sprintf("<option value='%s' >%s</option>", $k, $v);
        }
    }else {
        $html .= sprintf("<option value='%s' >%s</option>", $k, $v);
    }
}
echo $html;        
    