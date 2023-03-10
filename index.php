<?php
// Import relevant files
require 'config.php';
require 'helpers.php';
require 'flickr.php';
// do this if one
$sql = "SELECT city.c_ID, city.c_name FROM city WHERE 1";

$pdo = new PDO('mysql:host=' . DBMS['HOST'] . ';dbname=' . DBMS['DB'], DBMS['UN'], DBMS['PW'], [
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"
]);

$query = $pdo->prepare($sql);
$query->execute();
$citiesForMenu = $query->fetchAll();



// Create array to hold different page loads
$routes = [
    'homepage' => 'pages/homepage.php',
    'cities' => 'pages/cities.php',
    'places' => 'pages/places.php',
    '404' => 'pages/404.php',
    'test' => 'pages/test.php',
];
$route = $_GET['p'] ?? 'homepage';
$page = (array_key_exists($route, $routes)) ? $route : '404';
$file = $routes[$page];
?>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TwinCities</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.php?p=homepage">TwinCities</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- Navbar -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <?php
                    foreach ($citiesForMenu as $city) {
                        echo '<li class="nav-item"><a class="nav-link" href="index.php?p=cities&city=' . $city['c_ID'] . '">' . $city['c_name'] . '</a></li>';
                    }
                    ?>
                    <li class="nav-item">
                        <a class="nav-link" href="./pages/feed.php" target="_blank">RSS Feed</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Load content depending on page loaded -->
    <div class="container-fluid mb-3">
        <?php require($file); ?>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>

</html>