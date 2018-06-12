<?php

include ("./dao/db.class.php");
$db = new db();
$sql = "select * from ".$passenger_request;
$result = $db ->query($sql);

$rows = array();
while($row = $result->fetch_assoc()){
    array_push($rows,$row);
}
$json_rows = json_encode($rows, JSON_UNESCAPED_UNICODE);
echo $json_rows;
?>
