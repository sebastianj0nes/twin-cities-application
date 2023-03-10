<?php

//converts the given data into an array
function convertDataToArray($url, $type)
{
    //depending on the language given process differently.
    switch ($type) {
        case 'xml':
            $xml = simplexml_load_file($url) or die("Error: FAILURE");
            $result = json_encode($xml);
            break;
        case 'csv':
            // create file handle to read CSV file
            $csvToRead = fopen($url, 'r');

            // read CSV file using comma as delimiter
            while (!feof($csvToRead)) {
                $csvArray[] = fgetcsv($csvToRead, 1000, ',');
            }

            fclose($csvToRead);
            $result = $csvArray;
            break;
        default:
            echo 'something went wrong';
    }
    return json_decode($result, true);
}



function userFriendlyErrorHandler(int $errNo, string $errMsg, string $file, int $line)
{
    return "This is a more user friendly error message, feel free to use the above variables to write a better one.";
}

// function to convert multi-dimensional array to xml
function array2XML($obj, $array)
{
    foreach ($array as $key => $value) {
        if (is_numeric($key))
            $key = 'item';
        if (is_array($value)) {
            $node = $obj->addChild($key);
            array2XML($node, $value);
        } else {
            $obj->addChild($key, htmlspecialchars($value));
        }
    }
}
