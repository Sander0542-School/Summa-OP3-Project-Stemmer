<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><?php if (isset($pageTitle)) { echo $pageTitle; } else { echo "Page"; } ?> | Online Stemmen</title>

    <link rel="stylesheet" type="text/css" href="/assets/vendor/style.css">
  </head>
  <body>
<!-- Navbar -->
<?php
include "head/nav.php";
?>