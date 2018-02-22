<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><?php if (isset($pageTitle)) { echo $pageTitle; } else { echo "Pagina"; } ?> | Online Stemmen</title>

    <link rel="stylesheet" type="text/css" href="/assets/vendor/style.css">
    <link rel="stylesheet" type="text/css" href="/assets/vendor/fontawesome-5.0.6/css/fontawesome-all.min.css">
  </head>
  <body>

<!-- Navbar -->
<?php
include "head/nav.php";
?>