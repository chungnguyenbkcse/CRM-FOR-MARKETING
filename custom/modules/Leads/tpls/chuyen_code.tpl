{literal}
    <style>
        #thead-report-campaign {
            background-color: rgb(64, 51, 189);
            color: #ffffff;
        }

        #toolbar {
            margin: 0;
        }

        .loading-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.8);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            opacity: 0;
            visibility: hidden;
            transition: opacity 0.3s ease, visibility 0.3s ease;
        }

        .loading-spinner {
            border: 4px solid rgba(255, 255, 255, 0.3);
            border-top: 4px solid #007bff;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }

        .loading-overlay.loading {
            opacity: 1;
            visibility: visible;
        }
    </style>
{/literal}
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/css/select2.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.js"></script>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">

<script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>

<script src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/jquery.table2excel.min.js"></script>

<!-- Đặt mã này trước bảng dữ liệu DataTables -->
<div class="loading-overlay" id="loadingOverlay">
    <div class="loading-spinner"></div>
</div>


<h2>Chuyển code</h2>
<p><span style='color: red'>Lưu ý:</span> Ở đây tôi chỉ lấy 10 data tượng trưng, nên bạn hoàn toàn yên tâm về data nhé!
<p>

<h3>Điều kiện</h3>
<div class="row">
    <div class="col-lg-3 col-xs-3">
        <label>Chi nhánh</label>
        <select id='select2ByBranch1' style='width: 200px;'>
        </select>
    </div>

    <div class="col-lg-3 col-xs-3">
        <!-- Dropdown -->
        <label>Nhân viên</label>
        <select id='select2ByUser1' style='width: 200px;'>
        </select>
    </div>

    <div class="col-lg-3 col-xs-3">
        <label>Nguồn data</label>
        <select id='select2ByDataSource1' style='width: 200px;'>
        </select>
    </div>

    <div class="col-lg-3 col-xs-3">
        <label>Chiến dịch</label>
        <select id='select2ByCampain1' style='width: 200px;'>
        </select>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <input type='button' value='Lọc' id='filter'>
    </div>
</div>

<h3>Mục tiêu</h3>
<div class="row">
    <div class="col-lg-3 col-xs-3">
        <label>Chi nhánh</label>
        <select id='select2ByBranch2' style='width: 200px;'>
        </select>
    </div>

    <div class="col-lg-3 col-xs-3">
        <!-- Dropdown -->
        <label>Nhân viên</label>
        <select id='select2ByUser2' style='width: 200px;'>
        </select>
    </div>

    <div class="col-lg-3 col-xs-3">
        <label>Nguồn data</label>
        <select id='select2ByDataSource2' style='width: 200px;'>
        </select>
    </div>

    <div class="col-lg-3 col-xs-3">
        <label>Chiến dịch</label>
        <select id='select2ByCampain2' style='width: 200px;'>
        </select>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <input type='button' value='Chuyển code' id='chuyenCode'>
    </div>
</div>


<div class="row">
    <table>
        <thead id="thead-report-campaign">
            <tr>
                <th scope="col">Stt</th>
                <th scope="col">Tên khách hàng</th>
                <th scope="col">Số điện thoại</th>
                <th scope="col">Cccd</th>
                <th scope="col">Nguồn datath>
                <th scope="col">Chi nhánh</th>
                <th scope="col">Ro name</th>
                <th scope="col">Chiến dịch</th>
                <th scope="col">Sale stage</th>
                <th scope="col">Lead status</th>

            </tr>
        </thead>
        <tbody id="data">
        </tbody>
    </table>
</div>

{* <br />
<input type="hidden" value={$ACCESS_OVERRIDE} name="access_override" id="access_override">
<input type="hidden" value={$SECURITYGROUP_ID} name="security_group_id" id="security_group_id">
<input type="hidden" value={$EMPLOYEE_ID} name="employee_id" id="employee_id"> *}

{literal}
    <script type="text/javascript">
        $(document).ready(function() {

            $('#loadingOverlay').addClass('loading');


            $.ajax({
                url: "index.php?module=Leads&entryPoint=get-search-leads",
                data: {},
                success: function(data) {
                    // Ẩn overlay khi trang đã tải
                    $('#loadingOverlay').removeClass('loading');
                    $('#data').html(data);
                    $('table').DataTable({
                        "searching": false
                    });
                },
            });
            $.ajax({
                url: "index.php?module=Leads&entryPoint=get_campain",
                data: {},
                success: function(data) {
                    $('#select2ByCampain1').html(data)
                    $('#select2ByCampain2').html(data)
                },
            });

            $.ajax({
                url: "index.php?module=Leads&entryPoint=owner_branch",
                data: {},
                success: function(data) {
                    $('#select2ByBranch1').html(data)
                    $('#select2ByBranch2').html(data)
                },
            });

            $.ajax({
                url: "index.php?module=Leads&entryPoint=get-data-source",
                data: {},
                success: function(data) {
                    $('#select2ByDataSource1').html(data)
                    $('#select2ByDataSource2').html(data)
                },
            });

            $('#select2ByBranch1').click(function() {
                let branch1 = $('#select2ByBranch1').val();
                $.ajax({
                    url: "index.php?module=Leads&entryPoint=ro_name",
                    data: {owned_branch: branch1},
                    success: function(data) {
                        $('#select2ByUser1').html(data)
                    },
                });
            })

            $('#select2ByBranch2').click(function() {
                let branch2 = $('#select2ByBranch1').val();
                $.ajax({
                    url: "index.php?module=Leads&entryPoint=ro_name",
                    data: {owned_branch: branch2},
                    success: function(data) {
                        $('#select2ByUser2').html(data)
                    },
                });
            })

            // // Initialize select2
            // $("#select2ByCampain1").select2();
            // $("#select2ByCampain2").select2();
            // $("#select2ByBranch1").select2();
            // $("#select2ByBranch2").select2();
            // Read selected option
            $('#filter').click(function() {


                var data_source = $('#select2ByDataSource1').val();
                var user = $('#select2ByUser1').val();
                var branch = $('#select2ByBranch1').val();
                var campain = $('#select2ByCampain1').val();
                if (
                    (data_source === '' || data_source === null || data_source === '0' || data_source ===
                        'null') &&
                    (user === '' || user === null || user === '0' || user === 'null') &&
                    (branch === '' || branch === null || branch === '0' || branch === 'null') &&
                    (campain === '' || campain === null || campain === '0' || campain === 'null')
                ) {
                    alert('Vui lòng chọn ít nhất một đk lọc');
                    return;
                } else {
                    
                    $('#loadingOverlay').addClass('loading');
                    $.ajax({
                        url: "index.php?module=Leads&entryPoint=get-search-leads",
                        data: {
                            data_source: data_source,
                            user: user,
                            branch: branch,
                            campain: campain
                        },
                        success: function(data) {
                            $('#loadingOverlay').removeClass('loading');
                            $('#data').html(data);
                            $('table').DataTable();
                        },
                    });
                }


            });

            $('#chuyenCode').click(function() {
                // $('table').DataTable().destroy();
                // $('table tbody').empty();
                // $.fn.dataTable.ext.errMode = 'none';


                var data_source = $('#select2ByDataSource2').val();
                var user = $('#select2ByUser2').val();
                var branch = $('#select2ByBranch2').val();
                var campain = $('#select2ByCampain2').val();
                var data_source_dk = $('#select2ByDataSource1').val();
                var user_dk = $('#select2ByUser1').val();
                var branch_dk = $('#select2ByBranch1').val();
                var campain_dk = $('#select2ByCampain1').val();

                if (
                    (data_source_dk === '' || data_source_dk === null || data_source_dk === '0' ||
                        data_source_dk === 'null') &&
                    (user_dk === '' || user_dk === null || user_dk === '0' || user_dk === 'null') &&
                    (branch_dk === '' || branch_dk === null || branch_dk === '0' || branch_dk === 'null') &&
                    (campain_dk === '' || campain_dk === null || campain_dk === '0' || campain_dk ===
                        'null')
                ) {
                    alert('Vui lòng chọn ít nhất một điều kiện lọc!');
                    return;
                } else if (
                    (data_source === '' || data_source === null || data_source === '0' || data_source ===
                        'null') &&
                    (user === '' || user === null || user === '0' || user === 'null') &&
                    (branch === '' || branch === null || branch === '0' || branch === 'null') &&
                    (campain === '' || campain === null || campain === '0' || campain === 'null')
                ) {
                    alert('Vui lòng chọn ít nhất một mục tiêu!');
                    return;
                } else {
                    var body = {};

                    if (data_source_dk !== '' && data_source_dk !== null && data_source_dk !== '0' &&
                        data_source_dk !== 'null') {
                        Object.assign(body, { data_source_dk });
                    }

                    if (user_dk !== '' && user_dk !== null && user_dk !== '0' && user_dk !== 'null') {
                        Object.assign(body, { user_dk });
                    }

                    if (branch_dk !== '' && branch_dk !== null && branch_dk !== '0' && branch_dk !==
                        'null') {
                        Object.assign(body, { branch_dk });
                    }

                    if (campain_dk !== '' && campain_dk !== null && campain_dk !== '0' && campain_dk !==
                        'null') {
                        Object.assign(body, { campain_dk });
                    }

                    if (data_source !== '' && data_source !== null && data_source !== '0' && data_source !==
                        'null') {
                        Object.assign(body, { data_source });
                    }

                    if (user !== '' && user !== null && user !== '0' && user !== 'null') {
                        Object.assign(body, { user });
                    }

                    if (branch !== '' && branch !== null && branch !== '0' && branch !== 'null') {
                        Object.assign(body, { branch });
                    }

                    if (campain !== '' && campain !== null && campain !== '0' && campain !== 'null') {
                        Object.assign(body, { campain });
                    }

                    console.log(body)

                    // body chứa các trường thỏa điều kiện


                    // body chứa các trường thỏa điều kiện


                    $('#loadingOverlay').addClass('loading');

                    $.ajax({
                        url: "index.php?module=Leads&entryPoint=update-chuyen-code",
                        data: {
                            data_source: data_source,
                            user: user,
                            branch: branch,
                            campain: campain,
                            data_source_dk: data_source_dk,
                            user_dk: user_dk,
                            branch_dk: branch_dk,
                            campain_dk: campain_dk
                        },
                        success: function(data) {
                            alert('Chuyển code thành công! Vui lòng load lại!');
                            $('#loadingOverlay').removeClass('loading');
                        },
                    });
                }
            });
        });
    </script>
{/literal}