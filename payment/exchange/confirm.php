<?php
require_once (__DIR__ . '/../../includes/global.inc.php');

$appid = $config['appid'];
$appkey = $config['appkey'];

$server_name = $config['is_sendbox'] ? $config['server_name_sendbox'] : $config['server_name_online'];

\SeasLog::info("====================>CONFRIM DELIVERY");
//amttype
$openid = trim($_GET['openid']);
$openkey = trim($_GET['openkey']);
$pf = trim($_GET['pf']);
$token = $_GET['token'];

$sdk = new OpenApiV3($appid, $appkey);
$sdk->setServerName($server_name);

$cashLog = new CashLogs();
$cashInfo = CashLogs::sql("select * from ". $config['db.tbpre']. "cash_logs where `token` = '".$token."' and `userid` = '".$openid."'");
if ($cashInfo) {
    $data = $cashInfo[0];
    if ($data->status == 1) {
        $params = array(
            'payitem' => $data->payitem,
            'token_id' => $token,
            'billno' => $data->orderno,
            'zoneid' => 0,
            'provide_errno' => 0,
            'amt' => $data->gold,
            'payamt_coins' => $data->payamt_coins,
            'ts'=>time()
        );
        $confirmRes = confirm_delivery($sdk, $openid, $openkey, $pf, $params);
        \SeasLog::info('require: '.json_encode($params));
        \SeasLog::info('response: '.json_encode($confirmRes));
    }
}
\SeasLog::info("====================>CONFRIM DELIVERY END");
