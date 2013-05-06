<!--- Start Javascript --->
<script type="text/javascript">
$(document).ready(function() {
	linechartWidget.Widgets.bind( {
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
	<canvas id="<cfoutput>#event.getValue('widgetId')#</cfoutput>"></canvas>
</cf_widget>