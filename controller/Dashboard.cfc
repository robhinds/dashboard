/**
 * Dashboar Controller component
 */
component output="false"{
	
	public void function postfuseaction(myFususebox, event){
		myFusebox.do( action="layout.dashboard" );
	}

	public void function welcome(myFususebox, event){
		
		//Create Widgets:
		application.widgetService.createWidget( myFusebox:myFusebox, event:event, widgetType:'blank', rowNumber:1, colNumber:1, width:2, height:1 , title:'Empty Widget' );
		application.widgetService.createTwitterWidget( myFusebox:myFusebox, event:event, rowNumber:1, colNumber:3, width:1, height:1 , title:'Twitter', bgColour:'blue', refreshRate:30000, userName:'rob_hinds' );
		application.widgetService.createWidget( myFusebox:myFusebox, event:event, widgetType:'blank', rowNumber:2, colNumber:1, width:1, height:1 , title:'Empty Widget 2', bgColour:'blue'  );
		application.widgetService.createWidget( myFusebox:myFusebox, event:event, widgetType:'linechart', rowNumber:2, colNumber:2, width:2, height:1 , title:'Example LineChart', bgColour:'yellow'  );
		application.widgetService.createBlogWidget( myFusebox:myFusebox, event:event, rowNumber:1, colNumber:4, width:1, height:2 , title:'Latest Blogs', blogFeedUrl: 'http://blog.nerdability.com/feeds/posts/default' );
				
		//Render page
		myFusebox.do( action="display.dsp_dashboard", contentvariable="body" );
	}
}