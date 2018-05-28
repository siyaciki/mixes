<?php

    include ("./dao/db.class.php");
    //也可以写成include("./db.class.php")/include("../db.class.php")
//    $title=$_POST['title'];
//    $content=$_POST['content'];
//    $time=$_POST['time'];
//    $name=$_POST['name'];
        $title="asd";
    $content="asd";
    $time="asd";
    $name="asd";
    //造一个对象
    $db = new db();
    $sql="INSERT INTO msg (title,content,TIME,NAME) VALUES('$title','$content','$time','$name')";
    $result = $db->query($sql);
   $json_result = json_encode($result);
    echo $json_result;
?>