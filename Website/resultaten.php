<?php
$pageTitle = "Resultaten";
include "assets/core/head.php";
?>
	<form>
		<select name="gemeente" onchange="this.form.submit()">
<?php
$gemeenten = $CORE->krijgGemeenten();
if ($gemeenten) {
	echo '
			<option value="0" disable>Selecteer een gemeente</option>';
	foreach ($gemeenten as $gemeente) {
		echo '
			<option value="'.$gemeente["id"].'"'; if (isset($_GET["gemeente"]) && $_GET["gemeente"] == $gemeente["id"]) { echo ' selected'; } echo '>'.$gemeente["naam"].'</option>';
	}
}
	?>
		</select>
	</form>

<?php

if (isset($_GET["gemeente"])) {
	$stemResultaten = $CORE->krijgStemresulatenVanGemeenteId($_GET["gemeente"]);

	if ($stemResultaten) {
		echo '	
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
				title: \'Stemmen per gemeente\'
			};

			var chart = new google.visualization.PieChart(document.getElementById(\'piechart\'));

			chart.draw(data, options);
		}
	</script>

	<div id="piechart" style="width: 900px; height: 500px;"></div>';
	}
}
?>

<?php
include "assets/core/foot.php";
?>