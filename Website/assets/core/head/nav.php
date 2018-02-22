
    <img src="/assets/images/logo.png" class="navbar-logo" alt="Online Stemmen Logo">
<?php if ($pageTitle != "Home") {
  echo '
    <nav>
      <div class="navbar-split navbar-left"></div>
      <a href="/" class="navbar-item navbar-left">Home</a>
      <p class="navbar-item navbar-left navbar-next"></p>
      <b class="navbar-item navbar-left"> '.$pageTitle.'</b>
    </nav>';
} else {
  echo '
    <nav>
      <div class="navbar-split navbar-left"></div>
      <a href="/" class="navbar-item navbar-left">Home</a>
      <div class="navbar-split navbar-right"></div>
      <a href="/resultaten" class="navbar-item navbar-right">Resultaten</a>
      <div class="navbar-small-split navbar-right"></div>
      <a href="/stemmen" class="navbar-item navbar-right">Stemmen</a>
    </nav>';
}