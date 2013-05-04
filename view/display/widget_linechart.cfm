<cfimport prefix="widget" taglib="/dashboard/customtags/">

<!--- Start Javascript --->
<script type="text/javascript">
$(document).ready(function() {
	
	var data = {
		labels : ["January","February","March","April","May","June","July"],
		datasets : [
			{
				fillColor : "rgba(220,220,220,0.5)",
				strokeColor : "rgba(220,220,220,1)",
				pointColor : "rgba(220,220,220,1)",
				pointStrokeColor : "#fff",
				data : [65,59,90,81,56,55,40]
			},
			{
				fillColor : "rgba(151,187,205,0.5)",
				strokeColor : "rgba(151,187,205,1)",
				pointColor : "rgba(151,187,205,1)",
				pointStrokeColor : "#fff",
				data : [28,48,40,19,96,27,100]
			}
		]
	};
	
	var panelWidth = <cfoutput>#event.getValue('colWidth')#</cfoutput>;
	var panelHeight = <cfoutput>#event.getValue('rowHeight')#</cfoutput>;
	var canvasWidth = gridster.options.widget_base_dimensions[0] * panelWidth;
	var canvasHeight = gridster.options.widget_base_dimensions[0] * panelHeight * 0.80;
	var canvas = document.getElementById("line-chart");
	canvas.width  = canvasWidth;
	canvas.height = canvasHeight;
	var ctx = document.getElementById("line-chart").getContext("2d");
	new Chart(ctx).Line(data,{scaleShowGridLines :false, bezierCurve :false});
});
</script>


<!--- Widgt Body --->
<widget:widget rowPosition="#event.getValue('rowPosition')#" colPosition="#event.getValue('colPosition')#" rowHeight="#event.getValue('rowHeight')#" colWidth="#event.getValue('colWidth')#" bgColour="#event.getValue('bgColour')#" >
	<h3 class="text-center">Graphs</h3>
	<canvas id="line-chart"></canvas>
</widget:widget>