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

    private $servername = "192.168.1.112";
    private $username = "admin";
    private $password = "admin123";
    private $dbname = "iWO_test";
    private $charset="utf8";
    private $conn;
    
    public function db(){
        $this->conn = new mysqli($this->servername,$this->username,$this->password,$this->dbname);
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
