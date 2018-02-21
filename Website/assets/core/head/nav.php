<img src="/assets/images/logo.png" class="navbar-logo" alt="Online Stemmen Logo">

<?php if (strpos($_SERVER["REQUEST_URI"], "stemmen")) {
  echo '
		<nav>
			<div class="navbar-split navbar-left"></div>
			<a href="/" class="navbar-item navbar-left">Home</a>
			<p class="navbar-item navbar-left navbar-next"></p>
			<b class="navbar-item navbar-left"> Stemmen</b>
    </nav>';
} elseif (strpos($_SERVER["REQUEST_URI"], "resultaten")) {
  echo '
		<nav>
			<div class="navbar-split navbar-left"></div>
			<a href="/" class="navbar-item navbar-left">Home</a>
			<p class="navbar-item navbar-left navbar-next"></p>
			<b class="navbar-item navbar-left"> Resultaten</b>
		</nav>';
} else {
  echo '
		<nav>
			<div class="navbar-split navbar-left"></div>
			<a href="/" class="navbar-item navbar-left">Home</a>
			<div class="navbar-split navbar-right"></div>
			<a href="/stemmen" class="navbar-item navbar-right">Stemmen</a>
			<div class="navbar-small-split navbar-right"></div>
			<a href="/resultaten" class="navbar-item navbar-right">Resultaten</a>
		</nav>';
}