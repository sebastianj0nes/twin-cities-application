<?php

$pdo = new PDO('mysql:host=' . DBMS['HOST'] . ';dbname=' . DBMS['DB'], DBMS['UN'], DBMS['PW'], [
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"
]);
?>