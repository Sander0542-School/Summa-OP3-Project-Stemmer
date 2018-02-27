<?php
$pageTitle = "Stemmen";
include "assets/core/head.php";
?>
<div class="form">
<?php
if (isset($_POST["loginBsn"]) && isset($_POST["loginCode"])) {
  if ($CORE->login($_POST["loginBsn"], $_POST["loginCode"])) {
    echo '<div class="messagebox green"><h2>U bent succesvol ingelogd</h2></div>';
    $CORE->redirect("/stemmen");
  } else {
    echo '<div class="messagebox red"><h2>U kunt niet inloggen met deze BSN en Code</h2></div>';
  }
}

if ($CORE->isIngelogd()) {
  echo 'Halloottjesss';
} else {
  echo '
    <form action="/stemmen" method="post">
      <input type="text" placeholder="bsn" name="loginBsn"><br>
      <input type="text" placeholder="code" name="loginCode"><br>
      <input type="submit" value="Login">
    </form>
';
}
?>
</div>
<?php
include "assets/core/foot.php";
?>