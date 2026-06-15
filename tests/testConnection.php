<?php 

require_once('includes/greatManufacturerDB.php');

if ($dbc) {
    echo "database connection successful";
}
else {
    echo "database connection failed";
}

?>