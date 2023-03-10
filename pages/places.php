<?php

$place_id = $_GET['poi'];


$query = $pdo->prepare("select place.* from place");
$query->execute();
$pois = $query->fetchAll();





echo 'Name: ' . $pois[$place_id - 1]['p_name'] . '<br/>';
echo 'Address1: ' . $pois[$place_id - 1]['p_addOne'] . '<br/>';
echo 'Address2: ' . $pois[$place_id - 1]['p_addTwo'] . '<br/>';
echo 'Postcode: ' . $pois[$place_id - 1]['p_postcode'] . '<br/>';
echo 'Lat: ' . $pois[$place_id - 1]['p_lat'] . '<br/>';
echo 'Long: ' . $pois[$place_id - 1]['p_long'] . '<br/>';
echo 'Established: ' . $pois[$place_id - 1]['p_established'] . '<br/>';
echo 'Description: ' . $pois[$place_id - 1]['p_desc'] . '<br/>';
echo 'Capacity: ' . $pois[$place_id - 1]['p_capacity'] . '<br/>';
echo 'Website: ' . $pois[$place_id - 1]['p_website'] . '<br/>';
echo 'Wiki page: ' . $pois[$place_id - 1]['p_wiki'] . '<br/>';
get_photo($pois[$place_id - 1]['p_name'], 5);
