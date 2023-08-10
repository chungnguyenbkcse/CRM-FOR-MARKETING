<?php
// Thư mục lưu file CSV
$targetDir = "/path/to/your/directory/";

if (isset($_FILES["importFile"]) && $_FILES["importFile"]["error"] == 0) {
    $filename = $targetDir . basename($_FILES["importFile"]["name"]);
    
    // Di chuyển file đã upload vào thư mục đích
    if (move_uploaded_file($_FILES["importFile"]["tmp_name"], $filename)) {
        
        // Gọi hàm import dữ liệu từ file CSV
        $this->importFromCSV($filename);
        
    } else {
        echo "Lỗi khi lưu file!";
    }
} else {
    echo "Lỗi file upload!";
}


