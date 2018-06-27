<?php
header("Content-type:text/html;charset=utf-8");
header("Access-Control-Allow-Origin: *");   
header("Access-Control-Allow-Methods: GET, POST");   
header("Access-Control-Allow-Headers: Origin, No-Cache, X-Requested-With, If-Modified-Since, Pragma, Last-Modified, Cache-Control, Expires, Content-Type, X-E4M-With");

$content=$_POST['order'];
// 指明给谁推送，为空表示向所有在线用户推送
$to_uid = "";
// 推送的url地址，使用自己的服务器地址
$push_api_url = "http://192.168.1.30:2121/";
$post_data = array(
   "type" => "publish",
   "content" => $content,
   "to" => $to_uid, 
);
$ch = curl_init ();
curl_setopt ( $ch, CURLOPT_URL, $push_api_url );
curl_setopt ( $ch, CURLOPT_POST, 1 );
curl_setopt ( $ch, CURLOPT_HEADER, 0 );
curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, 1 );
curl_setopt ( $ch, CURLOPT_POSTFIELDS, $post_data );
curl_setopt ($ch, CURLOPT_HTTPHEADER, array("Expect:"));
$return = curl_exec ( $ch );
curl_close ( $ch );
var_export($return);

