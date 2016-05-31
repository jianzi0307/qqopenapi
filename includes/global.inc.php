<?php
ini_set("display_errors","On");
error_reporting(E_ALL);

require_once(__DIR__."/../OpenApiV3.php");
require_once(__DIR__."/../lib/functions.php");
require_once(__DIR__."/../lib/SimpleOrm.class.php");

$config = require_once(__DIR__ . "/../configs/config.php");
require_once (__DIR__."/../includes/database.inc.php");

require_once (__DIR__."/../classes/User.php");
require_once (__DIR__."/../classes/Cash.php");
require_once (__DIR__."/../classes/CashLogs.php");