<?php
function getDataSource($campaign)
{
    $data_source_new_dom = array(
        '' => 'Choose',
        '1' => 'FACEBOOK ADS',
        '2' => 'GOOGLE ADS',
        '3' => 'Facebook group',
        '4' => 'Zalo group',
        '5' => 'MGM',
        '6' => 'Facebook Fanpage',
        '7' => 'Data Center',
        '8' => 'Facebook UID',
        '9' => 'inactive',
        '10' => 'old MKT source',
        '11' => 'Partner',
        '12' => 'TELE',
        '13' => 'old MKT ĐN',
        '14' => 'inactive ĐN ',
        '15' => 'LD',
        '16' => 'ĐỐI TÁC T',
        '17' => 'ĐỐI TÁC K',
        '18' => 'ĐỐI TÁC D', 
        '19' => 'ĐỐI TÁC VP',
        '20' => 'VP ĐỒNG NAI',
        '21' => 'VP KHÁNH HÒA',
        '22' => 'ĐỐI TÁC TCB',
        '23' => 'VP 0108'
    );

    
    if ($campaign == "5") {

        $data_source_new_dom = array(
            '' => 'Choose',
            '24' => 'MKT',
            '25' => 'MGM MKT N',
            '26' => 'MGM MKT N-1',
            '27' => 'IA',
            '28' => 'MGM IA',
            '29' => 'MGM FC',
            '30' => 'CTV',
            '31' => 'FC N',
            '32' => 'ĐỐI TÁC',
            '33' => 'MGM ĐỐI TÁC',
            '34' => 'MKT N-1'
        );

    }
    
    return $data_source_new_dom;
}



$html = "";
$states = getDataSource($_GET['campaign']);
foreach ($states as $k => $v) {
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
    