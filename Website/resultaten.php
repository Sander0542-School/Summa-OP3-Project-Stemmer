<?php
$pageTitle = "Resultaten";
include "assets/core/head.php";
?>

    <select>
        <?php
            $gemeenten = $CORE->krijgGemeenten();
            if ($gemeenten) {
                echo '
        <option value="0" disable>Selecteer een gemeente</option>';
                foreach ($gemeenten as $gemeente) {
                    echo '
        <option value="'.$gemeente["id"].'">'.$gemeente["naam"].'</option>';
                }
            }
        ?>
    </select>
<?php
include "assets/core/foot.php";
?>