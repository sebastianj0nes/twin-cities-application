<?php

if ($_REQUEST['city']) {
    $query = $pdo->prepare("SELECT city.* FROM city WHERE city.c_ID = :c_ID");
    $query->execute([
        'c_ID' => (int) $_REQUEST['city'],
    ]);
    $city = $query->fetch();
} else {
    echo 'No city entered';
    die();
}

// Prepare for javascript by converting data to JSON format
$placesJson = json_encode($cities[$city['c_ID']]['places']);
$coordJson = json_encode(['lat' => (float) $city['c_lat'], 'lng' => (float) $city['c_long']]);


// Current Weather calls using data from API called in $cities
$url = $cities[$city['c_ID']]['current_weather'];
$array = convertDataToArray($url, 'xml');
// Initialising variables to hold current weather info, e.g $name/$condition
$name = $array['city']['@attributes']['name'];
$condition = $array['clouds']['@attributes']['name'];
$temperature = $array['temperature']['@attributes']['value'];
$windSpeed = $array['wind']['speed']['@attributes']['value'];
$windDisc = $array['wind']['speed']['@attributes']['name'];
$windDirec = $array['wind']['direction']['@attributes']['name'];
$humidity = $array['humidity']['@attributes']['value'];
$pressure = $array['pressure']['@attributes']['value'];
$sunrise = (new DateTime($array['city']['sun']['@attributes']['rise']))->format('H:i:s');
$sunset = (new DateTime($array['city']['sun']['@attributes']['set']))->format('H:i:s');

// Forecast variables
$forecastUrl = $cities[$city['c_ID']]['forecast'];
$forecastArray = convertDataToArray($forecastUrl, 'xml');
$forecasts = $forecastArray['forecast']['time'];

// Create a counter
$i = 1;
// Loop through forecast data
foreach ($forecasts as $forecast) {
    // Get forecast data and store in variables
    $cloudType = $forecast['clouds']['@attributes']['value'];
    // Creating array to hold all relevant forecast data
    $forecastData[$i] = [
        'windspeed' => $forecast['windSpeed']['@attributes']['mps'],
        'temperature' => $forecast['temperature']['@attributes']['value'],
        'description' => $cloudType,
        'icon' => generateWeatherIcon($cloudType)
    ];
    $i++;
}
// good to know formatting for date:(new DateTime($date))->format('d/m/Y')

//rename images to not have spaces
function generateWeatherIcon($cloudType = null)
{
    // Switch statement to generate weather images depending 
    // on the weather data returned
    switch ($cloudType) {
        case 'broken clouds':
            $result = 'fa-cloud';
            break;
        case 'overcast clouds':
            $result = 'fa-cloud';
            break;
        case 'light rain':
            $result = 'fa-cloud-rain';
            break;
        case 'scattered clouds':
            $result = 'fa-cloud';
            break;
        case 'light snow':
            $result = 'fa-snowflake';
            break;
        case 'clear sky':
            $result = 'fa-sun';
            break;
        case 'few clouds':
            $result = 'fa-cloud';
            break;
        case 'snow':
            $result = 'fa-snowflake';
            break;
        case 'heavy rain':
            $result = 'fa-cloud-showers-heavy';
            break;
        default:
            $result = 'fa-ban';
    }
    return $result;
}
?>

<!-- Displaying weather data in Bootstrap rows/columns -->
<div class="row">
    <div class="col-md-6">
        <div class="card">
            <!-- Holding map data -->
            <div class="card-header bg-success text-center">Map</div>
            <div class="card-body">
                <div id="map"></div>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="card">
            <!-- Displaying all weather data -->
            <div class="card-header bg-success text-center">Weather Conditions</div>
            <div class="card-body">
                <table class="table table-striped">
                    <tbody>
                        <tr>
                            <td>Condition:</td>
                            <td>
                                <?= $condition ?>
                            </td>
                        </tr>
                        <tr>
                            <td>Temperature:</td>
                            <td>
                                <?php echo $temperature ?> ??C
                            </td>
                        </tr>
                        <tr>
                            <td>Wind:</td>
                            <td>
                                <?php echo $windSpeed . " m/s (" . $windDisc . ") from a " . $windDirec . " direction" ?>
                                <!--different way of doing this^ <?= $windSpeed ?> m/s (<?= $windDisc ?>) from a <?= $windDirec ?> direction -->
                            </td>
                        </tr>
                        <tr>
                            <td>Humidity:</td>
                            <td>
                                <?php echo $humidity ?>%
                            </td>
                        </tr>
                        <tr>
                            <td>Pressure:</td>
                            <td>
                                <?php echo $pressure ?> hPa
                            </td>
                        </tr>
                        <tr>
                            <td>Sunrise:</td>
                            <td>
                                <?php echo $sunrise ?>
                            </td>
                        </tr>
                        <tr>
                            <td>Sunset:</td>
                            <td>
                                <?php echo $sunset ?>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table class="table">
                    <tr>
                        <?php
                        // Loop through all forecast data and echo to page
                        foreach ($forecastData as $day => $forecast) {
                            echo '<td>';

                            echo '<i class="fa-3x fa-solid ' . $forecast['icon'] . '"></i><br />';
                            echo $forecast['windspeed'] . "m/s" . '<br />';
                            echo $forecast['temperature'] . "??C" . '<br />';
                            echo '</td>';
                        }
                        ?>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="col-md-12">
    <div class="card">
        <!-- Displaying all weather data -->
        <div class="card-header bg-success text-center">RSS Feed</div>
        <div class="card-body">
            <table class="table table-striped">
                <tbody>
                    <tr>
                        <td width="25%">Name:</td>
                        <td>
                            <?= $city['c_name'] ?>
                        </td>
                    </tr>
                    <tr>
                        <td>Coords:</td>
                        <td>
                            lat:<?= $city['c_lat'] ?>, lng:<?= $city['c_long'] ?>
                        </td>
                    </tr>
                    <tr>
                        <td>Population:</td>
                        <td>
                            <?= $city['c_population'] ?>
                        </td>
                    </tr>
                    <tr>
                        <td>Country:</td>
                        <td>
                            <?= $city['c_country'] ?>
                        </td>
                    </tr>
                    <tr>
                        <td>Wiki Link:</td>
                        <td>
                            <?= $city['c_wiki'] ?>
                        </td>
                    </tr>
                    <tr>
                        <td>Events:</td>
                        <td>
                            <?= $city['c_event'] ?>
                        </td>
                    </tr>
                </tbody>
        </div>
    </div>
</div>



</div>

<script>
    const GoogAPI = "<?php echo G_MAPS_API ?>";

    function initMap() {
        // Map Options
        let options = {
            zoom: 13,
            center: <?php echo $coordJson; ?>,
            mapTypeControlOptions: {
                mapTypeIds: 'roadmap'
            }
        }
        // New Map instance
        var map = new google.maps.Map(document.getElementById('map'), options);
        var places = <?php echo $placesJson; ?>;
        // Loop through markers - ables to amend array of POI
        for (var i = 0; i < places.length; i++) {
            // Adding a marker
            addMarker(places[i]);
        };

        // Add Marker Function
        function addMarker(place) {
            var myLatLng = new google.maps.LatLng(place[1], place[2]);
            var marker = new google.maps.Marker({
                position: myLatLng,
                map: map,
                title: place[0],
                url: place[4]
                // (Change Icon instead of red pin if desired) icon:''
            });
            //Check content (ensuring no undefined variable)
            if (place[3]) {
                var infoWindow = new google.maps.InfoWindow({
                    content: place[3],
                    width: 1000,
                });
                // Add event listeners to markers e.g hovering or click on marker
                marker.addListener('mouseover', () => infoWindow.open(map, marker))
                marker.addListener('mouseout', () => infoWindow.close())
                marker.addListener('click', function() {
                    window.location.href = this.url;
                });
            }
        }
    }
</script>
<!-- <script src="js/googleMap.js"> -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBpUaGxwCjLH3xVvnv1OoDX_qtDbKjDQ8c&callback=initMap&v=weekly" defer></script>