<?php
    include ("./dao/asd.php");
    include ("./dao/db.class.php");
    //也可以写成include("./db.class.php")/include("../db.class.php")
    //$s=$_POST['number'];
    //造一个对象
    $db = new db();
    $sql="select * from ".$msg;
    
    $result = $db->query($sql);
    
    $asdw=new asd();
    $qwe=$asdw->asdq();

?>

