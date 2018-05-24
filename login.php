<?php

//接收post数据
//$yonghuming=$_POST['username'];
//$mima=$_POST['password'];
$servername = "192.168.1.112";
$username = "admin";
$password = "admin123";
$dbname = "iWO_test";
$charset = "utf8";
$conn = new mysqli($servername, $username, $password, $dbname);
// 检测连接
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

//mysqli_set_charset($conn2,"utf8");
$sql = "SELECT id,name,password FROM user_info";
//$sql = "SELECT * FROM login_test";
$result = $conn->query($sql);
$rows=array();
//echo(gettype($result));
while ( $row = $result->fetch_object() ){
    //echo "id:" . $row->id . " name:" . $row->name . " password:" . $row->password . "<br/>"; 
    array_push($rows, $row);
}
//echo("<br>------------<br>");
//var_dump($rows);
//echo("<br>----------<br>");
echo(json_encode($rows));
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
