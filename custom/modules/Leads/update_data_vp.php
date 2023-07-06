<?php
$filename = '/home/www/html/mkt.tranthu.vn/custom/modules/Leads/chia_data/6-21-2023/doi_tac_vp.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        
        $phone_number_primary = '0' . $data[1];
        $lst = array();
        $query1 = "SELECT * FROM leads WHERE data_sources = '19' AND phone_number_primary = '{$phone_number_primary}'";
        $result1 =  $GLOBALS['db']->query($query1);
        while ($row1s = $GLOBALS['db']->fetchByAssoc($result1)) {
            $lst[] = $row1s['id'];
        }
    
        if (count($lst) > 1) { 
            $idx = $lst[1];
            echo($idx);
            $query2 = "UPDATE leads SET deleted = 1 WHERE id = '{$idx}'";
            $GLOBALS['db']->query($query2);
        }
    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}

