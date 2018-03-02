
    <img src="/assets/images/logo.png" class="navbar-logo" alt="Online Stemmen Logo">
<?php if ($pageTitle != "Home") {
  echo '
    <nav>
      <div class="navbar-split navbar-left"></div>
      <a href="/" class="navbar-item navbar-left">Home</a>
      <p class="navbar-item navbar-left navbar-next"></p>
      <b class="navbar-item navbar-left"> '.$pageTitle.'</b>';
  if (isset($_SESSION["userSession"])) {
    echo '
      <div class="navbar-split navbar-right"></div>
      <a href="/loguit" class="navbar-item navbar-right">Uitloggen</a>';
  }
  echo '
    </nav>';
} else {
  echo '
    <nav>
      <div class="navbar-split navbar-left"></div>
      <a href="/" class="navbar-item navbar-left">Home</a>';
  if (isset($_SESSION["userSession"])) {
    echo '
      <div class="navbar-split navbar-right"></div>
      <a href="/loguit" class="navbar-item navbar-right">Uitloggen</a>
      <div class="navbar-small-split navbar-right"></div>';
  } else {
    echo '
      <div class="navbar-split navbar-right"></div>';
  }
  echo '
      <a href="/resultaten" class="navbar-item navbar-right">Resultaten</a>
      <div class="navbar-small-split navbar-right"></div>
      <a href="/stemmen" class="navbar-item navbar-right">Stemmen</a>
    </nav>';
}