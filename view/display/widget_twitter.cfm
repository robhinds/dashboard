<!--- Bind Widget to JS --->
<script type="text/javascript">
$(document).ready(function() {
	twitterWidget.Widgets.bind( {
		target: '#<cfoutput>#event.getValue('widgetId')#</cfoutput>',
		refreshRate: '<cfoutput>#event.getValue('refreshRate')#</cfoutput>',
		userName: '<cfoutput>#event.getValue('userName')#</cfoutput>'
	}); 
});
</script>


<!--- Widget Markup --->
<cf_widget>
	<div id="<cfoutput>#event.getValue('widgetId')#</cfoutput>"></div>
</cf_widget>


<!--- Widget Template --->
<script type="text/template" id="latest-tweet-template">
    <p>
		<span class="twitter">
	    	{{ tweet }}<br/><br/>
		</span>
    	<span class="fine-print">
			posted by {{ author }} {{ date }}
    	</span>
	</p>
</script>