<?php
@date_default_timezone_set("GMT");
header('Content-Type: text/xml');
require '../config.php';
require '../database/conn.php';
require '../helpers.php';

$output = 'print';
// print - prints output to browser
// save - store file on server

$query = $pdo->prepare("SELECT city.* FROM city");
$query->execute();
$cities = $query->fetchAll();

$writer = new XMLWriter();

$writer->openURI('php://output');

$writer->startDocument('1.0');
$writer->setIndent(4);

$writer->startElement('rss');
$writer->writeAttribute('version', '2.0');
$writer->writeAttribute('xmlns:atom', 'http://www.w3.org/2005/Atom');

$writer->startElement("channel");
$writer->writeElement('title', 'RSS page');
$writer->writeElement('description', 'a page holding information about our cities');
$writer->writeElement('link', 'http://localhost/assignment/github/twin-cities-application/pages/feed.php');
$writer->writeElement('pubDate', date("D, d M Y H:i:s e"));


foreach ($cities as $key => $city) {


    $writer->startElement("item");
    $writer->writeElement('title', $city['c_name']);
    $writer->writeElement('link', $city['c_wiki']);
    $writer->startElement("description");
    $writer->startCdata();
    $writer->writeElement("img", '<img src="' . $city['c_image'] . '">');
    $writer->writeElement("country", $city['c_country']);
    $writer->writeElement("coordinates", 'Lat: ' . $city['c_lat'] . " Lon: " . $city['c_long']);
    $writer->writeElement("population", $city['c_population']);
    $writer->writeElement("currency", $city['c_currency']);
    $writer->writeElement("population", $city['c_population']);
    $writer->writeElement("events", $city['c_event']);

    $writer->endCdata();
    $writer->endElement();



    $writer->endElement();


    $query = $pdo->prepare("select place.*, image.i_link,image.i_desc from place left join image on image.p_ID = place.p_ID WHERE city_c_ID=:id");
    $query->execute(['id' => $key + 1]);
    $pois = $query->fetchAll();


    foreach ($pois as $poi) {


        $writer->startElement("item");
        $writer->writeElement("title", $poi['p_name']);
        $writer->writeElement("link", $poi['p_wiki']);
        $writer->startElement("description");
        $writer->startCdata();
        $writer->writeElement("img", '<img src="' . $poi['i_link'] . '">');
        $writer->writeElement("coordinates", 'Lat: ' . $poi['p_lat'] . " Lon: " . $poi['p_long']);
        $writer->writeElement("established", "Established in: " . $poi['p_established']);
        $writer->writeElement("capacity", "Capacity: " . $poi['p_capacity']);
        $writer->writeElement("address", "Line 1: " . $poi['p_addOne'] . " Line 2: " . $poi['p_addTwo'] . " Postcode: " . $poi['p_postcode']);
        $writer->endCdata();
        $writer->endElement();

        $writer->endElement();
        // End place_of_interest individual element					
    }
}



$writer->endElement();
$writer->endDocument();

$writer->flush();
?>