<?php
    include ("./dao/db.class.php");
    
//也可以写成include("./db.class.php")/include("../db.class.php")
//$s=$_POST['number'];
//造一个对象
$db = new db();
$sql = "select * from guest_request where status=0";
$result=$db->Query($sql);
//print_r($result);
$nums=$result->num_rows;
$db->close();

$db2 = new db();
$sql2 = "select * from msg";
$result2=$db2->Query($sql2);
//print_r($result);
$nums2=$result2->num_rows;

$corns_marks=array('ask_marks' =>$nums, 'msg_marks' =>$nums2);
echo(json_encode($corns_marks));

?>

