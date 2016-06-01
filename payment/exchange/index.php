<?php
//兑换金币
require_once (__DIR__ . '/../../includes/global.inc.php');

$raw_post_data = file_get_contents("php://input");



\SeasLog::info("=========================[ EXCHANGE ]=========================");

\SeasLog::info("php://input:: " . $raw_post_data);

if ($raw_post_data) {
    $requestBody = json_decode($raw_post_data, true);
    $serverid = trim($requestBody['serverid']);
    $uid = $requestBody['uid'];
    $timestamp = $requestBody['timestamp'];
    $key = $requestBody['sign'];

    $sign = md5($serverid.$uid.$timestamp.$config['platform_exchange_key']);
    if ($sign == $key) {
        $cash = new Cash();
        $goldInfo = Cash::sql("select * from ". $config['db.tbpre']."cash as c, ".$config['db.tbpre']."user as u where c.userid = u.openid and u.id = '".$uid."'" );
        if ($goldInfo) {
            $userCashInfo =  $goldInfo[0];
            $userOpenId = $userCashInfo->userid;
            $userGoldTotal = $userCashInfo->goldtotal;
            \SeasLog::info("userCashInfo:: " . json_encode($userCashInfo) . " goldTotal:". $userGoldTotal);
            if ($userGoldTotal > 0) {
                Cash::sql("update ".$config['db.tbpre']. "cash set `goldtotal` = 0 where `userid` = '". $userOpenId ."'", 3);
//                if ($res) {
                    $jsonObj = json_encode(array('errno'=>0, 'errmsg'=>'ok','data'=>array('uid' => $uid,'gold' => $userGoldTotal)));
                    echo $jsonObj;
//                } else {
//                    $jsonObj = json_encode(array('errno'=>21002, 'errmsg'=>'兑换失败'));
//                    echo $jsonObj;
//                }
            } else {
                $jsonObj = json_encode(array('errno'=>0, 'errmsg'=>'兑换成功','data'=>array('uid' => $uid,'gold' => 0)));
                echo $jsonObj;
            }
        }
    } else {
        $jsonObj = json_encode(array('errno'=>21001, 'errmsg'=>'sign签名失败'));
        echo $jsonObj;
    }
} else {
    $jsonObj = json_encode(array('errno'=>-1, 'errmsg'=>'不允许的请求方法'));
    echo $jsonObj;
}
\SeasLog::info("=========================[ EXCHANGE END ]=====================");