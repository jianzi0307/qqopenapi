<?php

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
