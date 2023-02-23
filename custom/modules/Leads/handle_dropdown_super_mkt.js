export function handle_dropdown_super_mkt() {
    var sale_stage_id = $('#sale_stage option:selected').val();
    var lead_status_id = $('#lead_status_id').val();

    $('#lead_status').css('width', "90%")

    $("#fullname").keyup(function () {  
        $(this).val($(this).val().toUpperCase());  
    });   

    $("#phone_number_extra").blur(function () {
        $(this).val($(this).val().replace(/ /g, "").replace(/^(\d{3})(\d{3})(\d{4})(\d*)$/, "$1 $2 $3 $4"))
    })

    $("[data-label='LBL_CITIZEN_IDENTIFICATION_ISSUANCE_DATE']").html("");
    $("[data-label='LBL_CITIZEN_IDENTIFICATION_ISSUANCE_PLACE']").html("");
    $("[data-label='LBL_ADDRESS_FOLLOW_CITIZEN_IDENTIFICATION']").html("");
    $("[data-label='LBL_BIRTHDAY']").html("");
    $("#citizen_identification_issuance_date").attr("placeholder", "Issuance date (dd/mm/yyyy)");
    $("#citizen_identification_issuance_place").attr("placeholder", "Issuance place");
    $("#address_follow_citizen_identification").attr("placeholder", "Address follow Citizen identity card");
    $("#birthday").attr("placeholder", "Birthday");

    $.ajax({
        url: "index.php?module=Leads&entryPoint=sale_stage&role=super_mkt",
        data: {id: sale_stage_id, lead_status_id: lead_status_id},
        success: function(data){
            console.log(data);
            $("#sale_stage").html(data);
            
        },
        dataType: 'html'
    });

    $.ajax({
        url: "index.php?module=Leads&entryPoint=lead_status&role=super_mkt",
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
            url: "index.php?module=Leads&entryPoint=lead_status&role=super_mkt",
            data: {id: sale_stage_change_id, lead_status_id: lead_status_id},
            success: function(data){
                console.log(data);
                $("#lead_status").html(data);
            },
            dataType: 'html'
        });
    });
}