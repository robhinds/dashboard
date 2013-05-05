<!--- Start Javascript --->
<script type="text/javascript">
$(document).ready(function() {
	
	var data = [
	{
		value: 30,
		color:"#F38630"
	},
	{
		value : 50,
		color : "#E0E4CC"
	},
	{
		value : 100,
		color : "#69D2E7"
	}			
	]
	var ctx = document.getElementById("donut-chart").getContext("2d");
	new Chart(ctx).Pie(data,{});
});
</script>


<!--- Widgt Body --->
<cf_widget>
	<canvas id="donut-chart" width="250" height="230"></canvas>
</cf_widget>