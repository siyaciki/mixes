<?php

    include ("./dao/db.class.php");
    //也可以写成include("./db.class.php")/include("../db.class.php")
    //$s=$_POST['number'];
    //造一个对象
    $db = new db();
    $sql="select * from ground_notice";
    $num=count($db->Query($sql));
    $number=array('number'=>$num);
    echo(json_encode($number));
?>

