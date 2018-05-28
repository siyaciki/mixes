<?php

include ("./dao/db.class.php");
$db = new db();

class msg_class
{
    //查看推送消息
    public function get_msg(){

    $sql="select * from msg";
    $result = $db->query($sql);

    $rows = array();
    while ($row = $result->fetch_assoc()) {
        array_push($rows, $row);
    }
    $json_rows = json_encode($rows, JSON_UNESCAPED_UNICODE);
    echo $json_rows;

    }
    //添加推送消息数据,参数:内容、发布者
    public function add_msg($str,$userinfo){
        
     //互获取当前时间戳
     $time=time();
     

    }
    
}