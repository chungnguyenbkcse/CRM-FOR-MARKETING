<?php
// Xử lý phân trang
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$per_page = isset($_GET['per_page']) ? (int)$_GET['per_page'] : 10;
$offset = ($page - 1) * $per_page;
$data_source = isset($_GET['data_source']) ? $_GET['data_source'] : '';
$campaign = isset($_GET['campain']) ? $_GET['campain'] : '';
$branch = isset($_GET['branch']) ? $_GET['branch'] : '';
$user = isset($_GET['user']) ? $_GET['user'] : '';

$html_row_table = "";
$index = 1;
$query_campaign = "SELECT 
leads.id AS lead_id,
leads.ro_name AS lead_ro_name,
users.user_name AS user_name,
data_sources.name AS data_source_name,
lead_status.name AS lead_status_name,
sale_stage.name AS sale_stage_name,
campaign.name AS campaign_name,
owned_branch.name AS owned_branch_name,
leads.sale_stage AS lead_sale_stage,
leads.lead_status AS lead_lead_status,
leads.date_entered AS lead_date_entered,
leads.date_modified AS lead_date_modified,
leads.fullname AS lead_full_name,
leads.phone_number_primary AS lead_phone_number_primary,
leads.citizen_identification AS lead_citizen_identification

FROM leads
LEFT JOIN users ON leads.ro_name = users.id
LEFT JOIN data_sources ON leads.data_sources = data_sources.id
LEFT JOIN lead_status ON leads.lead_status = lead_status.id
LEFT JOIN sale_stage ON leads.sale_stage = sale_stage.id
LEFT JOIN campaign ON leads.campaign = campaign.id
LEFT JOIN owned_branch ON leads.owned_branch = owned_branch.id
WHERE leads.deleted = 0";

if (!empty($data_source)) {
    $query_campaign .= " AND leads.data_sources = '{$data_source}'";
}

if (!empty($campaign)) {
    $query_campaign .= " AND leads.campaign = '{$campaign}'";
}

if (!empty($branch)) {
    $query_campaign .= " AND leads.owned_branch = {$branch}";
}

if (!empty($user)) {
    $query_campaign .= " AND leads.ro_name = {$user}";
}

$query_campaign .= " LIMIT $per_page OFFSET $offset";

$result_campaign = $GLOBALS['db']->query($query_campaign);
while ($rows = $GLOBALS['db']->fetchByAssoc($result_campaign)) {
    $fullname = $rows['lead_full_name'];
    $phone_number_primary = $rows['lead_phone_number_primary'];
    $citizen_identification = $rows['lead_citizen_identification'];
    $data_source_name = $rows['data_source_name'];
    $owned_branch_name = $rows['owned_branch_name'];
    $lead_ro_name = $rows['user_name'];
    $lead_sale_stage = $rows['sale_stage_name'];
    $lead_lead_status = $rows['lead_status_name'];
    $campaign_name = $rows['campaign_name'];


    $html_row_table .= sprintf("
                         <tr>
                                <td scope='row'>{$index}</td>
                                <td scope='row'>{$fullname}</td>
                                <td scope='row'>{$phone_number_primary}</td>
                                <td scope='row'>{$citizen_identification}</td>
                                <td scope='row'>{$data_source_name}</td>
                                <td scope='row'>{$owned_branch_name}</td>
                                <td scope='row'>{$lead_ro_name}</td>
                                <td scope='row'>{$campaign_name}</td>
                                <td scope='row'>{$lead_sale_stage}</td>
                                <td scope='row'>{$lead_lead_status}</td>
                        </tr>
    ");
    $index += 1;
    
}

if ($html_row_table == "") {
    $html_row_table = "
     <tr>
            <td scope='row'>No found data</td>
    </tr>";
}

echo $html_row_table;
