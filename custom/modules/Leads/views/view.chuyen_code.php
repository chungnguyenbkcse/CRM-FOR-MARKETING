<?php
if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

require_once('include/MVC/View/SugarView.php');

class LeadsViewChuyen_code extends SugarView
{
    public function display()
    {

        $users = [];
        $dataSources = [];
        $campaigns = [];

        $query1 = "SELECT * FROM branch_ro";
        $result1 = $GLOBALS['db']->query($query1);
        while($rows = $GLOBALS['db']->fetchByAssoc($result1)){
            $users[$rows['user_id']] = $rows['user_name'];
        }


        $query2 = "SELECT * FROM data_sources";
        $result2 = $GLOBALS['db']->query($query2);
        while($rows1 = $GLOBALS['db']->fetchByAssoc($result2)){
            $dataSources[$rows1['id']] = $rows1['name'];
        }

        $query3 = "SELECT * FROM campaign";
        $result3 = $GLOBALS['db']->query($query3);
        while($rows3 = $GLOBALS['db']->fetchByAssoc($result3)){
            $campaigns[$rows3['id']] = $rows3['name'];
        }

        // Tạo options cho users
        $userOptions = '';
        foreach ($users as $userID => $userName) {
            $userOptions .= "<option value='{$userID}'>{$userName}</option>";
        }

        // Tạo options cho nguồn dữ liệu
        $dataSourceOptions = '';
        foreach ($dataSources as $dataSourceID => $dataSourceName) {
            $dataSourceOptions .= "<option value='{$dataSourceID}'>{$dataSourceName}</option>";
        }

        // Tạo options cho nguồn dữ liệu
        $campaignOptions = '';
        foreach ($campaigns as $campaignID => $campaignName) {
            $campaignOptions .= "<option value='{$campaignID}'>{$campaignName}</option>";
        }

        // Nhúng các options vào giao diện
        $html = <<<HTML
        <script>
$(document).ready(function(){
    $('form').on('submit', function(event) {
        event.preventDefault();

        var formData = new FormData(this);

        $.ajax({
            url: 'index.php?module=Leads&entryPoint=import_data',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(data) {
                alert("Dữ liệu đã được gửi thành công!");
            },
            error: function(xhr, status, error) {
                alert("Có lỗi xảy ra: " + error);
            }
        });
    });
});
</script>
    <h1>Chuyển code dữ liệu</h1>
    <h4>File phải gồm 4 trường theo thứ tự: họ tên => số điện thoại => địa chỉ => ngày phát hành thẻ</h4>
    <form action="index.php?module=Leads&entryPoint=import_data" method="post" enctype="multipart/form-data">
        <div class="row">
            <div class="col-md-4">
                <input type="file" name="importFile">
            </div>
        </div>
        <div class="row" style="margin-top: 100px">
            <div class="col-md-4">
                <label>Chọn người dùng:</label>
                <select name="users[]" multiple size="5">
                    {$userOptions}
                </select>
            </div>
            <div class="col-md-4">
                <label>Chọn nguồn dữ liệu:</label>
                <select name="dataSource">
                    {$dataSourceOptions}
                </select>
            </div>
            <div class="col-md-4">
                <label>Chiến dịch:</label>
                <select name="campaign">
                    {$campaignOptions}
                </select>
            </div>
        </div>
        <div class="row">
            <input type="submit" value="Chuyển code">
        </div>
    </form>
HTML;

        echo $html;
    }
}
