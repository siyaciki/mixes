<?php
namespace Home\Controller;
use Think\Controller;
class MsgController extends CommonController {
    //获取消息推送
    public function index(){
        $msg_push = M('msg_push');
        $result=$msg_push->select();
        returnjson(array(1,"查询成功",$result));
    }
    //添加消息推送
    public function addMsg(){
        $title  = I('post.title');
        $content  = I('post.content');
        $flight_id=I('flight_id');
        $time  = I('post.time');
        $crew_id  = I('post.crew_id');
        
        $msg_push = M('msg_push');
        $data['title'] = $title;
        $data['content'] = $content;
        $data['flight_id'] = $flight_id;
        $data['time'] = $time;
        $data['crew_id'] = $crew_id;
        
        $result=$msg_push->add($data);
        if($result){
            returnjson(array(1,"添加成功",$result));
        }
        else{
            returnjson(array(1,"添加失败")); 
        }
    }
    
}