<?php
header("Content-type:text/html;charset=utf-8");
header("Access-Control-Allow-Origin: *");   
header("Access-Control-Allow-Methods: GET, POST");   
header("Access-Control-Allow-Headers: Origin, No-Cache, X-Requested-With, If-Modified-Since, Pragma, Last-Modified, Cache-Control, Expires, Content-Type, X-E4M-With");   
    
include ("./dao/db.class.php");


    //造一个对象
    $db = new db();
    $sql="insert into login_test(username,password,session_id)values('asd','111111',7)";

    $dbsql=$db->Query($sql,2);
    if($dbsql==True)
    {
        echo("true");
    }

echo('ad');
?>
