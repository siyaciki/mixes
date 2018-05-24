<?php

    include ("./dao/db.class.php");
    //也可以写成include("./db.class.php")/include("../db.class.php")
    //$s=$_POST['number'];
    //造一个对象
    $db = new db();
    $sql="select * from msg";
    $result = $db->query($sql);

    $rows = array();
    while ($row = $result->fetch_assoc()) {
        array_push($rows, $row);
    }
    $json_rows = json_encode($rows, JSON_UNESCAPED_UNICODE);
    //echo $json_rows;
     $showtime=date("Y-m-d H:i:s");
     $time=time();
     echo($showtime);
     echo("<br>");
     echo($time);
     echo("<br>");
     echo(date('Y-m-d H:i:s',$time));
?>

