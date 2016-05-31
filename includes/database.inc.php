<?php
require_once __DIR__ . '/../lib/SimpleOrm.class.php';

$conn = new mysqli($config['db.host'], $config['db.user'], $config['db.pwd']);
if ($conn->connect_error) {
    die(sprintf('Unable to connect to the database. %s', $conn->connect_error));
}
SimpleOrm::useConnection($conn, $config['db.dbname']);