<?php

$query = "UPDATE leads
SET owned_branch = (
    SELECT branch_id
    FROM branch_ro
    WHERE user_id = leads.ro_name
)";
$GLOBALS['db']->query($query);

echo "thanh cong";


