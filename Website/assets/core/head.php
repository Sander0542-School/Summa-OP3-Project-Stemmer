<?php
session_start();
include "classes/core.php";
include "min.php";
$CORE = new CORE();
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><?php if (isset($pageTitle)) { echo $pageTitle; } else { echo "Pagina"; } ?> | Online Stemmen</title>

    <link rel="stylesheet" type="text/css" href="/assets/vendor/style.css">

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  </head>
  <body>

<!-- Navbar -->
<?php
include "head/nav.php";
?>