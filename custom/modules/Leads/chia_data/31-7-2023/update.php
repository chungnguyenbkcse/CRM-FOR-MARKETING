<?php
global $db;

$query = "SELECT phone_number_primary FROM leads WHERE deleted = 0 GROUP BY phone_number_primary HAVING COUNT(*) > 1";
$result = $db->query($query);
$duplicatedPhones = [];
while ($row = $db->fetchByAssoc($result)) {
    $duplicatedPhones[] = $row['phone_number_primary'];
}

$priorityStages = ['7', '5'];
$prioritySources = ['4', '2', '7', '1', '3', '6', '8'];


foreach($duplicatedPhones as $phone){
    $query = "SELECT id, sale_stage, data_sources FROM leads WHERE phone_number_primary = '{$phone}' AND deleted = 0";
    $result = $db->query($query);
    $leads = [];
    while ($row = $db->fetchByAssoc($result)) {
        $leads[$row['id']] = ['sale_stage' => $row['sale_stage'], 'data_sources' => $row['data_sources']];
    }

    foreach($priorityStages as $priorityStage){
        $stageLeads = array_filter($leads, function($lead) use ($priorityStage, $prioritySources) {
            return $lead['sale_stage'] === $priorityStage && in_array($lead['data_sources'], $prioritySources);
        });

        if(count($stageLeads) > 0){
            // If more than one priority lead, keep one random
            if(count($stageLeads) > 1){
                $randomKey = array_rand($stageLeads);
                $stageLeads = [$randomKey => $stageLeads[$randomKey]];
            }

            $leadsToDelete = array_diff_key($leads, $stageLeads);
            // "Delete" leads by setting deleted to 1
            foreach($leadsToDelete as $leadId => $leadData){
                $query = "UPDATE leads SET deleted = 1 WHERE id = '{$leadId}'";
                $db->query($query);
            }
            // Exit the loop because we found leads with the priority stage
            break;
        }
    }

    // If there are no priority leads, keep one random lead
    if(empty($stageLeads)){
        $randomKey = array_rand($leads);
        unset($leads[$randomKey]);
        $leadsToDelete = $leads;
        // "Delete" leads by setting deleted to 1
        foreach($leadsToDelete as $leadId => $leadData){
            $query = "UPDATE leads SET deleted = 1 WHERE id = '{$leadId}'";
            $db->query($query);
        }
    }
}
