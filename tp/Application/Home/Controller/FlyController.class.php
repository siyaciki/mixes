<?php
namespace Home\Controller;
use Think\Controller;
class FlyController extends CommonController {
    //飞行状态
    public function index(){
        $arr = array(
            "飞行速度".rand(6000,8000)."KM/H",
            "飞行高度".rand(8000,10000)."M",
            "飞行经度".rand(119,100),
            "飞行纬度".rand(0,32),
            "舱外温度".rand(20,25)."°C"
        );
        returnjson(array(1,'success',$arr));
    }
}