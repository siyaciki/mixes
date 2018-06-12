<?php
namespace Home\Controller;
use Think\Controller;
class CommonController extends Controller {
    public function _initialize(){
        if(IS_POST){
            $username   = I('post.username');
            $login_time = I('post.login_time');
            $mac        = I('post.mac');
            $token      = I('post.token');
            $token_chk  = md5($username.$mac.substr(3,time()));
            if($token === $token_chk){
                //查询username 对应的id
                $crew_info = D('CrewInfo');
                $id_num = $crew_info->user_sel_id($username);
                //查询数据库进行比对
                $crew_login = M('crew_login');
                $where['crew_id']       = $id_num;
                $where['device_seral']  = $mac;
                $where['login_time']    = $login_time;
                $where['token']         = $token;
                $chk_res = $crew_login->where($where)->field('id')->find();
                if(!$chk_res){
                    returnjson(array(2,"请重新登录"));
                }
            }else{
                returnjson(array(2,"请重新登录"));
            }
        }else{
            returnjson(array(2,"您已退出登录，请重新登录后进行操作。"));
        }
    }
}