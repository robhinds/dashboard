<!--- Start Javascript --->
<script type="text/javascript">
$(document).ready(function() {
	new gageWidget.Views.GageView( {
		target: '<cfoutput>#event.getValue('widgetId')#</cfoutput>',
		refreshRate: '<cfoutput>#event.getValue('refreshRate')#</cfoutput>',
		colWidth: '<cfoutput>#event.getValue('colWidth')#</cfoutput>',
		rowHeight: '<cfoutput>#event.getValue('rowHeight')#</cfoutput>',
		apiUrl: '<cfoutput>#event.getValue('apiUrl')#</cfoutput>'
	});
});
</script>

<!--- Widgt Body --->
<cf_widget>
	<div style="text-align:center; ">
		<canvas id="<cfoutput>#event.getValue('widgetId')#</cfoutput>"></canvas>
		<div id="<cfoutput>#event.getValue('widgetId')#</cfoutput>-value" style="font-weight:200; font-size:40px;"></div>
	</div>
</cf_widget>