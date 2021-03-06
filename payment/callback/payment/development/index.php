<?php
require_once (__DIR__ . '/../../../../includes/global.inc.php');

\SeasLog::info("[ BEGIN ]==========================> DEVELOPMENT");
\SeasLog::info("request::::: " . json_encode($_REQUEST));

$appid = $config['appid'];
$appkey = $config['appkey'];

//amttype
$request_method = $_SERVER['REQUEST_METHOD'];
$url_path = $_SERVER["REQUEST_URI"];
$request_string = $_SERVER["QUERY_STRING"];

//注意，这里以0.1Q点为单位。即如果总金额为18Q点，则这里显示的数字是180。
$amt = $_GET['amt'];
$openid = trim($_GET['openid']);
$appid = trim($_GET['appid']);
$billno = trim($_GET['billno']);
$payamt_coins = trim($_GET['payamt_coins']);
$paychannel = trim($_GET['paychannel']);
$paychannelsubid = trim($_GET['paychannelsubid']);
$payitem = trim($_GET['payitem']);
$providetype = trim($_GET['providetype']);
$pubacct_payamt_coins = trim($_GET['pubacct_payamt_coins']);
$token = trim($_GET['token']);
$ts = trim($_GET['ts']);
$sig = trim($_GET['sig']);

$url_path = explode('?', $url_path);
$chkSig = SnsSigCheck::verifySig($request_method, $url_path[0], $_GET, $appkey.'&', $sig);
if ($chkSig) {
    //元宝兑换
    $cashLogs = new CashLogs();
    $cashLogInfo = CashLogs::sql("select * from ".$config['db.tbpre']."cash_logs where token = '". $token ."' and status = 0 " );
    if ($cashLogInfo) {
        //根据token获取到当前重置的服务器
        $serverId = $cashLogInfo[0]->serverid;
        $Qd = $cashLogInfo[0]->gold;

        //$res = CashLogs::sql("update ". $config['db.tbpre'] . "cash_logs set `orderno` = '".$billno."' , `paytime` = ".time().", `status` = 1 where token='" . $token ."'");
        $cashLogInfo[0]->orderno = $billno;
        $cashLogInfo[0]->paytime = time();
        $cashLogInfo[0]->payitem = $payitem;
        $cashLogInfo[0]->payamt_coins = $payamt_coins;
        $cashLogInfo[0]->status = 1;
        $cashLogInfo[0]->update();

        $cash = new Cash();
        $cashInfo = Cash::sql("select * from ". $config['db.tbpre']."cash where `userid` = '".$openid."' and `serverid` = ". $serverId);

        if ($cashInfo) {
            //$cashInfo[0]->userid = $openid;

            $cashInfo[0]->goldtotal = $cashInfo[0]->goldtotal + $Qd;
            $cashInfo[0]->extratotal = $cashInfo[0]->extratotal + $Qd;
            $cashInfo[0]->rmbtotal = $cashInfo[0]->rmbtotal + (($amt / 10) / $config['pay.rate']);
            $cashInfo[0]->updatetime = time();
            $cashInfo[0]->update();
        } else {
            $cash->userid = $openid;
            $cash->serverid = $serverId;
            $cash->goldtotal = $Qd;
            $cash->extratotal = $cash->goldtotal;
            $cash->rmbtotal = ($amt / 10) / $config['pay.rate'];
            $cash->createtime = time();
            $cash->save();
        }
        $resJson = json_encode(array("ret"=>0, "msg"=>"OK"));
        \SeasLog::info("versifySig::::: ok. " . $resJson);


        //通过openid获取用户uid，发给服务器，调用refresh balance
        $redis = new Redis();
        $redis->connect($config['redis.host'], $config['redis.port']);
        if ($redis->exists('user'. $openid)) {
            $userid = $redis->get('user'. $openid);
        } else {
            $user = new User();
            $userInfo = $user::retrieveByField('openid', $openid, SimpleOrm::FETCH_ONE);
            $userid = $userInfo->id;
            $redis->set('user'.$openid, $userid);
        }
        //发socket到游戏服务器刷新
        sock_refresh_balance($config['sock_host'], $config['sock_port'][intval($serverId)], $config['sock_user'], $config['sock_password'], $userid);

    } else {
        $resJson = json_encode(array("ret"=>3, "msg"=>"token不存在"));
        \SeasLog::info("versifySig::::: failed. " . $resJson);
    }
} else {
    $resJson = json_encode(array("ret"=>4, "msg"=>"请求参数错误"));
    \SeasLog::info("versifySig::::: failed. " . $resJson);
}
echo $resJson;
\SeasLog::info("[  END  ]<============================");