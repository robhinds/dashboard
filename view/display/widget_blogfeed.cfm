<!--- Start Javascript --->
<script type="text/javascript">
$(document).ready(function() {
	new blogFeedWidget.Views.BlogPostView( {
		target: '#<cfoutput>#event.getValue('widgetId')#</cfoutput>',
		refreshRate: '<cfoutput>#event.getValue('refreshRate')#</cfoutput>',
		blogUrl: '<cfoutput>#event.getValue('blogFeedUrl')#</cfoutput>'
	});
});
</script>


<!--- Widgt Body --->
<cf_widget>
	<div id="<cfoutput>#event.getValue('widgetId')#</cfoutput>"></div>
</cf_widget>


<!--- Widget Template --->
<script type="text/template" id="blogpost-template">
	<span class="blogpost">{{ title }}</span><br/>
   	<span class="fine-print">
		posted by {{ author }} {{ dateCreated }}
   	</span><br/><br/>
</script>