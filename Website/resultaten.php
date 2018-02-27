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
    <html>

    <head>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {
                'packages': ['corechart']
            });
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {

                var data = google.visualization.arrayToDataTable([
                    ['Stemmen', 'Stemmen per gemeente'],
                    ['CDA', 11],
                    ['PVV', 2],
                    ['VVD', 2],
                    ['GroenLinks', 2],
                    ['D66', 7]
                ]);

                var options = {
                    title: 'Stemmen per gemeente'
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart'));

                chart.draw(data, options);
            }
        </script>
    </head>

    <body>
        <div id="piechart" style="width: 900px; height: 500px;"></div>
    </body>

    </html>
    <?php
include "assets/core/foot.php";
?>