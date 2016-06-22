<?php
$serverHost = $_SERVER['HTTP_HOST'];
return array(
    //APP ID
    "appid" => 1105344749,

    //APP KEY
    "appkey" => 'nnF1KA3vOSFaUmQl',

    //切换沙盒与现网状态
    "is_sendbox" => false,

    //充值开关， 0 关闭 1开启
    "pay_is_open" => 1,

    //现网环境，OpenAPI地址
    "server_name_online" => 'openapi.tencentyun.com',

    //沙盒环境，OpenAPI地址
    "server_name_sendbox" => '119.147.19.43',

    //Game Site
    "game_site" => 'http://www.752g.com',

    //game server
    "game_server_url" => $serverHost,//"s14.app1105344749.qqopenapp.com",

    //pay api
    "pay_server_url" => "/v3/pay/buy_goods",

    //login key
    "platform_login_key" => '6c517e87a0295858314b8d7fdcfadcd3',

    //exchange key
    "platform_exchange_key" => '57256ec1110fed1a20a9e9a8663d3752',

    //database
    "db.host" => '127.0.0.1',
    "db.user" => 'root',
    "db.pwd" => '111111',
    "db.dbname" => 'db_ucenter',
    "db.tbpre" => "app_",

    //redis
    "redis.host" => '127.0.0.1',
    "redis.port" => 6379,

    //game server sock
    "sock_host" => '127.0.0.1',
    //同服会配置不同的端口
    "sock_port" => array(
        's14' => 7000,
        's15' => 7001,
        's16' => 7002
    ),
    "sock_user" => 'zml',
    "sock_password" => 'zml123',

    //充值比例
    "pay.rate" => 10

);
