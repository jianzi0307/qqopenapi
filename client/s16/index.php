<?php
$config = require_once (__DIR__. '/../../configs/config.php');
//前端资源地址
$svrUrl = "http://cdn.xyzml.752g.com";

//腾讯开平-appid
$appid = $config['appid'];

//腾讯开平-pf
$pf = trim($_GET['pf']);
?>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8" />
    <title>仙域斩魔录</title>
    <style type="text/css">
        html,body { background: #000; padding: 0; margin: 0; width: 100%; height: 100%; text-align: center; overflow: hidden; font-size: 12px; }
        .content-box {width: 100%; height: 94%; margin: 0 auto; padding: 0;}
        .flasharea {width: 100%; height: 100%; overflow:hidden;}
        .footer {color: #c19725; width: 100%; height: 18px; text-align: center; padding: 3px;}
        .redtext {color:red;}
    </style>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="<?php echo $svrUrl;?>/script/swfobject.js?version=1.0.9"></script>
    <script type="text/javascript" src="<?php echo $svrUrl;?>/script/core.js?version=1.0.9"></script>
    <script type="text/javascript">
        var swfversion="1.0.9";
        var xiswfurl="<?php echo $svrUrl;?>/playerProductInstall.swf";
        var flashvars={name:"Loading"};
        var params={};
        params.quality="high";
        params.bgcolor="#000000";
        params.allowscriptaccess="always";
        params.allowfullscreen="true";
        var attributes={};
        attributes.id="Loading";
        attributes.name="Loading";
        attributes.align="middle";
        swfobject.embedSWF( "<?php echo $svrUrl;?>/Loading_1.0.9.swf","main","100%","100%",swfversion,xiswfurl,flashvars,params,attributes );
    </script>
</head>
<body>
<div id="content" class="content-box">
    <!--<div>
        <button id="pay_buy">购买</button>
    </div>-->
    <div id="flasharea" class="flasharea">
        <div id="main">Loading Game...</div>
    </div>
</div>
<div id="footer" class="footer"></div>
<!--腾讯开平-->
<script type="text/javascript" charset="utf-8" src="http://fusion.qq.com/fusion_loader?appid=<?php echo $appid; ?>&platform=<?php echo $pf;?>"></script>
<script>
    function getParams(param)
    {
        var url = location.href;
        var index = url.indexOf("?");
        if (index == -1) {
            return "";
        }
        var paramStr = url.substr(index + 1);
        var params = paramStr.split("&");
        var length = params.length;
        for (var i = 0; i < length; i ++) {
            var str = params[i];
            if (str.indexOf(param+"=") == 0) {
                var paramPair = str.split(param+"=");
                value = paramPair[1];
            }
        }
        return value;
    }

    function confrim_delivery(openid, openkey, pf, token)
    {
        var url = "http://" + "<?php echo $config['game_server_url']; ?>" + "/payment/exchange/confirm.php";
        var data = {};
        data.openid = openid;
        data.openkey = openkey;
        data.pf = pf;
        data.token = token;
        $.get(url, data, function(res){
            var jsonObj = JSON.parse(res);
            alert(jsonObj.msg);
        });
    }

    function buy(goldid) {
        //alert(goldid);
        openChargeUrl(goldid);
    }

    function openChargeUrl(goldid)
    {
        var openid = getParams('openid');
        var openkey = getParams('openkey');
        var pf = getParams('pf');
        var serverid = getParams('serverid');
        var pfkey = getParams('pfkey');

        var url = 'http://' + "<?php echo $config['game_server_url'];?>" + '/payment/';
        var data = { openid: openid, openkey: openkey,pf:pf,serverid:serverid, pfkey:pfkey, goldid:goldid };
        $.get(url, data, function(res) {
            var jsonObj = JSON.parse(res);
            if (jsonObj.ret != -99999) {
                if (jsonObj.ret == 0) {
                    var url_params = jsonObj.url_params;
                    var token = jsonObj.token;
                    fusion2.dialog.buy({
                        disturb: true,
                        param: url_params,
                        sandbox: <?php echo ($config['is_sendbox']) ? 'true':'false'; ?>,
                        context: "xyzml",
                        onSuccess: function (opt) {
                            //alert('支付成功');
                            confrim_delivery(openid, openkey, pf, token);
                        },
                        onCancel: function (opt) {
                        },
                        onSend: function (opt) {
                        },
                        onClose: function (opt) {
                        }
                    });
                } else {
                    alert('error: ' + jsonObj.ret + ' :: ' + jsonObj.msg);
                }
            } else {
                alert(jsonObj.msg);
            }
        });
    }
    $(function(){
        /*$('#pay_buy').on('click', function(){
            openChargeUrl();
        });*/
        //底部客服声明
        var playerHtml = "玩家账号：" + getParams('openid') + " ";
        var statementHtml = '声明：【仙域斩魔录】是由“北京飞扬天下”提供，如你在游戏中遇到任何问题，可加入QQ群<span class="redtext">564180852</span>咨询，进入<a class="redtext" href="http://bbs.open.qq.com/forum.php?mod=forumdisplay&action=list&fid=5036" target="_blank">【论坛】</a>。';
        $('#footer').html(playerHtml + statementHtml);
    });
</script>
</body>
</html>
