<?php
//=================================================================
//                              OpenApiV3
// app server -> pay server ----------------->  qq openapi server
//=================================================================

require_once (__DIR__ . '/../includes/global.inc.php');

$appid = $config['appid'];
$appkey = $config['appkey'];
$server_name = $config['server_name'];

//amttype
$pfkey = trim($_GET['pfkey']);
$openid = trim($_GET['openid']);
$serverid = trim($_GET['serverid']);
$openkey = trim($_GET['openkey']);
$pf = trim($_GET['pf']);

$amt = 1000;///$_GET['amt'];
$payitem = '5*1000*1';//$_GET['payitem'];
$goodsmeta = "1000元宝*1000元宝";//$_GET['goodsmeta'];
$goodsurl = "http://cdn.xyzml.752g.com/payment/yb1000.png";//$_GET['goodsurl'];

$sdk = new OpenApiV3($appid, $appkey);
$sdk->setServerName($server_name);

$data = array(
    'amt' => $amt,
    'payitem' => $payitem,
    'goodsmeta' => $goodsmeta,
    'goodsurl' => $goodsurl,
    'zoneid' => 0,
    'ts' => time(),
    'pfkey' => $pfkey,
    'serverid'=> $serverid
);
$ret = pay_buy($sdk , $openid, $openkey, $pf, $data);
if ($ret['ret'] == 0) {
    //记录token，作为支付单据，发货接口根据token生成订单
    $token = $ret['token'];
    $cashLogs = new CashLogs();
    $cashLogsInfo = CashLogs::sql("SELECT * FROM ".$config['db.tbpre']."cash_logs WHERE token = '".$token."'", SimpleOrm::FETCH_ONE);
    if (!$cashLogsInfo) {
        $cashLogs->platform = $pf;
        $cashLogs->serverid = $serverid;
        $cashLogs->userid = $openid;
        $cashLogs->rmb = $amt / $config['pay.rate'];
        $cashLogs->gold = $amt;
        $cashLogs->extra = $amt;
        $cashLogs->createtime = time();
        $cashLogs->ip = get_ip();
        $cashLogs->rate = $config['pay.rate'];
        $cashLogs->token = $token;
        $cashLogs->status = 0;
        $cashLogs->save();
    }
}
echo json_encode($ret);