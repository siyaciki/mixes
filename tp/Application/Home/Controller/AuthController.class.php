<?php
namespace Home\Controller;
use Think\Controller;
class AuthController extends Controller {
    public function login(){
        //先获取航班号
        $flight_id="A11102";
        if(IS_POST){
            $time = time();
            $username = I('POST.username'); #用户名
            $password = I('POST.password'); #密码
            $mac      = I('POST.mac');      #mac地址
            if(empty($username) || empty($password) || empty($mac)){
                returnjson(array(2,'请输入账号密码！'));
            }
            $crew_info = M('crew_info');
            $where['name']      = $username;
            $where['password']  = md5($password);
            $chk_res = $crew_info->where($where)->field('id')->find();
            if($chk_res){
                //生成token
                $token = md5($username.$mac.substr(3,$time));
                //检测登录表中是否存在该条记录
                $crew_login = M('crew_login');
                $where_chk['crew_id'] = $chk_res['id'];
                $crew_login_chk = $crew_login->where($where_chk)->find();
                $add_data = array(
                    'crew_id'       => $chk_res['id'],
                    'device_seral'  => $mac,
                    'login_time'    => $time,
                    'token'         => $token,
                );
                if(!empty($crew_login_chk)){
                    //更新记录
                    $where_save['crew'] = $chk_res['id'];
                    $add_res = $crew_login->where($where_save)->save($add_data);
                }else{
                    //插入记录
                    $add_res = $crew_login->add($add_data);
                }
                if(!$add_res){
                    returnjson(array(2,'登录失败1'));
                }
                $return_data = array(
                    'username'       => $username,
                    'mac'           => $mac,
                    'login_time'    => $time,
                    'token'         => $token,
                    'flight_id'     =>$flight_id,
                );
                returnjson(array(1,'登录成功',$return_data));

            }else{
                returnjson(array(2,'登录失败2'));
            }
        }else{
            returnjson(array(3,'校验失败3'));
        }
    }

    public function outlogin(){
        define("success", "成功");
        define("error", "失败");
        define("out", "注销");
        if(IS_POST){
            $username = I('post.username');
            if(empty($username)){
                returnjson(array(2,out.error));
            }
            //查询username 对应的id
            $crew_info = D('CrewInfo');
            $id_num = $crew_info->user_sel_id($username);
            //删除表中的登录记录
            $crew_login = M('crew_login');
            $where_chk['crew_id'] = $id_num;
            $del_res = $crew_login->where($where_chk)->delete();
            if($del_res){
                returnjson(array(1,out.success));
            }else{
                returnjson(array(2,out.error));
            }
        }else{
            returnjson(array(2,out.error));
        }
    }
}