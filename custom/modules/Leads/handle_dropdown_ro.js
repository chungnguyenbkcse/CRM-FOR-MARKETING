export function handle_dropdown_ro() {
    var sale_stage_id = $('#sale_stage option:selected').val();
    var lead_status_id = $('#lead_status_id').val();

    $('#lead_status').css('width', "90%")

    var bearer = 'Bearer ' + "4Sl3iFxgpfx7LV4xAf5FUh4eoBUbmKVg6gHeQr3U2loj0ne3mQ";
    let yourDate = new Date();
    let start_date = yourDate.toISOString().split('T')[0] + " 00:00:00";
    let end_date = yourDate.toISOString().split('T')[0] + " 23:59:59";
    console.log(start_date)
    var phone_number_primary = $("#phone_number_primary").val();
    var details = {
        'start_date': start_date,
        'end_date': end_date,
        'field_name': 'dst',
        'field_pattern': phone_number_primary,
        'limit': 10,
        'offset': 0
    };

    $("#fullname").keyup(function () {  
        $(this).val($(this).val().toUpperCase());  
    });   

    $("#phone_number_extra").blur(function () {
        $(this).val($(this).val().replace(/ /g, "").replace(/^(\d{3})(\d{3})(\d{4})(\d*)$/, "$1 $2 $3 $4"))
    })

    console.log(details)

    var formBody = [];
    for (var property in details) {
      var encodedKey = encodeURIComponent(property);
      var encodedValue = encodeURIComponent(details[property]);
      formBody.push(encodedKey + "=" + encodedValue);
    }
    formBody = formBody.join("&");

    console.log(formBody)

    $.ajax({
        url: "http://51.3.9.21/apibkk/apimaster/api.php?cmd=cdrreport",
        type: 'POST',
        beforeSend: function (xhr) {
            xhr.setRequestHeader('Authorization', bearer);
            xhr.setRequestHeader('Content-Type', "application/x-www-form-urlencoded");
        },
        data: formBody,
        success: function(data){
            console.log(data);        
        }
    });

    /* fetch(
        `http://51.3.9.21/apibkk/apimaster/api.php?cmd=cdrreport`, {
            method: "POST",
            headers: {
                'Authorization': bearer,
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: formBody
        }
    )
    .then( response => {
        if (!response.ok) {
            throw Error(response.statusText);
        }
        else {
            console.log(response)
            return response.json()
        }
    })
    .then (data => {
        console.log(data)
    })
    .catch(error => {
        console.log("error")
    });  */

    $("[data-label='LBL_CITIZEN_IDENTIFICATION_ISSUANCE_DATE']").html("");
    $("[data-label='LBL_CITIZEN_IDENTIFICATION_ISSUANCE_PLACE']").html("");
    $("[data-label='LBL_ADDRESS_FOLLOW_CITIZEN_IDENTIFICATION']").html("");
    $("[data-label='LBL_BIRTHDAY']").html("");
    $("#citizen_identification_issuance_date").attr("placeholder", "Issuance date (dd/mm/yyyy)");
    $("#citizen_identification_issuance_place").attr("placeholder", "Issuance place");
    $("#address_follow_citizen_identification").attr("placeholder", "Address follow Citizen identity card");
    $("#birthday").attr("placeholder", "Birthday");

    $.ajax({
        url: "index.php?module=Leads&entryPoint=sale_stage&role=bu",
        data: {id: sale_stage_id, lead_status_id: lead_status_id},
        success: function(data){
            console.log(data);
            $("#sale_stage").html(data);
            
        },
        dataType: 'html'
    });

    $.ajax({
        url: "index.php?module=Leads&entryPoint=lead_status&role=bu",
        data: {id: sale_stage_id, lead_status_id: lead_status_id},
        success: function(data){
            console.log(data);
            $("#lead_status").html(data);
        },
        dataType: 'html'
    });

    $('#sale_stage').change(function() {
        var sale_stage_change_id = $('#sale_stage option:selected').val();
        $.ajax({
            url: "index.php?module=Leads&entryPoint=lead_status&role=bu",
            data: {id: sale_stage_change_id, lead_status_id: lead_status_id},
            success: function(data){
                console.log(data);
                $("#lead_status").html(data);
            },
            dataType: 'html'
        });
    });
}

function check_record() {
    var bearer = 'Bearer ' + "4Sl3iFxgpfx7LV4xAf5FUh4eoBUbmKVg6gHeQr3U2loj0ne3mQ";
    let yourDate = new Date();
    let start_date = yourDate.toISOString().split('T')[0] + " 00:00:00";
    let end_date = yourDate.toISOString().split('T')[0] + " 23:59:59";
    var phone_number_primary = $("#phone_number_primary").val();
    var details = {
        'start_date': start_date,
        'end_date': end_date,
        'field_name': 'dst',
        'field_pattern': phone_number_primary,
        'limit': 10,
        'ofset': 0
    };

    var formBody = [];
    for (var property in details) {
      var encodedKey = encodeURIComponent(property);
      var encodedValue = encodeURIComponent(details[property]);
      formBody.push(encodedKey + "=" + encodedValue);
    }
    formBody = formBody.join("&");
    fetch(
        `http://51.3.9.21/apibkk/apimaster/api.php?cmd=cdrreport`, {
            method: "POST",
            headers: {
                'Authorization': bearer,
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: formBody
        }
    )
    .then( response => {
        if (!response.ok) {
            throw Error(response.statusText);
        }
        else {
            return response.json()
        }
    })
    .then (data => {
        console.log(data)
    })
    .catch(error => {
        console.log("error")
    }); 
}

function check_form(form_name){
    //console.log(lst)
    if (check_record() == false){
        return false;
    }
    cstm_validate = validate_form(form_name,'');
    if (cstm_validate  && other_condition)
        return true;
    return false;
}