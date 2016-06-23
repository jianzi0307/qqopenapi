<?php
/**
 * 删除数组中的特定元素
 * @param $arr
 * @param $offset
 */
function array_remove(&$arr, $offset)
{
    array_splice($arr, $offset, 1);
}

/**
 * 刷新用户的元宝
 * @param $host
 * @param $port
 * @param $name
 * @param $password
 * @param $uid
 */
function sock_refresh_balance($host, $port, $name, $password, $uid)
{
    $client = new swoole_client(SWOOLE_SOCK_TCP);
    if (!$client->connect($host, $port, -1)) {
        //exit("connect failed. Error: {$client->errCode}\n");
        \SeasLog::info("swoole client connect failed. Error: " .$host." - ".$port. " errorCode:{$client->errCode}\n");
        return;
    }
    $client->send("LOGIN name=".$name." password=".$password."\r\n");
    $res = $client->recv();
    $client->send("refreshbalance uid=".$uid."\r\n");
    $res .= $client->recv();
    $client->send("Quit");
    $res .= $client->recv();
    \SeasLog::info("|".$host.":".$port ."| =================sock response:::: \r\n" . $res);
    $client->close();
}

/**
 * 当前用户ip地址
 * @return string
 */
function get_ip()
{
    $onlineip='';
    if(getenv('HTTP_CLIENT_IP')&&strcasecmp(getenv('HTTP_CLIENT_IP'),'unknown')){
        $onlineip=getenv('HTTP_CLIENT_IP');
    } elseif(getenv('HTTP_X_FORWARDED_FOR')&&strcasecmp(getenv('HTTP_X_FORWARDED_FOR'),'unknown')){
        $onlineip=getenv('HTTP_X_FORWARDED_FOR');
    } elseif(getenv('REMOTE_ADDR')&&strcasecmp(getenv('REMOTE_ADDR'),'unknown')){
        $onlineip=getenv('REMOTE_ADDR');
    } elseif(isset($_SERVER['REMOTE_ADDR'])&&$_SERVER['REMOTE_ADDR']&&strcasecmp($_SERVER['REMOTE_ADDR'],'unknown')){
        $onlineip=$_SERVER['REMOTE_ADDR'];
    }
    return $onlineip;
}

/**
 * @param object $sdk OpenApiV3 Object
 * @param string $openid openid
 * @param string $openkey openkey
 * @param string $pf 平台
 * @return array
 */
function get_user_info($sdk, $openid, $openkey, $pf)
{
	$params = array(
		'openid' => $openid,
		'openkey' => $openkey,
		'pf' => $pf,
	);
	
	$script_name = '/v3/user/get_info';
	return $sdk->api($script_name, $params,'post', 'https');
}

/**
 * 验证登录用户是否黄钻，是否年费黄钻，如果是则返回其黄钻等级等信息。
 * @param $sdk
 * @param $openid
 * @param $openkey
 * @param $pf
 * @return mixed
 */
function is_vip($sdk, $openid, $openkey, $pf)
{
    $params = array(
        'openid' => $openid,
        'openkey' => $openkey,
        'pf' => $pf,
    );

    $script_name = '/v3/user/is_vip';
    return $sdk->api($script_name, $params,'post', 'https');
}

/**
 * 用户是否已登录
 * @param $sdk
 * @param $openid
 * @param $openkey
 * @param $pf
 * @return mixed
 */
function user_is_login($sdk, $openid, $openkey, $pf)
{
    $params = array(
        'openid' => $openid,
        'openkey' => $openkey,
        'pf' => $pf,
    );

    $script_name = 'v3/user/is_login';
    return $sdk->api($script_name, $params, 'post', 'https');
}

/**
 * 支付
 * @param $sdk
 * @param $openid
 * @param $openkey
 * @param $pf
 * @param $data
 * @return mixed
 */
function pay_buy($sdk, $openid, $openkey, $pf, $data)
{
    $params = array(
        'openid' => $openid,
        'openkey' => $openkey,
        'pf' => $pf
    );
    $reqData = array_merge($params, $data);
    $script_name = '/v3/pay/buy_goods';
    return $sdk->api($script_name, $reqData, 'post', 'https');
}

/**
 * 通知支付结果
 * @param $sdk
 * @param $openid
 * @param $openkey
 * @param $pf
 * @param $data
 */
function confirm_delivery($sdk, $openid, $openkey, $pf, $data)
{
    $params = array(
        'openid' => $openid,
        'openkey' => $openkey,
        'pf' => $pf
    );
    $reqData = array_merge($params, $data);
    $script_name = '/v3/pay/confirm_delivery';
    return $sdk->api($script_name, $reqData, 'post', 'https');
}
