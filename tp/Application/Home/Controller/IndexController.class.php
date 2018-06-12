<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends CommonController {
    public function index(){
        echo('111');
    }
    //圆角标
    public function badges(){
            $passenger_request = M('passenger_request');
            $where['response_status']  = 0;
            $request_nums = $passenger_request->where($where)->count();
            if(!isset($request_nums)){
                returnjson(array(2,'查询失败'));
            }
            
            $msg_push = M('msg_push');
            $msg_num = $msg_push->count();
            if(!isset($msg_num)){
                returnjson(array(2,'查询失败'));
            }
            
            $return_data = array(
                    'request_nums' => $request_nums,
                    'msg_num'  => $msg_num
            );
            returnjson(array(1,'查询成功',$return_data));
    }

    public function flight_info(){
        $flight_info = array(
            "begin_tag"             => 'HET',
            "end_tag"               => 'NKG',
            "begin_add"             => '呼和浩特白 T1',
            "end_add"               => '南京禄口',
            "begin_time"            => '18:10',
            "end_time"              => '20.25',
            "begin_plan_tag"        => '6月6日 18:10',
            "end_plan_tag"          => '6月6日 20:25',
            "begin_Average_time"    => '18:10',
            "end_Average_time"      => '20:25'
        );
        returnjson(array(1,'success',$flight_info));
    }
}