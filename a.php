<?php
    include ("./dao/db.class.php");
    
//也可以写成include("./db.class.php")/include("../db.class.php")
//$s=$_POST['number'];
//造一个对象
$db = new db();
$sql = "select * from login_test";
$result=$db->Query($sql);
//print_r($result);
$nums=$result->num_rows;
$number=array(array('username'=>"tom","password"=>"123456","age"=>$nums),array('username'=>"cat","password"=>"123456","age"=>$nums),array('username'=>"sad","password"=>"123456","age"=>$nums));
$number2=array('username'=>"tom","password"=>"123456","age"=>$nums);
echo(json_encode($number2));

?>

