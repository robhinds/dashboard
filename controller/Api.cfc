/**
 * Dashboar Controller component
 */
component output="false"{


	/**
	 * API endpoint to retrieve an API feed for a given url. Expects query string parameter "feed" to
	 * be provided
	 */
	public void function blogfeed(myFususebox, event){
		if ( !isDefined( "url.feed" ) ){
			//throw error
		}
		
		local.returnJson = arrayNew( 1 );
	    try {
	        local.rss = new feed().read(source=url.feed).query;
	        local.numberItems = local.rss.recordCount > 3 ? 4 : local.rss.recordCount;
	        for ( local.postCount = 1; local.postCount LTE local.numberItems; local.postCount++ ){
	        	local.blogPost = {"title"=local.rss.title[local.postCount], "dateCreated"=local.rss.publishedDate[local.postCount], "author"=local.rss.authorname[local.postCount]};
	        	arrayAppend( local.returnJson, local.blogPost );
	        }
	    } catch (any excpt) {}
	
		getPageContext().getResponse().setContentType('application/json');
		writeOutput( serializeJson( local.returnJson ) );
	}
	
	
	public void function latesttweet(myFususebox, event){
		if ( !isDefined( "url.username" ) ){
			//throw error
		}
		
		local.returnJson = {"tweet"="some tweet from twitter, its exactly 140 chars long, just so we can get a good feel for how it looks at max length (make sure don't explode)", "author"="@rob_hinds", "date"="2013-04-29"};
		getPageContext().getResponse().setContentType('application/json');
		writeOutput( serializeJson( local.returnJson ) );
	}
	
	
	public void function examplelinechart( myFusebox, event ){
		var local.returnJson = {
			"labels"= ["January","February","March","April","May","June","July"],
			"datasets" = [
				{
					"fillColor" = "rgba(220,220,220,0.5)",
					"strokeColor" = "rgba(220,220,220,1)",
					"pointColor" = "rgba(220,220,220,1)",
					"pointStrokeColor" = "##fff",
					"data" = [65,59,90,81,56,55,40]
				},
				{
					"fillColor" = "rgba(151,187,205,0.5)",
					"strokeColor" = "rgba(151,187,205,1)",
					"pointColor" = "rgba(151,187,205,1)",
					"pointStrokeColor" = "##fff",
					"data" = [28,48,40,19,96,27,100]
				}
			]
		};

		getPageContext().getResponse().setContentType('application/json');
		writeOutput( serializeJson( local.returnJson ) );
	}
}