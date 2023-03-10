$(document).ready(function () {

    var lead_id = $("#lead_id").val();

    
    $.ajax({
        url: "index.php?module=Leads&entryPoint=get_card_number_lead",
        data: {lead_id: lead_id},
        success: function (data) {
            let x = JSON.parse(data)
            console.log(x);
            x.map((ele, idx) => {
                $(`
                <div class="col-xs-12 mr-4 card-number-lines-container">
                    <div class="col-xs-12 template card-number-line-container">
                      <div class="col-xs-12 col-sm-12  card-number-input-container {if $module == "Leads"} card-number-users-profile{/if}">
                        <div class="input-group card-number-input-group">
                          <input type="text" value=${ele} class="form-control card-number-input" placeholder="" title="">
                          <span class="input-group-btn">
                          <button type="button" class="btn btn-danger card-number-remove-button" onclick="this.parentNode.parentNode.remove()" name="" title="{$app_strings.LBL_ID_FF_REMOVE_EMAIL}">
                            <span class="suitepicon suitepicon-action-minus"></span>
                          </button>
                        </span>
                        </div>
                      </div>
                    </div>          
                </div>
                `
                ).insertAfter('.card-number-list');

                $(".card-number-add-line-container").css(
                    'margin-left', "-8px"
                )

                $(".card-number-lines-container").css(
                    'margin-left', "-8px"
                )

                $("#card-number-remove-button").css(
                    'margin-right', "20px",
                )
            })
        }
    });
    
    $("[alt='zalo']").click(function(){
        var phone = $("#phone_number_primary").val().replace(/ /g,'');
        window.open(`zalo://conversation?phone=${phone}`);
    })

    $("[alt='zalo_extra']").click(function(){
        var phone = $("#phone_number_extra").val().replace(/ /g,'');
        window.open(`zalo://conversation?phone=${phone}`);
    })

    $(".card-number-add-button").click(function() {
        $(`
            <div class="col-xs-12 mr-4 card-number-lines-container">
                <div class="col-xs-12 template card-number-line-container">
                  <div class="col-xs-12 col-sm-12  card-number-input-container {if $module == "Leads"} card-number-users-profile{/if}">
                    <div class="input-group card-number-input-group">
                      <input type="text" class="form-control card-number-input" placeholder="" title="">
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-danger card-number-remove-button" onclick="this.parentNode.parentNode.remove()" name="" title="{$app_strings.LBL_ID_FF_REMOVE_EMAIL}">
                        <span class="suitepicon suitepicon-action-minus"></span>
                      </button>
                    </span>
                    </div>
                  </div>
                </div>          
            </div>
            `
        ).insertAfter('.card-number-list');

        $(".card-number-add-line-container").css(
            'margin-left',"-8px"
        )
    
        $(".card-number-lines-container").css(
            'margin-left',"-8px"
        )
    
        $("#card-number-remove-button").css(
            'margin-right',"20px",
        )
    })



    $(".card-number-add-line-container").css(
        'margin-left',"-8px"
    )

    $(".card-number-lines-container").css(
        'margin-left',"-8px"
    )

    $("#card-number-remove-button").css(
        'margin-right',"20px",
    )



    function getCookie(name) {
        const value = `; ${document.cookie}`;
        const parts = value.split(`; ${name}=`);
        if (parts.length === 2) return parts.pop().split(';').shift();
    }

    var role = getCookie("role");
    var lead_id = $("#lead_id").val();

    if (lead_id.length == 0) {
        $(".btn-record").remove()
        $("[data-label='LBL_IS_RECORD']").remove()
    }

    else {

        $("[data-label='LBL_IS_RECORD']").html("")
        if (role == "RO") {
            var sip = getCookie("sip");
            var date = new Date();
            // Get year, month, and day part from the date
            var year = date.toLocaleString("default", { year: "numeric" });
            var month = date.toLocaleString("default", { month: "2-digit" });
            var day = date.toLocaleString("default", { day: "2-digit" });
            // Generate yyyy-mm-dd date string
            var start_date = year + "-" + month + "-" + day + " 00:00:00";
            var end_date = year + "-" + month + "-" + day + " 23:59:59";

            var phone = $('#phone_number_primary').val();

            var formData = {
                sip: parseInt(sip),
                field_name: "dst",
                field_pattern: parseInt(phone),
                status: "ANSWERED",
                limit: 1,
                offset: 0,
            }; //Array 

            console.log(formData)


            $.ajax({
                url: "index.php?module=Leads&entryPoint=CdrReport",
                type: "GET",
                data: {
                    sip: parseInt(sip),
                    field_name: "dst",
                    field_pattern: parseInt(phone),
                    status: "ANSWERED",
                    limit: 1,
                    offset: 0
                },
                success: function (data, textStatus, jqXHR) {
                    console.log('Susscess')
                    console.log(data)

                    var res = jQuery.parseJSON(data)[0];
                    console.log(res)
                    "/" + (res.calldate.substring(0,4)) + "/" + (res.calldate.substring(5,7)) + "/" + (res.calldate.substring(8,10)) +  "/" + (res.recordingfile);
                    fetch(`index.php?module=Leads&entryPoint=GetWarfile&data=${recording_file}`)
                        .then(response => response.blob())
                        .then(blob => {
                            //$("#source").attr('src', URL.createObjectURL(blob));
                            let name_file = new Date().getTime();
                            console.log(name_file)
                            let file = new File([blob], `${name_file}.wav`, {
                                type: "audio/x-wav", lastModified: new Date().getTime()
                            });

                            var form_data = new FormData();
                            form_data.append("files[]", file);
                            form_data.append('lead_id', lead_id);
                            $.ajax({
                                url: "index.php?module=Leads&entryPoint=handle_upload_file",
                                contentType: false,
                                processData: false,
                                data: form_data,
                                type: 'post',
                                success: function (data) {
                                    //alert(data);
                                    var url = "https://mkt.tranthu.vn/upload1/" + `${name_file}.wav`;
                                    //$("#source").attr('src', url);
                                
                                    $(".btn-record").html(
                                        `<audio id="audio" controls autoplay muted><source id="source" src="${url}" type="audio/wav" /></audio>`
                                    )
                                },

                            });
                            // do stuff with `file`
                        })

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log('Error')
                }
            });
        }
        else if (role == "MKT") {
            var ro_name_val = $("#ro_name_val").val();
            var sip = getCookie("sip");

            $.ajax({
                url: "index.php?module=Leads&entryPoint=get_sip",
                data: { ro_id: ro_name_val },
                success: function (data) {
                    console.log(data);
                    sip = data;
                },
                async: false
            });

            console.log(sip);

            var date = new Date();
            // Get year, month, and day part from the date
            var year = date.toLocaleString("default", { year: "numeric" });
            var month = date.toLocaleString("default", { month: "2-digit" });
            var day = date.toLocaleString("default", { day: "2-digit" });
            // Generate yyyy-mm-dd date string
            var start_date = year + "-" + month + "-" + day + " 00:00:00";
            var end_date = year + "-" + month + "-" + day + " 23:59:59";
            
            var phone = $('#phone_number_primary').val();
            
            var formData = {
                sip: parseInt(sip),
                field_name: "dst",
                field_pattern: parseInt(phone),
                status: "ANSWERED",
                limit: 1,
                offset: 0,
            }; //Array 
        
            console.log(formData)
        
        
            $.ajax({
                url: "index.php?module=Leads&entryPoint=CdrReport",
                type: "GET",
                data: {
                    sip: parseInt(sip),
                    start_date: start_date,
                    end_date: end_date,
                    field_name: "dst",
                    field_pattern: parseInt(phone),
                    status: "ANSWERED",
                    limit: 1,
                    offset: 0
                },
                success: function (data, textStatus, jqXHR) {
                    console.log('Susscess')
                    console.log(data)
                    
                    var res = jQuery.parseJSON(data)[0];
                    console.log(res.calldate.substring(0,4))
                    console.log(res.calldate.substring(5,7))
                    console.log(res.calldate.substring(8,10))
                    const recording_file = "/" + (res.calldate.substring(0,4)) + "/" + (res.calldate.substring(5,7)) + "/" + (res.calldate.substring(8,10)) +  "/" + (res.recordingfile);
                    fetch(`index.php?module=Leads&entryPoint=GetWarfile&data=${recording_file}`)
                        .then(response => response.blob())
                        .then(blob => {
                            //$("#source").attr('src', URL.createObjectURL(blob));
                            let name_file = new Date().getTime();
                            console.log(name_file)
                            let file = new File([blob], `${name_file}.wav`, {
                                type: "audio/x-wav", lastModified: new Date().getTime()
                            });
                        
                            var form_data = new FormData();
                            form_data.append("files[]", file);
                            form_data.append('lead_id', lead_id);
                            $.ajax({
                                url: "index.php?module=Leads&entryPoint=handle_upload_file",
                                contentType: false,
                                processData: false,
                                data: form_data,
                                type: 'post',
                                success: function (data) {
                                    //alert(data);
                                    var url = "https://mkt.tranthu.vn/upload1/" + `${name_file}.wav`;
                                    //$("#source").attr('src', url);
                                
                                    $(".btn-record").html(
                                        `<audio id="audio" controls autoplay muted><source id="source" src="${url}" type="audio/wav" /></audio>`
                                    )
                                },
                            
                            });
                            // do stuff with `file`
                        })
                    
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log('Error')
                }
            });
        }

    }

    $(".glyphicon-earphone").map(function(idx) {
        if (idx == 0) {
            $(this).click(function () {
                var phone = $("#phone_number_primary").val().replace(/ /g,'');
                var formData = { phone_number: phone }; //Array 
        
                $.ajax({
                    url: "index.php?module=Leads&entryPoint=Click2Call",
                    type: "POST",
                    data: formData,
                    success: function (data, textStatus, jqXHR) {
                        console.log('Susscess')
                        console.log(data)
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log('Error')
                    }
                });
            })
        }
        else {
            $(this).click(function () {
                var phone = $("#phone_number_extra").val().replace(/ /g,'');
                var formData = { phone_number: phone }; //Array 
                
                $.ajax({
                    url: "index.php?module=Leads&entryPoint=Click2Call",
                    type: "POST",
                    data: formData,
                    success: function (data, textStatus, jqXHR) {
                        console.log('Susscess')
                        console.log(data)
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log('Error')
                    }
                });
            })
        }
    })




    $("#MKT_day_shared_BU").attr("disabled", true);
    $("#MKT_day_shared_BU_trigger").attr("disabled", true);

    var owner_branch = $('#owner_branch_val').val();
    $.ajax({
        url: "index.php?module=Leads&entryPoint=owner_branch",
        data: { id: owner_branch },
        success: function (data) {
            console.log(data);
            $("#owner_branch").html(data);
        },
        dataType: 'html'
    });

    if (role == "RO") {
        var sale_stage_id = $('#sale_stages_val').val();
        var lead_status_id = $('#lead_status_id').val();
        var owner_branch = $('#owner_branch_val').val();

        $('select').css('width', "90%")
        var ro_name_val = $("#ro_name_val").val();

        

        $('[name="bank"]').map(function (idx) {
            $(this).change(function() {
                console.log('xxx')
                let re = $(this).val()
                $('[name="bank"]').map(function (idxx) {
                    $(this).val(re)
                })
            })
        });


        $('[name="card_bark_type"]').map(function (idx) {
            $(this).change(function() {
                console.log('xxx')
                let re = $(this).val()
                $('[name="card_bark_type"]').map(function (idxx) {     
                        $(this).val(re)
                })
            })
        });


        $('[name="service"]').map(function (idx) {
            $(this).change(function() {
                console.log('xxx')
                let re = $(this).val()
                $('[name="service"]').map(function (idxx) {
                    $(this).val(re)
                })
            })
        });



        $('[name="sale_stage"]').map(function (idx) {
            $(this).change(function() {
                var sale_stage_change_id = $(this).val();
                $('[name="sale_stage"]').map(function (idx) {
                    $(this).val(sale_stage_change_id)
                })
                console.log('xxx')
                let re = $(this).val()
                $('[name="sale_stage"]').map(function (idxx) {
                    $(this).val(re)
                })
            })
        });


        $('[name="lead_status"]').map(function (idx) {
            $(this).change(function() {
                console.log('xxx')
                let re = $(this).val()
                $('[name="lead_status"]').map(function (idxx) {
                    $(this).val(re)
                })
            })
        });

        $("#citizen_identification").blur(function () {
            check_cmdd()
        })

        var ho_name_val = $("#ho_name_val").val();
                $("#ho_name").attr("disabled", true);
                $.ajax({
                    url: "index.php?module=Leads&entryPoint=ho_name",
                    data: { ho_name: ho_name_val },
                    success: function (data) {
                        console.log(data);
                        $("#ho_name").html(data);
                        $("#ho_name").attr("disabled", false);
                    },
                    dataType: 'html'
                });

        if (lead_id.length > 0) {
            $(document).ready(function () {
                setInterval(function () {
                    $.ajax({
                        url: "index.php?module=Leads&entryPoint=handle_check_time",
                        data: { id: lead_id },
                        success: function (data) {
                            console.log(data)
                            if (data != "") {
                                alert(`B???n v?????t qu?? th???i gian t??c ?????ng ${data}`)
                                window.open("http://mkt.tranthu.vn/index.php?module=Leads&action=index&return_module=Leads&return_action=index");
                            }
                        }
                    });
                }, 1000);
            })
        }

        if ($('#lead_id').val().length === 0) {
            $(".btn-phone").remove();
            $(".fa-phone").remove();
            

            let context = $("#receiving_branch").html();
            $('[name="service"]').map(function (idx) {
                $(this).change(function() {
                    var service = $(this).val();
                    if (service == '5') {
                            $("#receiving_branch").html("<option value='4' selected>TELE</option><option value='5'>DL TB</option><option value='0'>Choose</option>");
                    }
                    else {
                        $("#receiving_branch").html(context)
                    }
                })
            })

            $("#phone_number_primary").blur(function () {
                check_phone_number()
            })
            $("[data-label='LBL_RO_NAME']").remove();
            $("#ro_name").remove();



            $(".input_phone_number_primary").removeClass("col-xs-6")
           $(".edit-view-row-item").map(function (idx) {
                if (idx == 18) {
                    return this.remove();
                }
                idx++;
            }).get();

             $(".panel-default").map(function (idx) {
                if (idx == 1) {
                    return this.remove();
                }
                idx++;
            }).get(); 
            $(".input_phone_number_primary").addClass("col-xl-12 col-xs-12 col-sm-8 edit-view-field")
            $('.input_phone_number_primary').css('width', "100%")
            $('#phone_number_primary').css('width', "90%")
        }

        $.ajax({
            url: "index.php?module=Leads&entryPoint=ro_name",
            data: { ro_name: ro_name_val },
            success: function (data) {
                console.log(data);
                $("#ro_name").html(data);
            },
            dataType: 'html'
        });

        $("#transaction_amount").change(function () {
            var transaction_amount = $(this).val();
            $(this).val(Number(transaction_amount).toLocaleString());
        })
        var real_transaction_amount = $("#real_transaction_amount").val();
        $("#real_transaction_amount").val(real_transaction_amount.split(".")[0]);

        $("#real_transaction_amount").change(function () {
            var transaction_amount = $(this).val();
            $(this).val(Number(transaction_amount).toLocaleString());
        })

        $("#phone_number_primary").attr('type', 'password');
        $(".glyphicon-earphone").css({
            'position': 'absolute',
            'color': '#00FF00',
            'font-size': '30px',
            'left': '10px'
        });

        $(".glyphicon-earphone-1").css({
            'position': 'absolute',
            'color': '#00FF00',
            'font-size': '30px',
            'left': '10px'
        });

        if ($('#lead_id').val().length > 0) {
            $("input").map(function (idx) {
                console.log(idx)
                if (idx <= 62 && idx >= 57) {
                    return $(this).attr("disabled", true);
                }
                return idx++;
            }).get();
    
            $("#contact_date_trigger").attr("disabled", true);
    
            $("select").map(function (idx) {
                console.log(idx)
                if (idx < 8) {
                    return $(this).attr("disabled", true);
                }
                return idx++;
            }).get();
    
            $(".label").map(function (idx) {
                console.log(idx)
                if (idx < 16) {
                    return $(this).removeClass('label');
                }
                return idx++;
            }).get();
    
            $('textarea').map(function (idx) {
                if (idx == 0) {
                    $(this).attr("disabled", true);
                    $(this).css("background-color", "#f8f8f8");
                }
            })
        }

        $('#lead_status').css('width', "90%")

        $("#fullname").keyup(function () {
            $(this).val($(this).val().toUpperCase());
        });

        $(".label").map(function (idx) {
            return $(this).css('color', "#696969")
        })

        $("#phone_number_extra").blur(function () {
            $(this).val($(this).val().replace(/ /g, "").replace(/^(\d{3})(\d{3})(\d{4})(\d*)$/, "$1 $2 $3 $4"))
        })
        $('select').css('width', "90%")

        $("[data-label='LBL_CITIZEN_IDENTIFICATION_ISSUANCE_DATE']").html("");
        $("[data-label='LBL_CITIZEN_IDENTIFICATION_ISSUANCE_PLACE']").html("");
        $("[data-label='LBL_ADDRESS_FOLLOW_CITIZEN_IDENTIFICATION']").html("");
        $("[data-label='LBL_BIRTHDAY']").html("");
        $("#citizen_identification_issuance_date").attr("placeholder", "Issuance date (dd/mm/yyyy)");
        $("#citizen_identification_issuance_place").attr("placeholder", "Issuance place");
        $("#address_follow_citizen_identification").attr("placeholder", "Address follow Citizen identity card");
        $("#birthday").attr("placeholder", "Birthday");

        $.ajax({
            url: "index.php?module=Leads&entryPoint=sale_stage",
            data: { id: sale_stage_id, lead_status_id: lead_status_id },
            success: function (data) {
                console.log(data);
                $("#sale_stage").html(data);

            },
            dataType: 'html'
        });

        $.ajax({
            url: "index.php?module=Leads&entryPoint=lead_status",
            data: { id: sale_stage_id, lead_status_id: lead_status_id },
            success: function (data) {
                console.log(data);
                $('[name = "lead_status"]').map(function (idx) {
                    return $(this).html(data);
                })
            },
            dataType: 'html'
        });

        $('[name="sale_stage"]').map(function (idx) {
            console.log(idx)
            if (idx > 0) {
                return $(this).change(function () {
                    var sale_stage_change_id = $(this).val();
                    $('[name="sale_stage"]').map(function (idx) {
                        $(this).val(sale_stage_change_id)
                    })
                    console.log(sale_stage_change_id)
                    $.ajax({
                        url: "index.php?module=Leads&entryPoint=lead_status",
                        data: { id: sale_stage_change_id, lead_status_id: lead_status_id },
                        success: function (data) {
                            console.log(data);
                            //$("#lead_status").html(data);
                            $('[name="lead_status"]').map(function (index) {
                                if (index > 0) {
                                    $(this).html(data);
                                }
                            });
                        },
                        dataType: 'html'
                    });
                });
            }
            return idx++;
        }).get();
    }

    else if (role == "MKT") {
        var sale_stage_id = $('#sale_stages_val').val();
        var lead_status_id = $('#lead_status_id').val();
        var ro_name = $('#ro_name_val').val();
        var ho_name = $('#ho_name_val').val();
        var owner_branch = $('#owner_branch_val').val();

        $("#transaction_amount").change(function () {
            var transaction_amount = $(this).val();
            $(this).val(Number(transaction_amount).toLocaleString());
        })
        var real_transaction_amount = $("#real_transaction_amount").val();
        $("#real_transaction_amount").val(real_transaction_amount.split(".")[0]);

        $("#real_transaction_amount").change(function () {
            var transaction_amount = $(this).val();
            $(this).val(Number(transaction_amount).toLocaleString());
        })

        $('[name="bank"]').map(function (idx) {
            $(this).change(function() {
                console.log('xxx')
                let re = $(this).val()
                $('[name="bank"]').map(function (idxx) {
                    $(this).val(re)
                })
            })
        });


        $('[name="card_bark_type"]').map(function (idx) {
            $(this).change(function() {
                console.log('xxx')
                let re = $(this).val()
                $('[name="card_bark_type"]').map(function (idxx) {     
                        $(this).val(re)
                })
            })
        });


        $('[name="service"]').map(function (idx) {
            $(this).change(function() {
                console.log('xxx')
                let re = $(this).val()
                $('[name="service"]').map(function (idxx) {
                    $(this).val(re)
                })
            })
        });



        $('[name="sale_stage"]').map(function (idx) {
            $(this).change(function() {
                var sale_stage_change_id = $(this).val();
                $('[name="sale_stage"]').map(function (idx) {
                    $(this).val(sale_stage_change_id)
                })
                console.log('xxx')
                let re = $(this).val()
                $('[name="sale_stage"]').map(function (idxx) {
                    $(this).val(re)
                })
            })
        });


        $('[name="lead_status"]').map(function (idx) {
            $(this).change(function() {
                console.log('xxx')
                let re = $(this).val()
                $('[name="lead_status"]').map(function (idxx) {
                    $(this).val(re)
                })
            })
        });

        if (lead_id.length > 0) {
            $(document).ready(function () {
                setInterval(function () {
                    $.ajax({
                        url: "index.php?module=Leads&entryPoint=handle_check_time",
                        data: { id: lead_id },
                        success: function (data) {
                            
                            console.log(data)
                            if (data != "") {
                                alert(`B???n v?????t qu?? th???i gian t??c ?????ng ${data}`)
                                window.open("http://mkt.tranthu.vn/index.php?module=Leads&action=index&return_module=Leads&return_action=index");
                            }
                        }
                    });
                }, 1000);
            })
        }

        if ($('#lead_id').val().length === 0) {
            $(".btn-phone").remove();
            $(".fa-phone").remove();

            $('[data-label="LBL_FACEBOOK_OR_ZALO_NAME"]').append("<span class='required'>*</span>")
            $('[data-label="LBL_DATA_SOURCES"]').append("<span class='required'>*</span>")
            //$('[data-label="LBL_RECEIVING_BRANCH"]').append("<span class='required'>*</span>")
            //$('[data-label="LBL_OWNED_BRANCH"]').append("<span class='required'>*</span>")
            $('[data-label="LBL_SALE_STAGE"]').append("<span class='required'>*</span>")
            $('[data-label="LBL_CONTACT_DATE"]').append("<span class='required'>*</span>")
            //$('[data-label="LBL_RO_NAME"]').append("<span class='required'>*</span>")

            $('[name="service"]').map(function (idx) {
                if (idx == 0) {
                    var service = $(this).val();
                    if (service == '5') {
                        console.log('hello')
                        $("#receiving_branch").html("<option value='4' selected>TELE</option><option value='5'>DL TB</option><option value='0'>Choose</option>");
                    }
                    else {
                        $("#receiving_branch").html("<option value='' selected>Choose</option><option value='1'>NTT</option><option value='2'>Q10</option><option value='3'>T??n B??nh</option><option value='4'>TELE</option><option value='5'>DL TB</option><option value='0'>Choose</option>");
                    }
                }
            })
            

            let context = $("#receiving_branch").html();
            $('[name="service"]').map(function (idx) {
                $(this).change(function() {
                    if (idx == 0) {
                        var service = $(this).val();
                        if (service == '5') {
                            console.log('hello')
                            $("#receiving_branch").html("<option value='4' selected>TELE</option><option value='5'>DL TB</option><option value='0'>Choose</option>");
                        }
                        else {
                            $("#receiving_branch").html("<option value='' selected>Choose</option><option value='1'>NTT</option><option value='2'>Q10</option><option value='3'>T??n B??nh</option><option value='4'>TELE</option><option value='5'>DL TB</option><option value='0'>Choose</option>");
                        }
                    }
                })
            })
            

            $("#phone_number_primary").blur(function () {
                check_phone_number()
            })

            $(".input_phone_number_primary").removeClass("col-xs-6")
            $(".edit-view-row-item").map(function (idx) {
                if (idx == 18) {
                    return this.remove();
                }
                idx++;
            }).get();

            $(".panel-default").map(function (idx) {
                if (idx == 1) {
                    return this.remove();
                }
                idx++;
            }).get(); 
            $(".input_phone_number_primary").addClass("col-xl-12 col-xs-12 col-sm-8 edit-view-field")
            $('.input_phone_number_primary').css('width', "100%")
            $('#phone_number_primary').css('width', "90%")

            $.ajax({
                url: "index.php?module=Leads&entryPoint=ro_name",
                data: { },
                success: function (data) {
                    console.log(data);
                    $("#ro_name").html(data);
                },
                dataType: 'html'
            });
        }
        else {
            $("#phone_number_primary").attr('type', 'password');

            $('[name="service"]').map(function (idx) {
                if (idx == 0) {
                    var service = $(this).val();
                    if (service == '5') {
                        console.log('hello')
                        $("#receiving_branch").html("<option value='4' selected>TELE</option><option value='5'>DL TB</option><option value='0'>Choose</option>");
                    }
                    else {
                        $("#receiving_branch").html("<option value='' selected>Choose</option><option value='1'>NTT</option><option value='2'>Q10</option><option value='3'>T??n B??nh</option><option value='4'>TELE</option><option value='5'>DL TB</option><option value='0'>Choose</option>");
                    }
                }
            })
            

            let context = $("#receiving_branch").html();
            $('[name="service"]').map(function (idx) {
                $(this).change(function() {
                    if (idx == 0) {
                        var service = $(this).val();
                        if (service == '5') {
                            console.log('hello')
                            $("#receiving_branch").html("<option value='4' selected>TELE</option><option value='5'>DL TB</option><option value='0'>Choose</option>");
                        }
                        else {
                            $("#receiving_branch").html("<option value='' selected>Choose</option><option value='1'>NTT</option><option value='2'>Q10</option><option value='3'>T??n B??nh</option><option value='4'>TELE</option><option value='5'>DL TB</option><option value='0'>Choose</option>");
                        }
                    }
                })
            })

            if (sale_stage_id == "0") {
                var ro_name_val = $("#ro_name_val").val();
                $("#ro_name").attr("disabled", true);
                console.log('x')
                $.ajax({
                    url: "index.php?module=Leads&entryPoint=ro_name",
                    data: { ro_name: ro_name_val },
                    success: function (data) {
                        console.log("ro");
                        $("#ro_name").html(data);
                        $("#ro_name").attr("disabled", false);
                    },
                    dataType: 'html'
                });

                var ho_name_val = $("#ho_name_val").val();
                $("#ho_name").attr("disabled", true);
                $.ajax({
                    url: "index.php?module=Leads&entryPoint=ho_name",
                    data: { ho_name: ho_name_val },
                    success: function (data) {
                        console.log(data);
                        $("#ho_name").html(data);
                        $("#ho_name").attr("disabled", false);
                    },
                    dataType: 'html'
                });


                $("#phone_number_primary").blur(function () {
                    check_phone_number()
                })


                $(".glyphicon-earphone").css({
                    'position': 'absolute',
                    'color': '#00FF00',
                    'font-size': '30px',
                    'left': '10px'
                });
                $(".glyphicon-earphone-1").css({
                    'position': 'absolute',
                    'color': '#00FF00',
                    'font-size': '30px',
                    'left': '10px'
                });
                /* $("input").map(function (idx) {
                    console.log(idx)
                    if (idx > 60 && idx < 76) {
                        return $(this).attr("disabled", true);
                    }
                    return idx++;
                }).get(); */

                $("#phone_number_primary").attr('disabled', false);


                /* $('textarea').map(function (idx) {
                    if (idx == 1) {
                        $(this).attr("disabled", true);
                        $(this).css("background-color", "#f8f8f8");
                    }
                })

                $("select").map(function (idx) {
                    console.log(idx)
                    if (idx > 7) {
                        return $(this).attr("disabled", true);
                    }
                    return idx++;
                }).get();

                $(".label").map(function (idx) {
                    console.log(idx)
                    if (idx >= 16) {
                        return $(this).removeClass('label');
                    }
                    return idx++;
                }).get(); */

                /* $(".btn-danger").map(function (idx) {
                    console.log(idx)
                    return $(this).attr("disabled", true);
                }).get(); */

                $(".glyphicon-earphone").hover(function () {
                    $(this).css("color", "#20B2AA");
                }, function () {
                    $(this).css("color", "#00FF00");
                });

                $(".glyphicon-earphone-1").hover(function () {
                    $(this).css("color", "#20B2AA");
                }, function () {
                    $(this).css("color", "#00FF00");
                });
                $("#phone_number_primary").css({
                    'width': '100%'
                })
            }
            else if (sale_stage_id == "10") {
                var ro_name_val = $("#ro_name_val").val();
                $("#ro_name").attr("disabled", false);
                $.ajax({
                    url: "index.php?module=Leads&entryPoint=ro_name",
                    data: { ro_name: ro_name_val },
                    success: function (data) {
                        console.log(data);
                        $("#ro_name").html(data);
                    },
                    dataType: 'html'
                });

                var ho_name_val = $("#ho_name_val").val();
                $("#ho_name").attr("disabled", true);
                $.ajax({
                    url: "index.php?module=Leads&entryPoint=ho_name",
                    data: { ho_name: ho_name_val },
                    success: function (data) {
                        console.log(data);
                        $("#ho_name").html(data);
                        $("#ho_name").attr("disabled", false);
                    },
                    dataType: 'html'
                });

                $("#citizen_identification").blur(function () {
                    check_cmdd()
                })

                

                $(".glyphicon-earphone").css({
                    'position': 'absolute',
                    'color': '#00FF00',
                    'font-size': '30px',
                    'left': '10px'
                });
                $(".glyphicon-earphone-1").css({
                    'position': 'absolute',
                    'color': '#00FF00',
                    'font-size': '30px',
                    'left': '10px'
                });
                /* $("input").map(function (idx) {
                    console.log(idx)
                    if (idx <= 60 && idx > 55) {
                        return $(this).attr("disabled", true);
                    }
                    return idx++;
                }).get(); */

                $("#phone_number_primary").attr('disabled', false);

                /* $("select").map(function (idx) {
                    console.log(idx)
                    if (idx <= 7) {
                        return $(this).attr("disabled", true);
                    }
                    return idx++;
                }).get();

                $(".label").map(function (idx) {
                    console.log(idx)
                    if (idx < 16 && idx != 14) {
                        return $(this).removeClass('label');
                    }
                    return idx++;
                }).get();

                $('textarea').map(function (idx) {
                    if (idx == 0) {
                        $(this).attr("disabled", true);
                        $(this).css("background-color", "#f8f8f8");
                    }
                }) */

                $('#lead_status').css('width', "90%")

                $("#fullname").keyup(function () {
                    $(this).val($(this).val().toUpperCase());
                });

                $(".label").map(function (idx) {
                    return $(this).css('color', "#696969")
                })

                $("#phone_number_extra").blur(function () {
                    $(this).val($(this).val().replace(/ /g, "").replace(/^(\d{3})(\d{3})(\d{4})(\d*)$/, "$1 $2 $3 $4"))
                })
                $('select').css('width', "90%")

                $("[data-label='LBL_CITIZEN_IDENTIFICATION_ISSUANCE_DATE']").html("");
                $("[data-label='LBL_CITIZEN_IDENTIFICATION_ISSUANCE_PLACE']").html("");
                $("[data-label='LBL_ADDRESS_FOLLOW_CITIZEN_IDENTIFICATION']").html("");
                $("[data-label='LBL_BIRTHDAY']").html("");
                $("#citizen_identification_issuance_date").attr("placeholder", "Issuance date (dd/mm/yyyy)");
                $("#citizen_identification_issuance_place").attr("placeholder", "Issuance place");
                $("#address_follow_citizen_identification").attr("placeholder", "Address follow Citizen identity card");
                $("#birthday").attr("placeholder", "Birthday");

                $.ajax({
                    url: "index.php?module=Leads&entryPoint=sale_stage",
                    data: { id: sale_stage_id, lead_status_id: lead_status_id },
                    success: function (data) {
                        console.log(data);
                        $('[name = "sale_stage"]').map(function (idx) {
                            return $(this).html(data);
                        })
                    },
                    dataType: 'html'
                });

                $.ajax({
                    url: "index.php?module=Leads&entryPoint=lead_status",
                    data: { id: sale_stage_id, lead_status_id: lead_status_id },
                    success: function (data) {
                        console.log(data);
                        $('[name = "lead_status"]').map(function (idx) {
                            return $(this).html(data);
                        })
                    },
                    dataType: 'html'
                });

                $('[name="sale_stage"]').map(function (idx) {
                    console.log(idx)
                    if (idx > 0) {
                        return $(this).change(function () {
                            var sale_stage_change_id = $("option:selected", this).val();
                            $('[name="sale_stage"]').map(function (idx) {
                                $(this).val(sale_stage_change_id)
                            })
                            console.log(sale_stage_change_id)
                            $.ajax({
                                url: "index.php?module=Leads&entryPoint=lead_status",
                                data: { id: sale_stage_change_id, lead_status_id: lead_status_id },
                                success: function (data) {
                                    console.log(data);
                                    //$("#lead_status").html(data);
                                    $('[name="lead_status"]').map(function (index) {
                                        if (index > 0) {
                                            $(this).html(data);
                                        }
                                    });
                                },
                                dataType: 'html'
                            });
                        });
                    }
                    return idx++;
                }).get();

            }
            else {
                var ro_name_val = $("#ro_name_val").val();

                /* $('textarea').map(function (idx) {
                    if (idx == 1) {
                        $(this).attr("disabled", true);
                        $(this).css("background-color", "#f8f8f8");
                    }
                }) */

                $("#ro_name").attr("disabled", true);
                $.ajax({
                    url: "index.php?module=Leads&entryPoint=ro_name",
                    data: { ro_name: ro_name_val },
                    success: function (data) {
                        console.log(data);
                        $("#ro_name").html(data);
                        $("#ro_name").attr("disabled", false);
                    },
                    dataType: 'html'
                });

                var ho_name_val = $("#ho_name_val").val();
                $("#ho_name").attr("disabled", true);
                $.ajax({
                    url: "index.php?module=Leads&entryPoint=ho_name",
                    data: { ho_name: ho_name_val },
                    success: function (data) {
                        console.log(data);
                        $("#ho_name").html(data);
                        $("#ho_name").attr("disabled", false);
                    },
                    dataType: 'html'
                });

                $("#phone_number_primary").blur(function () {
                    check_phone_number()
                })


                var transaction_amount = $("#transaction_amount").val();
                $("#transaction_amount").val(transaction_amount.split(".")[0]);
                $(".glyphicon-earphone").css({
                    'position': 'absolute',
                    'color': '#00FF00',
                    'font-size': '30px',
                    'left': '10px'
                });

                $(".glyphicon-earphone-1").css({
                    'position': 'absolute',
                    'color': '#00FF00',
                    'font-size': '30px',
                    'left': '10px'
                });
                
                /* $("input").map(function (idx) {
                    console.log(idx)
                    if (idx > 60 && idx < 76) {
                        return $(this).attr("disabled", true);
                    }
                    return idx++;
                }).get();

                $("select").map(function (idx) {
                    console.log(idx)
                    if (idx > 7) {
                        return $(this).attr("disabled", true);
                    }
                    return idx++;
                }).get();

                $(".label").map(function (idx) {
                    console.log(idx)
                    if (idx >= 16) {
                        return $(this).removeClass('label');
                    }
                    return idx++;
                }).get(); */

                /* $(".btn-danger").map(function (idx) {
                    console.log(idx)
                    return $(this).attr("disabled", true);
                }).get(); */

                $(".glyphicon-earphone").hover(function () {
                    $(this).css("color", "#20B2AA");
                }, function () {
                    $(this).css("color", "#00FF00");
                });

                $(".glyphicon-earphone-1").hover(function () {
                    $(this).css("color", "#20B2AA");
                }, function () {
                    $(this).css("color", "#00FF00");
                });
                $("#phone_number_primary").css({
                    'width': '100%'
                })

                $.ajax({
                    url: "index.php?module=Leads&entryPoint=sale_stage",
                    data: { id: sale_stage_id, lead_status_id: lead_status_id },
                    success: function (data) {
                        console.log(data);
                        $('[name="sale_stage"]').map(function (idx) {
                            $(this).html(data);
                        })
                    },
                    dataType: 'html'
                });

                $.ajax({
                    url: "index.php?module=Leads&entryPoint=lead_status",
                    data: { id: sale_stage_id, lead_status_id: lead_status_id },
                    success: function (data) {
                        console.log(data);
                        $('[name="lead_status"]').map(function (idx) {
                            $(this).html(data);
                        })
                    },
                    dataType: 'html'
                });

                $('[name="sale_stage"]').map(function (idx) {
                        
                    $(this).change(function () {
                        console.log('sale stage change!')
                    var sale_stage_change_id = $("option:selected", this).val();
                    console.log(sale_stage_change_id)
                    $('[name="sale_stage"]').map(function (idx) {
                        $(this).val(sale_stage_change_id)
                    })
                    $.ajax({
                        url: "index.php?module=Leads&entryPoint=lead_status",
                        data: { id: sale_stage_change_id, lead_status_id: lead_status_id },
                        success: function (data) {
                            console.log(data);
                            $('[name="lead_status"]').map(function (idx) {
                                $(this).html(data);
                            })
                        },
                        dataType: 'html'
                    });
                });
            })
            }
            
            $(".glyphicon-earphone").css({
                'position': 'absolute',
                'color': '#00FF00',
                'font-size': '30px',
                'left': '10px'
            });

            $(".glyphicon-earphone-1").css({
                'position': 'absolute',
                'color': '#00FF00',
                'font-size': '30px',
                'left': '10px'
            });
            $(".glyphicon-earphone").hover(function () {
                $(this).css("color", "#20B2AA");
            }, function () {
                $(this).css("color", "#00FF00");
            });

            $(".glyphicon-earphone-1").hover(function () {
                $(this).css("color", "#20B2AA");
            }, function () {
                $(this).css("color", "#00FF00");
            });
            $("#phone_number_primary").css({
                'width': '100%'
            })

        }

        $('select').css('width', "90%")

        $.ajax({
            url: "index.php?module=Leads&entryPoint=sale_stage",
            data: { id: sale_stage_id, lead_status_id: lead_status_id },
            success: function (data) {
                console.log(data);
                $('[name="sale_stage"]').map(function (idx) {
                    $(this).html(data);
                })

            },
            dataType: 'html'
        });

        $.ajax({
            url: "index.php?module=Leads&entryPoint=lead_status",
            data: { id: sale_stage_id, lead_status_id: lead_status_id },
            success: function (data) {
                console.log(data);
                $('[name="lead_status"]').map(function (idx) {
                    $(this).html(data);
                })
            },
            dataType: 'html'
        });

        


        if (ho_name.length === 0) {
            $.ajax({
                url: "index.php?module=Leads&entryPoint=ho_name",
                data: {},
                success: function (data) {
                    console.log(data);
                    $("#ho_name").val(data);
                }
            });
        }


        $('#sale_stage').change(function () {
            var sale_stage_change_id = $("option:selected", this).val();
            $.ajax({
                url: "index.php?module=Leads&entryPoint=lead_status",
                data: { id: sale_stage_change_id, lead_status_id: lead_status_id },
                success: function (data) {
                    console.log(data);
                    $("#lead_status").html(data);
                },
                dataType: 'html'
            });
        });

        
    }

    // role SUPER MKT
    else {
        var sale_stage_id = $('#sale_stages_val').val();
        var lead_status_id = $('#lead_status_id').val();
        var ro_name = $('#ro_name_val').val();
        var ho_name = $('#ho_name_val').val();
        var owner_branch = $('#owner_branch_val').val();

        

        $('[name="bank"]').map(function (idx) {
            $(this).change(function() {
                console.log('xxx')
                let re = $(this).val()
                $('[name="bank"]').map(function (idxx) {
                    $(this).val(re)
                })
            })
        });


        $('[name="card_bark_type"]').map(function (idx) {
            $(this).change(function() {
                console.log('xxx')
                let re = $(this).val()
                $('[name="card_bark_type"]').map(function (idxx) {     
                        $(this).val(re)
                })
            })
        });


        $('[name="service"]').map(function (idx) {
            $(this).change(function() {
                console.log('xxx')
                let re = $(this).val()
                $('[name="service"]').map(function (idxx) {
                    $(this).val(re)
                })
            })
        });



        /* $('[name="sale_stage"]').map(function (idx) {
            $(this).change(function() {
                console.log('xxx')
                let re = $(this).val()
                $('[name="sale_stage"]').map(function (idxx) {
                    $(this).val(re)
                })
            })
        });


        $('[name="lead_status"]').map(function (idx) {
            $(this).change(function() {
                console.log('xxx')
                let re = $(this).val()
                $('[name="lead_status"]').map(function (idxx) {
                    $(this).val(re)
                })
            })
        });
 */

        if (lead_id.length > 0) {
            $(document).ready(function () {
                setInterval(function () {
                    $.ajax({
                        url: "index.php?module=Leads&entryPoint=handle_check_time",
                        data: { id: lead_id },
                        success: function (data) {
                            
                            console.log(data)
                            if (data != "") {
                                alert(`B???n v?????t qu?? th???i gian t??c ?????ng ${data}`)
                                window.open("http://mkt.tranthu.vn/index.php?module=Leads&action=index&return_module=Leads&return_action=index");
                            }
                        }
                    });
                }, 1000);
            })
        }

        if ($('#lead_id').val().length === 0) {
            $(".btn-phone").remove();
            $(".fa-phone").remove();

            $('[data-label="LBL_FACEBOOK_OR_ZALO_NAME"]').append("<span class='required'>*</span>")
            $('[data-label="LBL_DATA_SOURCES"]').append("<span class='required'>*</span>")
            //$('[data-label="LBL_RECEIVING_BRANCH"]').append("<span class='required'>*</span>")
            //$('[data-label="LBL_OWNED_BRANCH"]').append("<span class='required'>*</span>")
            $('[data-label="LBL_SALE_STAGE"]').append("<span class='required'>*</span>")
            $('[data-label="LBL_CONTACT_DATE"]').append("<span class='required'>*</span>")
            //$('[data-label="LBL_RO_NAME"]').append("<span class='required'>*</span>")

            $("#transaction_amount").change(function () {
                var transaction_amount = $(this).val();
                $(this).val(Number(transaction_amount).toLocaleString());
            })

            let context = $("#receiving_branch").html();
            $('[name="service"]').map(function (idx) {
                $(this).change(function() {
                    var service = $(this).val();
                    if (service == '5') {
                            $("#receiving_branch").html("<option value='4' selected>TELE</option><option value='5'>DL TB</option><option value='0'>Choose</option>");
                    }
                    else {
                        $("#receiving_branch").html(context)
                    }
                })
            })

            $("#phone_number_primary").blur(function () {
                check_phone_number()
            })
            $("#ro_name").attr("disabled", true);



            $(".input_phone_number_primary").removeClass("col-xs-6")
           $(".edit-view-row-item").map(function (idx) {
                if (idx == 18) {
                    return this.remove();
                }
                idx++;
            }).get();

             $(".panel-default").map(function (idx) {
                if (idx == 1) {
                    return this.remove();
                }
                idx++;
            }).get(); 
            $(".input_phone_number_primary").addClass("col-xl-12 col-xs-12 col-sm-8 edit-view-field")
            $('.input_phone_number_primary').css('width', "100%")
            $('#phone_number_primary').css('width', "90%")
        }
        else {

            $('[name="service"]').map(function (idx) {
                if (idx == 0) {
                    var service = $(this).val();
                    if (service == '5') {
                        console.log('hello')
                        $("#receiving_branch").html("<option value='4' selected>TELE</option><option value='5'>DL TB</option><option value='0'>Choose</option>");
                    }
                    else {
                        $("#receiving_branch").html("<option value='' selected>Choose</option><option value='1'>NTT</option><option value='2'>Q10</option><option value='3'>T??n B??nh</option><option value='4'>TELE</option><option value='5'>DL TB</option><option value='0'>Choose</option>");
                    }
                }
            })
            

            let context = $("#receiving_branch").html();
            $('[name="service"]').map(function (idx) {
                $(this).change(function() {
                    if (idx == 0) {
                        var service = $(this).val();
                        if (service == '5') {
                            console.log('hello')
                            $("#receiving_branch").html("<option value='4' selected>TELE</option><option value='5'>DL TB</option><option value='0'>Choose</option>");
                        }
                        else {
                            $("#receiving_branch").html("<option value='' selected>Choose</option><option value='1'>NTT</option><option value='2'>Q10</option><option value='3'>T??n B??nh</option><option value='4'>TELE</option><option value='5'>DL TB</option><option value='0'>Choose</option>");
                        }
                    }
                })
            })

            if (sale_stage_id == "0") {
                var ro_name_val = $("#ro_name_val").val();
                $("#ro_name").attr("disabled", true);
                $.ajax({
                    url: "index.php?module=Leads&entryPoint=ro_name",
                    data: { ro_name: ro_name_val },
                    success: function (data) {
                        console.log(data);
                        $("#ro_name").html(data);
                        $("#ro_name").attr("disabled", false);
                    },
                    dataType: 'html'
                });

                var ho_name_val = $("#ho_name_val").val();
                $("#ho_name").attr("disabled", true);
                $.ajax({
                    url: "index.php?module=Leads&entryPoint=ho_name",
                    data: { ho_name: ho_name_val },
                    success: function (data) {
                        console.log(data);
                        $("#ho_name").html(data);
                        $("#ho_name").attr("disabled", false);
                    },
                    dataType: 'html'
                });

                $("#phone_number_primary").blur(function () {
                    check_phone_number()
                })

                /* $('textarea').map(function (idx) {
                    if (idx == 1) {
                        $(this).attr("disabled", true);
                        $(this).css("background-color", "#f8f8f8");
                    }
                }) */


                var transaction_amount = $("#transaction_amount").val();
                $("#transaction_amount").val(transaction_amount.split(".")[0]);

                $("#transaction_amount").change(function () {
                    var transaction_amount = $(this).val();
                    $(this).val(Number(transaction_amount).toLocaleString());
                })
                var real_transaction_amount = $("#real_transaction_amount").val();
                $("#real_transaction_amount").val(real_transaction_amount.split(".")[0]);

                $("#real_transaction_amount").change(function () {
                    var transaction_amount = $(this).val();
                    $(this).val(Number(transaction_amount).toLocaleString());
                })

                $(".glyphicon-earphone").css({
                    'position': 'absolute',
                    'color': '#00FF00',
                    'font-size': '30px',
                    'left': '10px'
                });

                $(".glyphicon-earphone-1").css({
                    'position': 'absolute',
                    'color': '#00FF00',
                    'font-size': '30px',
                    'left': '10px'
                });
                /* $("input").map(function (idx) {
                    console.log(idx)
                    if (idx > 60 && idx < 76) {
                        return $(this).attr("disabled", true);
                    }
                    return idx++;
                }).get();

                $("select").map(function (idx) {
                    console.log(idx)
                    if (idx > 7) {
                        return $(this).attr("disabled", true);
                    }
                    return idx++;
                }).get();

                $(".label").map(function (idx) {
                    console.log(idx)
                    if (idx >= 16) {
                        return $(this).removeClass('label');
                    }
                    return idx++;
                }).get(); */

                /* $(".btn-danger").map(function (idx) {
                    console.log(idx)
                    return $(this).attr("disabled", true);
                }).get(); */

                $(".glyphicon-earphone").hover(function () {
                    $(this).css("color", "#20B2AA");
                }, function () {
                    $(this).css("color", "#00FF00");
                });

                $(".glyphicon-earphone-1").hover(function () {
                    $(this).css("color", "#20B2AA");
                }, function () {
                    $(this).css("color", "#00FF00");
                });
                $("#phone_number_primary").css({
                    'width': '100%'
                })
            }
            else if (sale_stage_id == "10") {
                var ro_name_val = $("#ro_name_val").val();
                $("#ro_name").attr("disabled", false);
                $.ajax({
                    url: "index.php?module=Leads&entryPoint=ro_name",
                    data: { ro_name: ro_name_val },
                    success: function (data) {
                        console.log(data);
                        $("#ro_name").html(data);
                    },
                    dataType: 'html'
                });

                var ho_name_val = $("#ho_name_val").val();
                $("#ho_name").attr("disabled", true);
                $.ajax({
                    url: "index.php?module=Leads&entryPoint=ho_name",
                    data: { ho_name: ho_name_val },
                    success: function (data) {
                        console.log(data);
                        $("#ho_name").html(data);
                        $("#ho_name").attr("disabled", false);
                    },
                    dataType: 'html'
                });

                $("#citizen_identification").blur(function () {
                    check_cmdd()
                })

                var transaction_amount = $("#transaction_amount").val();
                $("#transaction_amount").val(transaction_amount.split(".")[0]);

                $("#real_transaction_amount").change(function () {
                    var real_transaction_amount = $(this).val();
                    $(this).val(Number(real_transaction_amount).toLocaleString());
                })
                var real_transaction_amount = $("#real_transaction_amount").val();
                $("#real_transaction_amount").val(real_transaction_amount.split(".")[0]);

                $("#real_transaction_amount").change(function () {
                    var transaction_amount = $(this).val();
                    $(this).val(Number(transaction_amount).toLocaleString());
                })

                $(".glyphicon-earphone").css({
                    'position': 'absolute',
                    'color': '#00FF00',
                    'font-size': '30px',
                    'left': '10px'
                });

                $(".glyphicon-earphone-1").css({
                    'position': 'absolute',
                    'color': '#00FF00',
                    'font-size': '30px',
                    'left': '10px'
                });
                /* $("input").map(function (idx) {
                    console.log(idx)
                    if (idx <= 60 && idx > 55) {
                        return $(this).attr("disabled", true);
                    }
                    return idx++;
                }).get();

                $("select").map(function (idx) {
                    console.log(idx)
                    if (idx <= 7) {
                        return $(this).attr("disabled", true);
                    }
                    return idx++;
                }).get();

                $(".label").map(function (idx) {
                    console.log(idx)
                    if (idx < 16 && idx != 14) {
                        return $(this).removeClass('label');
                    }
                    return idx++;
                }).get();

                $('textarea').map(function (idx) {
                    if (idx == 0) {
                        $(this).attr("disabled", true);
                        $(this).css("background-color", "#f8f8f8");
                    }
                }) */

                $('#lead_status').css('width', "90%")

                $("#fullname").keyup(function () {
                    $(this).val($(this).val().toUpperCase());
                });

                $(".label").map(function (idx) {
                    return $(this).css('color', "#696969")
                })

                $("#phone_number_extra").blur(function () {
                    $(this).val($(this).val().replace(/ /g, "").replace(/^(\d{3})(\d{3})(\d{4})(\d*)$/, "$1 $2 $3 $4"))
                })
                $('select').css('width', "90%")

                $("[data-label='LBL_CITIZEN_IDENTIFICATION_ISSUANCE_DATE']").html("");
                $("[data-label='LBL_CITIZEN_IDENTIFICATION_ISSUANCE_PLACE']").html("");
                $("[data-label='LBL_ADDRESS_FOLLOW_CITIZEN_IDENTIFICATION']").html("");
                $("[data-label='LBL_BIRTHDAY']").html("");
                $("#citizen_identification_issuance_date").attr("placeholder", "Issuance date (dd/mm/yyyy)");
                $("#citizen_identification_issuance_place").attr("placeholder", "Issuance place");
                $("#address_follow_citizen_identification").attr("placeholder", "Address follow Citizen identity card");
                $("#birthday").attr("placeholder", "Birthday");

                $.ajax({
                    url: "index.php?module=Leads&entryPoint=sale_stage",
                    data: { id: sale_stage_id, lead_status_id: lead_status_id },
                    success: function (data) {
                        console.log(data);
                        $('[name="sale_stage"]').map(function (idx) {
                            $(this).html(data);
                        })
                        

                    },
                    dataType: 'html'
                });

                $.ajax({
                    url: "index.php?module=Leads&entryPoint=lead_status",
                    data: { id: sale_stage_id, lead_status_id: lead_status_id },
                    success: function (data) {
                        console.log(data);
                        $('[name = "lead_status"]').map(function (idx) {
                            return $(this).html(data);
                        })
                    },
                    dataType: 'html'
                });

                $('[name="sale_stage"]').map(function (idx) {
                    console.log(idx)
                    if (idx > 0) {
                        return $(this).change(function () {
                            var sale_stage_change_id = $("option:selected", this).val();
                            console.log(sale_stage_change_id)
                            $.ajax({
                                url: "index.php?module=Leads&entryPoint=lead_status",
                                data: { id: sale_stage_change_id, lead_status_id: lead_status_id },
                                success: function (data) {
                                    console.log(data);
                                    //$("#lead_status").html(data);
                                    $('[name="lead_status"]').map(function (index) {
                                        if (index > 0) {
                                            $(this).html(data);
                                        }
                                    });
                                },
                                dataType: 'html'
                            });
                        });
                    }
                    return idx++;
                }).get();

            }
            else {
                var ro_name_val = $("#ro_name_val").val();
                $("#ro_name").attr("disabled", true);
                $.ajax({
                    url: "index.php?module=Leads&entryPoint=ro_name",
                    data: { ro_name: ro_name_val },
                    success: function (data) {
                        console.log(data);
                        $("#ro_name").html(data);
                        $("#ro_name").attr("disabled", false);
                    },
                    dataType: 'html'
                });

                var ho_name_val = $("#ho_name_val").val();
                $("#ho_name").attr("disabled", true);
                $.ajax({
                    url: "index.php?module=Leads&entryPoint=ho_name",
                    data: { ho_name: ho_name_val },
                    success: function (data) {
                        console.log(data);
                        $("#ho_name").html(data);
                        $("#ho_name").attr("disabled", false);
                    },
                    dataType: 'html'
                });

                $("#phone_number_primary").blur(function () {
                    check_phone_number()
                })

                /* $('textarea').map(function (idx) {
                    if (idx == 1) {
                        $(this).attr("disabled", true);
                        $(this).css("background-color", "#f8f8f8");
                    }
                }) */
                var transaction_amount = $("#transaction_amount").val();
                $("#transaction_amount").val(transaction_amount.split(".")[0]);
                $(".glyphicon-earphone").css({
                    'position': 'absolute',
                    'color': '#00FF00',
                    'font-size': '30px',
                    'left': '10px'
                });

                $(".glyphicon-earphone-1").css({
                    'position': 'absolute',
                    'color': '#00FF00',
                    'font-size': '30px',
                    'left': '10px'
                });
                $("#transaction_amount").change(function () {
                    var transaction_amount = $(this).val();
                    $(this).val(Number(transaction_amount).toLocaleString());
                })
                var real_transaction_amount = $("#real_transaction_amount").val();
                $("#real_transaction_amount").val(real_transaction_amount.split(".")[0]);

                $("#real_transaction_amount").change(function () {
                    var transaction_amount = $(this).val();
                    $(this).val(Number(transaction_amount).toLocaleString());
                })
                /* $("input").map(function (idx) {
                    console.log(idx)
                    if (idx > 60 && idx < 76) {
                        return $(this).attr("disabled", true);
                    }
                    return idx++;
                }).get();

                $("select").map(function (idx) {
                    console.log(idx)
                    if (idx > 7) {
                        return $(this).attr("disabled", true);
                    }
                    return idx++;
                }).get();

                $(".label").map(function (idx) {
                    console.log(idx)
                    if (idx >= 16) {
                        return $(this).removeClass('label');
                    }
                    return idx++;
                }).get();

                $(".btn-danger").map(function (idx) {
                    console.log(idx)
                    return $(this).attr("disabled", true);
                }).get(); */

                $(".glyphicon-earphone").hover(function () {
                    $(this).css("color", "#20B2AA");
                }, function () {
                    $(this).css("color", "#00FF00");
                });

                $(".glyphicon-earphone-1").hover(function () {
                    $(this).css("color", "#20B2AA");
                }, function () {
                    $(this).css("color", "#00FF00");
                });
                $("#phone_number_primary").css({
                    'width': '100%'
                })

                $.ajax({
                    url: "index.php?module=Leads&entryPoint=sale_stage",
                    data: { id: sale_stage_id, lead_status_id: lead_status_id },
                    success: function (data) {
                        console.log(data);
                        $('[name="sale_stage"]').map(function (idx) {
                            $(this).html(data);
                        })

                    },
                    dataType: 'html'
                });

                $.ajax({
                    url: "index.php?module=Leads&entryPoint=lead_status",
                    data: { id: sale_stage_id, lead_status_id: lead_status_id },
                    success: function (data) {
                        console.log(data);
                        $('[name="lead_status"]').map(function (idx) {
                            $(this).html(data);
                        })
                    },
                    dataType: 'html'
                });

                $('[name="sale_stage"]').map(function (idx) {
                        
                        $(this).change(function () {
                            console.log('sale stage change!')
                        var sale_stage_change_id = $("option:selected", this).val();
                        console.log(sale_stage_change_id)
                        $('[name="sale_stage"]').map(function (idx) {
                            $(this).val(sale_stage_change_id)
                        })
                        $.ajax({
                            url: "index.php?module=Leads&entryPoint=lead_status",
                            data: { id: sale_stage_change_id, lead_status_id: lead_status_id },
                            success: function (data) {
                                console.log(data);
                                $('[name="lead_status"]').map(function (idx) {
                                    $(this).html(data);
                                })
                            },
                            dataType: 'html'
                        });
                    });
                })
            }
            var transaction_amount = $("#transaction_amount").val();
            $("#transaction_amount").val(transaction_amount.split(".")[0]);
            $(".glyphicon-earphone").css({
                'position': 'absolute',
                'color': '#00FF00',
                'font-size': '30px',
                'left': '10px'
            });
            $(".glyphicon-earphone").hover(function () {
                $(this).css("color", "#20B2AA");
            }, function () {
                $(this).css("color", "#00FF00");
            });

            $(".glyphicon-earphone-1").css({
                'position': 'absolute',
                'color': '#00FF00',
                'font-size': '30px',
                'left': '10px'
            });
            $(".glyphicon-earphone-1").hover(function () {
                $(this).css("color", "#20B2AA");
            }, function () {
                $(this).css("color", "#00FF00");
            });
            $("#phone_number_primary").css({
                'width': '100%'
            })

        }

        $('select').css('width', "90%")

        $.ajax({
            url: "index.php?module=Leads&entryPoint=sale_stage",
            data: { id: sale_stage_id, lead_status_id: lead_status_id },
            success: function (data) {
                console.log(data);
                $('[name="sale_stage"]').map(function (idx) {
                    $(this).html(data);
                })

            },
            dataType: 'html'
        });

        $.ajax({
            url: "index.php?module=Leads&entryPoint=lead_status",
            data: { id: sale_stage_id, lead_status_id: lead_status_id },
            success: function (data) {
                console.log(data);
                $('[name="lead_status"]').map(function (idx) {
                    $(this).html(data);
                })
            },
            dataType: 'html'
        });

        if (ro_name.length === 0) {
            $.ajax({
                url: "index.php?module=Leads&entryPoint=ro_name",
                data: {},
                success: function (data) {
                    console.log(data);
                    $("#ro_name").val(data);
                }
            });
        }

        if (ho_name.length === 0) {
            console.log('hello')
            $.ajax({
                url: "index.php?module=Leads&entryPoint=ho_name",
                data: {},
                success: function (data) {
                    console.log(data);
                    $("#ho_name").val(data);
                }
            });
        }

        $('[name="sale_stage"]').map(function (idx) {
            $(this).change(function () {
                var sale_stage_change_id = $("option:selected", this).val();
                $('[name="sale_stage"]').map(function (idx) {
                    $(this).val(sale_stage_change_id)
                })
                $.ajax({
                    url: "index.php?module=Leads&entryPoint=lead_status",
                    data: { id: sale_stage_change_id, lead_status_id: lead_status_id },
                    success: function (data) {
                        console.log(data);
                        $('[name="lead_status"]').map(function (idx) {
                            $(this).html(data);
                        })
                    },
                    dataType: 'html'
                });
            });
        })

        var ro_name_val = $("#ro_name_val").val();
                $("#ro_name").attr("disabled", false);
                $.ajax({
                    url: "index.php?module=Leads&entryPoint=ro_name",
                    data: { ro_name: ro_name_val },
                    success: function (data) {
                        console.log(data);
                        $("#ro_name").html(data);
                    },
                    dataType: 'html'
                });
    }
});

function handle_check_payment_day() {
    var isCheck = false;
    $('[name="payment_day"]').map(function (idx) {
        if ($(this).is(':disabled')) {
            //textbox is disabled
            console.log('hello', idx)
        }
        else {
            var payment_day = $(this).val();
            if (payment_day >= 1 && payment_day <= 31) {
                isCheck = true;
            }
        }
    })
    return isCheck;
}

function handle_check_payment_day_empty() {
    var isCheck = false;
    $('[name="sale_stage"]').map(function (idx) {
        if ($(this).is(':disabled')) {
            //textbox is disabled
            console.log('hello', idx)
        }
        else {
            var sale_stage = $(this).val();
            if (sale_stage.length !== 0) {
                isCheck = true;
            }
        }
    })
    return isCheck;
}


function handle_check_leads_status_empty() {
    var isCheck = false;
    $('[name="lead_status"]').map(function (idx) {
        if ($(this).is(':disabled')) {
            //textbox is disabled
            console.log('hello', idx)
        }
        else {
            var lead_status = $(this).val();
            if (lead_status.length !== 0) {
                isCheck = true;
            }
        }
    })
    return isCheck;
}

function handle_check_service_empty() {
    var isCheck = false;
    $('[name="service"]').map(function (idx) {
        if ($(this).is(':disabled')) {
            //textbox is disabled
            console.log('hello', idx)
        }
        else {
            var service = $(this).val();
            if (service.length !== 0) {
                isCheck = true;
            }
        }
    })
    return isCheck;
}

function handle_check_sale_stage_empty() {
    var isCheck = false;
    $('[name="payment_day"]').map(function (idx) {
        if ($(this).is(':disabled')) {
            //textbox is disabled
            console.log('hello', idx)
        }
        else {
            var payment_day = $(this).val();
            if (payment_day.length !== 0) {
                isCheck = true;
            }
        }
    })
    return isCheck;
}

function handle_check_form_role_ro() {
    var fullname = $("#fullname").val();
    var bank = $("#bank").val();
    var card_bark_type = $("#card_bark_type").val();
    var citizen_identification = $("#citizen_identification").val();
    var citizen_identification_issuance_date = $("#citizen_identification_issuance_date").val();
    var real_transaction_amount = $("#real_transaction_amount").val();
    var citizen_identification_issuance_place = $("#citizen_identification_issuance_place").val();
    var real_fee = $("#real_fee").val();
    var address_follow_citizen_identification = $("#address_follow_citizen_identification").val();
    var birthday = $("#birthday").val();
    var successful_trading_day = $("#successful_trading_day").val();
    var phone_number_extra = $("#phone_number_extra").val();
    var career = $("#career").val();
    var district_customer_live = $("#district_customer_live").val();
    var sale_stage_id = $('#sale_stages_val').val();

    $('[name="sale_stage"]').map(function (idx) {
        $(this).change(function() {
            sale_stage_id = $(this).val();
        })
    });

    if (sale_stage_id == "7") {
        if (fullname.length === 0) {
            alert("Vui l??ng nh???p t??n ?????y ?????!");
            return false;
        }
        if (bank.length === 0) {
            alert("Vui l??ng ng??n h??ng!");
            return false;
        }
        if (card_bark_type.length === 0) {
            alert("Vui l??ng lo???i th??? ng???n h??ng!");
            return false;
        }
        if (citizen_identification.length === 0) {
            alert("Vui l??ng nh???p CCCD!");
            return false;
        }
        if (citizen_identification_issuance_date.length === 0) {
            alert("Vui l??ng nh???p ng??y ph??t h??nh CCCD!");
            return false;
        }
        if (real_transaction_amount.length === 0) {
            alert("Vui l??ng s??? ti???n giao d???ch th???c t???!");
            return false;
        }
        if (citizen_identification_issuance_place.length === 0) {
            alert("Vui l??ng nh???p n???i ph??t h??nh th??? CCCD!");
            return false;
        }
    
        handle_check_payment_day_empty();
    
        handle_check_leads_status_empty();
    
        handle_check_service_empty();
    
        if (real_fee.length === 0) {
            alert("Vui l??ng nh???p ph?? th???c t???!");
            return false;
        }
        if (address_follow_citizen_identification.length === 0) {
            alert("Vui l??ng nh???p ?????a ch??? theo CCCD!");
            return false;
        }
        if (birthday.length === 0) {
            alert("Vui l??ng nh???p ng??y sinh!");
            return false;
        }
        if (successful_trading_day.length === 0) {
            alert("Vui l??ng nh???p ng??y giao d???ch th??nh c??ng!");
            return false;
        }
        if (phone_number_extra.length === 0) {
            alert("Vui l??ng nh??p s??? ??i???n tho???i 2!");
            return false;
        }
        if (career.length === 0) {
            alert("Vui l??ng nh???p ngh??? nghi???p!");
            return false;
        }
        if (district_customer_live.length === 0) {
            alert("Vui l??ng nh???p ?????a ch???!");
            return false;
        }
    }

    return true;
}

function check_cmdd() {
    var res = true;
    var citizen_identification = $("#citizen_identification").val();
    var lead_id = $("#lead_id").val();
    if (lead_id.length === 0) {
        $.ajax({
            url: "index.php?module=Leads&entryPoint=get_cmdd",
            data: { cmdd: citizen_identification },
            success: function (data) {
                console.log(data);
                if (data == false) {
                    alert("S??? CMNN b??? tr??ng! Vui l??ng nh???p l???i!")
                    res = false
                }
            },
            async: false
        });
    }
    else {
        $.ajax({
            url: "index.php?module=Leads&entryPoint=get_cmdd",
            data: { id: lead_id, cmdd: citizen_identification },
            success: function (data) {
                console.log(data);
                if (data == false) {
                    alert("S??? CMNN b??? tr??ng! Vui l??ng nh???p l???i!")
                    res = false
                }
            },
            async: false
        });
    }
    return res;
}


function checkCardNumber() {
    let res = []
    $('.card-number-input').map(function (idx) {
        res.push($(this).val())   
    })

    return new Set(res).size == res.length
}

function check_phone_number() {
    var res = true;
    var phone_number_primary = $("#phone_number_primary").val();
    var lead_id = $("#lead_id").val();
    if (lead_id.length === 0) {
        $.ajax({
            url: "index.php?module=Leads&entryPoint=get_phone_number",
            data: { phone_number: phone_number_primary },
            success: function (data) {
                console.log(data);
                if (data == false) {
                    alert("S??? ??i???n tho???i b??? tr??ng! Vui l??ng nh???p l???i!")
                    res = false
                }
            },
            async: false
        });
    }
    else {
        $.ajax({
            url: "index.php?module=Leads&entryPoint=get_phone_number",
            data: { id: lead_id, phone_number: phone_number_primaryx },
            success: function (data) {
                console.log(data);
                if (data == false) {
                    alert("S??? ??i???n tho???i b??? tr??ng! Vui l??ng nh???p l???i!")
                    res = false
                }
            },
            async: false
        });
    }
    return res;
}

function check_form(form_name) {
    //console.log(lst)

    function getCookie(name) {
        const value = `; ${document.cookie}`;
        const parts = value.split(`; ${name}=`);
        if (parts.length === 2) return parts.pop().split(';').shift();
    }

    let sale_stage = '';
    $('[name="sale_stage"]').map(function (idx) {
        sale_stage = $("option:selected", this).val();    
    })

    var role = getCookie("role");

    if ($('#lead_id').val().length != 0 ) {
        if (sale_stage == '7') {
            if (handle_check_payment_day() == false) {
                alert("Vui l??ng nh???p gi?? tr??? ng??y thanh to??n trong kho???ng t??? 1 ?????n 31!")
                return false;
            }
        }
        
    }
    else {
        if ($('#facebook_or_zalo_name').val().length == 0) {
            alert("Vui l??ng nh???p t??n FB/Zalo!")
            return false;
        }
        else if ($('#data_sources').val().length == 0) {
            alert("Vui l??ng ch???n ngu???n data!")
            return false;
        }
        /* else if ($('#receiving_branch').val().length == 0) {
            alert("Vui l??ng ch???n chi nh??nh nh???n!")
            return false;
        } */
        else if ($('#sale_stage').val().length == 0 || $('#sale_stage').val() == "0" ) {
            alert("Vui l??ng ch???n Sale Stage!")
            return false;
        }
        /* else if ($('#owned_branch').val().length == 0) {
            alert("Vui l??ng ch???n chi nh??nh s??? h???u!")
            return false;
        }
        else if ($('#ro_name').val().length == 0 || $('#ro_name').val() == "0") {
            alert("Vui l??ng ch???n RO!")
            return false;
        } */
        else if ($('#contact_date').val().length == 0) {
            alert("Vui l??ng ch???n ng??y kh??ch h??ng li??n h???!")
            return false;
        }
    }

    if (checkCardNumber() == false) {
        alert("S??? ch???ng minh th?? b??? tr??ng! Vui l??ng nh???p l???i!")
        return false;
    }

    
    let lead_status = '';
    $('[name="lead_status"]').map(function (idx) {
        lead_status = $("option:selected", this).val();
        
    })
    console.log(sale_stage)
    console.log(lead_status)
    if ((role === "RO" || role === "BU") && sale_stage == '7' && lead_status == '18' ) {
        if (handle_check_form_role_ro() == false) {
            return false;
        }
        if (check_cmdd() == false) {
            alert('hello')
            return false;
        }
    }
    else if (role === "SUPER_MKT" && role === "MKT") {
        if ($('#lead_id').val().length !== 0) {
            var sale_stage_id = $('#sale_stages_val').val();
            if (sale_stage_id === "10") {
                if (handle_check_form_role_ro() == false) {
                    return false;
                }
            }
        }
        if (check_phone_number() == false) {
            return false;
        }
    }

    let res = []
    $('.card-number-input').map(function (idx) {
        res.push($(this).val())   
    })
    var lead_id = $("#lead_id").val();
    $.ajax({
        url: "index.php?module=Leads&entryPoint=add_card_number_lead",
        data: { arr: res, lead_id: lead_id },
        success: function (data) {
            console.log(data);
        }
    });

    cstm_validate = validate_form(form_name, '');
    if (cstm_validate && other_condition) {
        return true;
    }
    return false;

}