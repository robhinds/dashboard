<!--- Start Javascript --->
<script type="text/javascript">
$(document).ready(function() {
	var opts = {
	  lines: 12, // The number of lines to draw
	  angle: 0.0, // The length of each line
	  lineWidth: 0.44, // The line thickness
	  pointer: {
	    length: 0.9, // The radius of the inner circle
	    strokeWidth: 0.035, // The rotation offset
	    color: '#000000' // Fill color
	  },
	  colorStart: '#E0C61F',   // Colors
	  colorStop: '#E0C61F',    // just experiment with them
	  strokeColor: '#E0DCBA',   // to see which ones work best for you
	  generateGradient: true
	};
	var target = document.getElementById('<cfoutput>#event.getValue('widgetId')#</cfoutput>'); // your canvas element
	var gauge = new Gauge(target).setOptions(opts); // create sexy gauge!
	gauge.maxValue = 3000; // set max gauge value
	gauge.set(Math.floor((Math.random()*3000)+1)); // set actual value
});
</script>

<!--- Widgt Body --->
<cf_widget>
	<div style="text-align:center; ">
		<canvas id="<cfoutput>#event.getValue('widgetId')#</cfoutput>"></canvas>
		<span id="<cfoutput>#event.getValue('widgetId')#</cfoutput>-value" style="font-weight:200; font-size:40px;">1250</span>
	</div>
</cf_widget>