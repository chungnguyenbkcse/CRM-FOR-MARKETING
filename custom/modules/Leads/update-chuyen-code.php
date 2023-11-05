<?php
$data_source = isset($_GET['data_source']) ? $_GET['data_source'] : '';
$campaign = isset($_GET['campain']) ? $_GET['campain'] : '';
$branch = isset($_GET['branch']) ? $_GET['branch'] : '';
$user = isset($_GET['user']) ? $_GET['user'] : '';

$data_source_dk = isset($_GET['data_source_dk']) ? $_GET['data_source_dk'] : '';
$campaign_dk = isset($_GET['campain_dk']) ? $_GET['campain_dk'] : '';
$branch_dk = isset($_GET['branch_dk']) ? $_GET['branch_dk'] : '';
$user_dk = isset($_GET['user_dk']) ? $_GET['user_dk'] : '';

$query_campaign = "";

if (!empty($data_source)) {
    if ($query_campaign == "") {
        $query_campaign = "UPDATE leads SET data_sources = '{$data_source}'";
    }
}

if (!empty($campaign)) {
    if ($query_campaign == "") {
        $query_campaign .= "UPDATE leads SET campaign = '{$campaign}'";
    } else {
        $query_campaign .= ", campaign = '{$campaign}'";
    }
}

if (!empty($branch)) {
    if ($query_campaign == "") {
        $query_campaign .= "UPDATE leads SET owned_branch = '{$branch}'";
    } else {
        $query_campaign .= ", owned_branch = '{$branch}'";
    }
}

if (!empty($user)) {
    if ($query_campaign == "") {
        $query_campaign .= "UPDATE leads SET ro_name = '{$user}'";
    } else {
        $query_campaign .= ", ro_name = '{$user}'";
    }
}


$query_campaign_dk = "";
if (!empty($data_source_dk)) {
    if ($query_campaign_dk == "") {
        $query_campaign_dk .= " WHERE data_sources = '{$data_source_dk}'";
    }
}

if (!empty($campaign_dk)) {
    if ($query_campaign_dk == "") {
        $query_campaign_dk .= " WHERE campaign = '{$campaign_dk}'";
    } else {
        $query_campaign_dk .= ", campaign = '{$campaign_dk}'";
    }
}

if (!empty($branch_dk)) {
    if ($query_campaign_dk == "") {
        $query_campaign_dk .= " WHERE owned_branch = '{$branch_dk}'";
    } else {
        $query_campaign_dk .= ", owned_branch = '{$branch}'";
    }
}

if (!empty($user_dk)) {
    if ($query_campaign_dk == "") {
        $query_campaign_dk .= " WHERE ro_name = '{$user_dk}'";
    } else {
        $query_campaign_dk .= ", ro_name = '{$user_dk}'";
    }
}

$query_campaign .= $query_campaign_dk;
$GLOBALS['db']->query($query_campaign);

echo ($query_campaign);
