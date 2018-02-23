<?php
$pageTitle = "Stemmen";
include "assets/core/head.php";
?>

<?php
if (isset($_POST["loginBsn"]) && isset($_POST["loginCode"])) {
  if ($CORE->login($_POST["loginBsn"], $_POST["loginCode"])) {
    echo '<div class="messagebox green"><h2>U bent succesvol ingelogd</h2></div>';
  } else {
    echo '<div class="messagebox red"><h2>U kunt niet inloggen met deze BSN en Code</h2></div>';
  }
}

if ($CORE->isIngelogd()) {
  echo 'Halloottjesss';
} else {
  echo '
    <form action="/stemmen" method="post">
      <input type="text" placeholder="bsn" name="loginBsn">
      <input type="text" placeholder="code" name="loginCode">
      <input type="submit" value="login">
    </form>
';
}
?>

<?php
include "assets/core/foot.php";
?>