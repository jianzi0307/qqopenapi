<?php
require_once (__DIR__. '/includes/global.inc.php');

$appid = $config['appid'];
$appkey = $config['appkey'];

$server_name = $config['is_sendbox'] ? $config['server_name_sendbox'] : $config['server_name_online'];

$openid = trim($_GET['openid']);
$openkey = trim($_GET['openkey']);
$pf = trim($_GET['pf']);

if ($openid && $openkey && $pf) {
	$sdk = new OpenApiV3($appid, $appkey);
	$sdk->setServerName($server_name);
    if (user_is_login($sdk, $openid, $openkey, $pf)) {

        $redis = new Redis();
        $redis->connect($config['redis.host'], $config['redis.port']);
        if ($redis->exists('user'. $openid)) {
            $userid = $redis->get('user'. $openid);
        } else {
            $user = new User();
            $userInfo = $user::retrieveByField('openid', $openid, SimpleOrm::FETCH_ONE);
            if (!$userInfo) {
                // insert
                $user->platform = $pf;
                $user->openid = $openid;
                $user->createtime = time();
                $user->save();
                $userid = $user->id();
            } else {
                $userid = $userInfo->id;
            }
            //cache
            $redis->set('user'.$openid, $userid);
        }
        $ret = get_user_info($sdk, $openid, $openkey, $pf);
        $platform_login_key = $config['platform_login_key'];
        $time = time();
        $tokenSign = md5($userid.$openid.$time.$platform_login_key);
        $urlQuery = array(
            'userid' => $userid,
            'username' => $openid,
            'time' => $time,
            'sign' => $tokenSign
        );
        $token = base64_encode(json_encode($urlQuery));
        header('Location:http://'.$config['game_server_url'].'/client/?token='. $token . '&'.http_build_query($_GET));
    } else {
        header("Location: " . $config['game_site']);
    }
} else {
	header("Location: " . $config['game_site']);
}

//http://s14.app1105344749.qqopenapp.com/?seqid=8e87dbac19402838e54ee6f66438ae72&openid=8405E15ED54FB03256AB3E59AA90D411&openkey=4748E8F7EBA95479B8A0584EC1BD3AB3&platform=qzone&pf=qzone&serverid=14&pfkey=a33f6636b7c65eda2dff919eb558f4b3&x5sig=Y0QxeGVtOSZjRDF4ZW05dVpTWnNQU1p5UFNacFBTWmtQU1pvUFE9PQ==&s=0.8347021826385557&
