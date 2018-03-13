<?php
$pageTitle = "Stemmen";
include "assets/core/head.php";

if (isset($_POST["loginBsn"]) && isset($_POST["loginCode"])) {
  if ($CORE->login($_POST["loginBsn"], $_POST["loginCode"])) {
    echo '
    <div class="messagebox green"><h2>U bent succesvol ingelogd</h2></div>';
    $CORE->redirect("/stemmen");
  } else {
    echo 
    '<div class="messagebox red"><h2>U kunt niet inloggen met deze BSN en Code</h2></div>';
  }
}

if ($CORE->isIngelogd()) {
  echo '

<!-- Partijen -->

    <div class="partijen">
  ';
  
    $partijen = $CORE->krijgPartijenOmOpTeStemmen();
    $stemmen = $CORE->stemOpPartij();

    foreach ($partijen as $partij) {
      echo '
      <div onclick="document.getElementById(\'modal#'.$partij["id"].'\').style.display=\'block\'" class="partij">
        <span></span><img src="'.$partij["logo"].'" alt="'.$partij["afkorting"].'">
      </div>';

      echo '
      <div id="modal#'.$partij["id"].'" class="modal">
        <div class="modal-content">
          <div class="modal-container modal-header">
            <p onclick="document.getElementById(\'modal#'.$partij["id"].'\').style.display=\'none\'" class="modal-close">&times;</p>
            <h2>Stem Bevestigen</h2>
          </div>
          <div class="modal-container modal-middle">
            <p>Weet u zeker dat u op <strong>'.$partij["naam"].'</strong> wil stemmen?</p>
          </div>
          <div class="modal-container modal-footer">
            <form method="POST" class="modal-stem">
              <input type="hidden" value="'.$partij["id"].'" name="partij">            
              <input type="submit" value="Stem">
            </form>
          </div>
        </div>
      </div>';
    }
  
  echo '

    </div>
';
} else {
  echo '
    <div class="form">
      <form action="/stemmen" method="post">
        <input type="text" placeholder="bsn" name="loginBsn" required><br>
        <input type="text" placeholder="code" name="loginCode" required><br>
        <input type="submit" value="Login">
      </form>
    </div>
';
}
include "assets/core/foot.php";
?>