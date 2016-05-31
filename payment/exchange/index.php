<?php
//兑换金币
require_once (__DIR__ . '/../../includes/global.inc.php');

if ($_POST) {
    $serverid = trim($_POST['serverid']);
    $uid = $_POST['uid'];
    $timestamp = $_POST['timestamp'];
    $key = $_POST['sign'];

    $sign = md5($serverid.$uid.$timestamp.$config['platform_exchange_key']);
    if ($sign == $key) {
        $cash = new Cash();
        $goldInfo = Cash::sql("select * from ". $config['db.tbpre']."cash as c , ".$config['db.tbpre']."user as u where c.userid = u.id and u.id=".$uid );
        if ($goldInfo) {
            $userCashInfo =  $goldInfo[0];
            if (floatval($userCashInfo['goldtotal']) > 0) {
                $res = Cash::sql("update ".$config['db.tbpre']. "cash set `goldtotal` = 0 where `userid` = ". $userCashInfo['openid']);
                if ($res) {
                    $jsonObj = json_encode(array('errno'=>0, 'errmsg'=>'ok','data'=>array('uid' => $uid,'gold' => $userCashInfo['goldtotal'])));
                } else {
                    $jsonObj = json_encode(array('errno'=>21002, 'errmsg'=>'兑换失败'));
                }
            } else {
                $jsonObj = json_encode(array('errno'=>0, 'errmsg'=>'兑换成功','data'=>array('uid' => $uid,'gold' => 0)));
            }
        }
    } else {
        $jsonObj = json_encode(array('errno'=>21001, 'errmsg'=>'sign签名失败'));
    }
} else {
    $jsonObj = json_encode(array('errno'=>-1, 'errmsg'=>'不允许的请求方法'));
}

echo $jsonObj;