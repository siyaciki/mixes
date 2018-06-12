<?php

//接收post数据
$yonghuming=$_POST['username'];
$mima= md5($_POST['password']);
//$device_seral=$_POST['device_seral'];
include ("./dao/db.class.php");
   
$db = new db();
//mysqli_set_charset($conn2,"utf8");
$sql = "SELECT * FROM ".$crew_info." where name='".$yonghuming."' and password='".$mima."'";
//$sql = "SELECT * FROM ".$crew_info;
$result = $db->query($sql);

if($result->num_rows)
{
    $device_seral="asd";
    $time=time();
    $token= md5($yonghuming.$device_seral).$time;
    //创建token
    $sql2="INSERT INTO ".$crew_login."(crew_id,device_seral,login_time,token) VALUES('$yonghuming','$device_seral','$time','$token')";
    $result2 = $db->query($sql);
    $corns_marks=array('user_id' =>$yonghuming, 'user_token' =>$token);
    echo(json_encode($corns_marks));
}



//$rows=array();
//echo(gettype($result));
//while ( $row = $result->fetch_object() ){
//    echo " name:" . $row->name . " password:" . md5($row->password). "<br/>"; 
//    array_push($rows, $row);
//}
//echo("<br>------------<br>");
//var_dump($rows);
//echo("<br>----------<br>");
//echo(json_encode($rows));
// $rows1 = json_encode($rows);
//print_r($rows1);
//echo("<br>----22222222--<br>");
//
//$rows2=array();
//$result1=$conn->query ( $sql );  
//while ( $row = $result1->fetch_array() ) {  
//    echo "id:" . $row[0] . " name:" . $row[1] . " password:" . $row[2] . "<br/>";  
//   array_push($rows2, $row);
//}  
//var_dump($rows2);
//echo("<br>----------<br>");
//print_r($rows2);
//echo("<br>----------------<br>");
//print_r(json_encode($rows2));
////
//echo("<br>----33333--------<br>");
//$rows3=array();
//$result2=$conn->query ( $sql );  
//while ( $row = $result2->fetch_assoc() ) {  
//  
//    echo "id:" . $row ["id"] . " name:" . $row ["name"] . " password:" . $row ["password"] . "<br/>";  
//    array_push($rows3, $row);
//} 
//print_r($rows3);
////php 5.4版本以上的新功能,关键字JSON_UNESCAPED_UNICODE即Json不要编码Unicode.
//print_r(json_encode($rows3,JSON_UNESCAPED_UNICODE));
?>
