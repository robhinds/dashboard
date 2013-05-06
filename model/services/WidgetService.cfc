/**
 * Widget Service component is responsible for initialising 
 * the required parameters for a given widget. If new widgets are added - then this should be updated
 * to cater for them.
 */
component output="false"{

	/**
	 * Singleton constructor (CF doesnt support static variables so we will use
	 * an application scoped global variable to store this)
	 */
	public WidgetService function init() {
		if (NOT structKeyExists(application, "widgetService")){
			application.widgetService = this;
		}		
		return application.widgetService;
	}


	/**
	 * Initialises a widget and adds the view to the "widgets" variable.
	 * Working on the assumption that the view file will be "display/widget_[WidgetType]".
	 * Defaults background colour to orange.
	 */
	public void function createWidget(required any myFusebox, required any event, required String widgetType, String elementId="", numeric refreshRate=0, 
								required numeric rowNumber, required numeric colNumber, required numeric width, 
								required numeric height, String title="", String bgColour="orange"){
		event.setValue( "widgetId", arguments.widgetType & arguments.elementId );
		event.setValue( "refreshRate", arguments.refreshRate );
		event.setValue( "rowPosition", arguments.rowNumber );
		event.setValue( "colPosition", arguments.colNumber );
		event.setValue( "colWidth", arguments.width );
		event.setValue( "rowHeight", arguments.height );
		event.setValue( "bgColour", arguments.bgColour );
		event.setValue( "title", arguments.title );
		myFusebox.do( action="display.widget_" & widgetType, contentvariable="widgets", append=true );
	}
	
	
	/**
	 * Create a BlogWidget
	 */
	public void function createBlogWidget(required any myFusebox, required any event, String elementId="", numeric refreshRate=0, 
								required numeric rowNumber, required numeric colNumber, required numeric width, 
								required numeric height, String title="", String bgColour="orange", required String blogFeedUrl){
		event.setValue('blogFeedUrl', arguments.blogFeedUrl);
		createWidget( myFusebox:arguments.myFusebox, event:arguments.event, widgetType:'blogfeed', elementId:arguments.elementId, 
						refreshRate:arguments.refreshRate, rowNumber:arguments.rowNumber, colNumber: arguments.colNumber, width: arguments.width, 
						height: arguments.height, title:arguments.title, bgColour: arguments.bgColour);
	}
	
	/**
	 * Create a Twitter widget
	 */
	public void function createTwitterWidget(required any myFusebox, required any event, String elementId="", numeric refreshRate=0, 
								required numeric rowNumber, required numeric colNumber, required numeric width, 
								required numeric height, String title="", String bgColour="orange", required String userName){
		event.setValue('userName', arguments.userName);
		createWidget( myFusebox:arguments.myFusebox, event:arguments.event, widgetType:'twitter', elementId:arguments.elementId, 
						refreshRate:arguments.refreshRate, rowNumber:arguments.rowNumber, colNumber: arguments.colNumber, width: arguments.width, 
						height: arguments.height, title:arguments.title, bgColour: arguments.bgColour);
	}
	
	
	/**
	 * Create a widget that uses the generic linechart view
	 */
	public void function createLineChartWidget(required any myFusebox, required any event, String elementId="", numeric refreshRate=0, 
								required numeric rowNumber, required numeric colNumber, required numeric width, 
								required numeric height, String title="", String bgColour="orange", required String apiUrl){
		event.setValue('apiUrl', arguments.apiUrl);
		createWidget( myFusebox:arguments.myFusebox, event:arguments.event, widgetType:'linechart', elementId:arguments.elementId, 
						refreshRate:arguments.refreshRate, rowNumber:arguments.rowNumber, colNumber: arguments.colNumber, width: arguments.width, 
						height: arguments.height, title:arguments.title, bgColour: arguments.bgColour);
	}
	
}