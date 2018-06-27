<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of asd
 *
 * @author siyaciki
 */
class asd {
    //put your code here 
    public function asdq($result){
    $rows = array();
    while ($row = $result->fetch_assoc()) {
        array_push($rows, $row);
    }
    $json_rows = json_encode($rows, JSON_UNESCAPED_UNICODE);
    return $json_rows;
    }
}
