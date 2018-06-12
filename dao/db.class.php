<?php
header("Content-type:text/html;charset=utf-8");
header("Access-Control-Allow-Origin: *");   
header("Access-Control-Allow-Methods: GET, POST");   
header("Access-Control-Allow-Headers: Origin, No-Cache, X-Requested-With, If-Modified-Since, Pragma, Last-Modified, Cache-Control, Expires, Content-Type, X-E4M-With");
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of dbClass
 *
 * @author siyaciki
 */
class db {
    //put your code here

    private $servername = "192.168.1.35";
    private $username = "root";
    private $password = "";
    private $dbname = "iwo_test";
    private $charset="utf8";
    private $port="3305";
    private $conn;
    
    public function db(){
        $this->conn = new mysqli($this->servername,$this->username,$this->password,$this->dbname);
        $this->conn->query("set names utf8");
        // 检测连接
        if(!$this->conn) {
            die("Connection failed: " . mysqli_connect_error());
        }
       
    }

    
    //成员方法   两个参数：sql语句，判断返回1查询或是增删改的返回
    public function query($sql)
    {        
        $r = $this->conn->query($sql);
        return $r;
    }
    public function queryAdd($sql)
    {
        $r=$this->conn->query($sql);
    }
    public function close(){
        $this->conn->close();
    }

}

//服务器地址连接表
$connection_list="connection_list";
//设备授权表
$crew_device="crew_device";
//乘务信息表
$crew_info="crew_info";
//乘务登录表
$crew_login="crew_login";
//目的地信息表
$destination_info="destination_info";
//事件记录表
$event_record="event_record";
//飞行调度表
$flight_despatch="flight_despatch";
//航班信息表
$flight_info="flight_info";
//推送消息表
$msg="msg";
//乘客信息表
$passenger_info="passenger_info";
//乘客公告表
$passenger_notice="passenger_notice";
//乘客请求表
$passenger_request="passenger_request";
//执行脚本表
$script_exec="script_exec";
