<?php

    include ("./dao/db.class.php");
    //也可以写成include("./db.class.php")/include("../db.class.php")
    $title=$_POST['title'];
    $content=$_POST['content'];
    $time=$_POST['time'];
    $name=$_POST['name'];
    //造一个对象
    $db = new db();
    $sql="INSERT INTO msg (title,CONTENT,TIME,NAME) VALUES('$title','$content','$time','$name')";
    $result = $db->query($sql);
    $result_json=json_encode($result);
    echo($result_json);
?>