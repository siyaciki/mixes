<?php
include ("./dao/db.class.php");
    
//也可以写成include("./db.class.php")/include("../db.class.php")
//$s=$_POST['number'];
//造一个对象
$db = new db();

 //数据库中有哪些表
$result = $db->query('SHOW TABLES');//执行查询语句
$tables=array();
 //将这些表记录到一个数组
while($arr = $result->fetch_assoc()){
    $tables[]=$arr;//遍历查询结果
}
//释放结果集
$result->close();
//输出数组内容
//print_r($tables);
//$tables_json=json_encode($tables); 
//创建sql文件，w只写文件
$myfile = fopen("newfile.sql", "w") or die("Unable to open file!");
//添加字符串到文件文本中
$txt = "/*\r\nSQLyog Ultimate v12.08 (64 bit)
    \r\nMySQL - 5.7.20-0ubuntu0.17.04.1 : Database - iWO_test
    \r\n*********************************************************************
    \r\n*/
/*!40101 SET NAMES utf8 */;
/*!40101 SET SQL_MODE=''*/;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;";
fwrite($myfile, $txt);

 //将每个表的表结构导出到文件
 foreach($tables as $val){
     print_r($val);
     //获取表名
    $str=$val['Tables_in_iwo_test'];
  $sql = "show create table ".$str;
  $res = $db->query($sql);
  //获取查询结果的数字下标数组
  $row = $res->fetch_array(MYSQLI_NUM);
 
 // print_r($row);
 // echo($row[1]);
    echo("----数据表{$str}创建中---<br>");
  $info = "\t\n";
  $info .= "-- Table structure for '".$str."'\t\n";
  $info .= "-- ----------------------------\t\n";
  $info .= "DROP TABLE IF EXISTS '".$str."';\t\n";
  $sqlStr = $info.$row[1].";\t\n";
  //追加到文件
  fwrite($myfile, $sqlStr);
//  //释放资源
//  fclose($myfile);
  //释放结果集
  $res->close();
  echo("----数据表{$str}创建完成---<br>");
 }

 //---------------------------将每个表的数据导出到文件---------------------------------
 foreach($tables as $val){
     //获取表名
     $str=$val['Tables_in_iwo_test'];
     $sql = "select * from ".$str;
     $res = $db->query($sql);
     //查询结果条数
     $nums=$res->num_rows;
     //表字段个数
     $counts=$res->field_count;
     //输出res结构
     //print_r($res);
     //如果表中没有数据，则继续下一张表
     if($nums<1){
         echo("----数据表{$str}----空表-----<br>");
          continue;
     }
     echo("----数据表{$str}数据创建中---<br>");
     //
  $info = "\r\n";
  $info .= "---- Data for the table '".$str."'----\r\n";
  $info .= "\r\n";
  //写入注释
  fwrite($myfile,$info);
  //属性值拼接字符串
  $value_str="";
  //字段属性初始数组
  $axs=[];
        // 获取查询结果的关联数组,队列取每一条结果
        while($rows = $res->fetch_array(MYSQLI_ASSOC))
        {
            //将关联数列遍历
            foreach($rows as $x=>$x_value){
                //属性值 字符串连接
                $value_str.="'".$x_value."',";
                //字段数组赋值
                $axs[]=$x;

            }         
        
         //属性值 去掉最后一个逗号
        $value_str = substr($value_str,0,strlen($value_str)-1);
        $value_str=$value_str."),(";
        }
        //字段数组截取长度为字段数
       $key_array=array_slice($axs, 0, $counts);
       //字段数组转字符串，中间','分割字段名
       $key_str= implode("','", $key_array);
       
       //属性值字符串 去掉末尾 ,( 两字符
       $value_str = substr($value_str,0,strlen($value_str)-2);
       
       //插入语句字符串拼接
       $sqlStr="insert into '".$str."'('".$key_str."') values (".$value_str.";\r\n";
       //sql语句写入文件中
       fwrite($myfile, $sqlStr);
       echo("----数据表{$str}数据创建完成---<br>");   

       
       
       

       

         


  //释放结果集
  $res->close();

 }
 fwrite($myfile,"\r\n/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;");
   //释放资源
  fclose($myfile);

 $db->close();
 echo "写入完成！";
 
?>
