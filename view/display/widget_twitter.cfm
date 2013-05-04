<cfimport prefix="widget" taglib="/dashboard/customtags/">
<script type="text/javascript">
$(document).ready(function() {
	var tweetWidget = new twitterWidget.Models.TweetModel();
	var view = new twitterWidget.Views.TweetView( { model: tweetWidget } );
	tweetWidget.fetch();
	setInterval(tweetWidget.fetch, 30000);
});
</script>

<widget:widget rowPosition="#event.getValue('rowPosition')#" colPosition="#event.getValue('colPosition')#" rowHeight="#event.getValue('rowHeight')#" colWidth="#event.getValue('colWidth')#" bgColour="#event.getValue('bgColour')#" >
	<h3>Latest from Twitter</h3>
	<div id="twitter"></div>
</widget:widget>


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