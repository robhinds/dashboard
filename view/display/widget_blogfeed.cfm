<cfimport prefix="widget" taglib="/dashboard/customtags/">

<!--- Start Javascript --->
<script type="text/javascript">
$(document).ready(function() {
	new blogFeedWidget.Views.BlogListView();
	blogFeedWidget.Collections.BlogList.fetch({reset:true});
	setInterval( function(){ blogFeedWidget.Collections.BlogList.fetch({reset:true}); }, 300000);
});
</script>


<!--- Widgt Body --->
<widget:widget rowPosition="#event.getValue('rowPosition')#" colPosition="#event.getValue('colPosition')#" rowHeight="#event.getValue('rowHeight')#" colWidth="#event.getValue('colWidth')#" bgColour="#event.getValue('bgColour')#" >
	<h3 class="text-center">Latest Blog Posts</h3>
	<div id="latest-blog-posts"></div>
</widget:widget>


<!--- Widget Template --->
<script type="text/template" id="blogpost-template">
	<span class="blogpost">{{ title }}</span><br/>
   	<span class="fine-print">
		posted by {{ author }} {{ dateCreated }}
   	</span><br/><br/>
</script>