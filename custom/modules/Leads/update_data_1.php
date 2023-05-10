<?php
$filename = '/home/www/html/mkt.tranthu.vn/DATA_IMPORT_DOI_TAC.csv';

// Mở tệp CSV để đọc
$file = fopen($filename, 'r');

// Kiểm tra xem tệp có tồn tại không
if ($file) {
    // Đọc dữ liệu từ tệp theo từng dòng
    $i = 0;
    while (($data = fgetcsv($file)) !== false) {
        // Lấy giá trị của cột đầu tiên
        $contact_date = $data[0];
        $data_sources = $data[1];

        $phone_number_primary = $data[2];
        $service = $data[3];
        $bank = $data[4];
        $payment_day = $data[5];
        $transaction_amount = $data[6];
        $fee = (int)$data[7] * 100;
        $sale_stage = $data[8];
        $lead_status = $data[9];
        $owned_branch = $data[10];
        $ro_name = $data[11];
        $fullname = $data[12];

        $query_1 = "SELECT COUNT(*) AS total  FROM leads WHERE phone_number_primary = '{$phone_number_primary}' AND bank = '{$bank}' AND ro_name = '{$ro_name}' ";
        $result_1 = $GLOBALS['db']->query($query_1);
        $row_1 = $GLOBALS['db']->fetchByAssoc($result_1);
        $total_1 = $row_1['total'];

        if ($total_1 == 0) {
            echo 'hello';
            // Xử lý giá trị của cột đầu tiên
            // Ví dụ: In ra giá trị của cột đầu tiên
            $key = 'partner-' . $i;
            $query = "INSERT INTO leads 
            (id, contact_date, data_sources, phone_number_primary, service, bank, payment_day, transaction_amount, fee, sale_stage, lead_status, owned_branch, ro_name, fullname) 
            VALUES (
                '{$key}',
                '{$contact_date}',
                '{$data_sources}',
                '{$phone_number_primary}',
                '{$service}',
                '{$bank}',
                '{$payment_day}',
                '{$transaction_amount}',
                '{$fee}',
                '{$sale_stage}',
                '{$lead_status}',
                '{$owned_branch}',
                '{$ro_name}',
                '{$fullname}'
            );";
            $GLOBALS['db']->query($query);
        }
        
        $i = $i + 1;
    }
    // Đóng tệp CSV sau khi đọc xong
    fclose($file);
} else {
    echo "Không thể mở tệp CSV!";
}