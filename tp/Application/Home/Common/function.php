<?php

# dis   : 函数库
# auther: gaoyang
# time  : 180608

// name     : returnjson
// parameter: code['返回状态码']  msg['返回提示文字'] data['返回数据']
// auther   : gaoyang

function returnjson($arr_data){
    $arr = array(
        'code' => $arr_data['0'],
        'msg'  => $arr_data['1'],
        'data' => $arr_data['2']
    );
    if(!isset($arr_data['2'])){
        unset($arr['data']);
    }
    if(!isset($arr_data['1'])){
        unset($arr['msg']);
    }
    echo json_encode($arr);exit;
}