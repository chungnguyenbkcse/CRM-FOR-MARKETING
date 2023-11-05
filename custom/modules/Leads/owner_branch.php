<?php

$html = "";
$lst = array('', '__Select Branch');
$query = "SELECT id, name FROM owned_branch";
$result = $GLOBALS['db']->query($query);
while ($rows = $GLOBALS['db']->fetchByAssoc($result)) {
    $lst[$rows['id']] = $rows['name'];
}

$html = "";
if (isset($_GET['id'])) {
    foreach($lst as $k => $v) {
        if ($_GET['id'] == $k){
            $html .= sprintf("<option value='%s' selected>%s</option>", $k, $v);
        }
        else {
            $html .= sprintf("<option value='%s'>%s</option>", $k, $v);
        }
    }
    echo $html;
} else {
    foreach($lst as $k => $v) {
        $html .= sprintf("<option value='%s'>%s</option>", $k, $v);
    }
    echo $html;
}

    
