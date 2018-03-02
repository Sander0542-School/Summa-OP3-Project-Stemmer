<?php
$pageTitle = "Resultaten";
include "assets/core/head.php";
?>

    <div class="resultaten-content">
      <div class="resultaten-dropdown">
        <form>
          <select name="gemeente" onchange="this.form.submit()">
<?php
$gemeenten = $CORE->krijgGemeenten();
if ($gemeenten) {
	echo '
            <option value="0"'; if (!isset($_GET["gemeente"])) { echo ' selected'; } echo ' disabled>Selecteer een gemeente</option>';
	foreach ($gemeenten as $gemeente) {
		echo '
            <option value="'.$gemeente["id"].'"'; if (isset($_GET["gemeente"]) && $_GET["gemeente"] == $gemeente["id"]) { echo ' selected'; } echo '>'.$gemeente["naam"].'</option>';
	}
}
	?>

          </select>
        </form>
      </div>

<?php

if (isset($_GET["gemeente"])) {
	$stemResultaten = $CORE->krijgStemresulatenVanGemeenteId($_GET["gemeente"]);

	if ($stemResultaten) {
		echo '	
      <div class="resultaten-chart">
        <script type="text/javascript">
          google.charts.load(\'current\', {
            \'packages\': [\'corechart\']
          });
          google.charts.setOnLoadCallback(drawChart);

          function drawChart() {

            var data = google.visualization.arrayToDataTable([
              [\'Stemmen\', \'Stemmen per gemeente\']'; 
	
		foreach ($stemResultaten as $resultaat) {
			echo ',
              [\''.$resultaat["partijNaam"].'\', '.$resultaat["stemmen"].']';
		}
		
		echo '
            ]);

            var options = {
              title: \'Stemmen per gemeente\',
              backgroundColor: { fill:\'transparent\' }
            };

            var chart = new google.visualization.PieChart(document.getElementById(\'piechart\'));

            chart.draw(data, options);
          }
        </script>

        <div id="piechart" style="width: 100%; height: 500px;"></div>';
	} else {
		echo '
			<p>Er zijn nog geen stemmen voor deze gemeente</p>';
	}
}
?>
    </div>
<?php
include "assets/core/foot.php";
?>