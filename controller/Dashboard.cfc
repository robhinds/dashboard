/**
 * Dashboar Controller component
 */
component output="false"{
	
	public void function postfuseaction(myFususebox, event){
		myFusebox.do( action="layout.dashboard" );
	}

	public void function welcome(myFususebox, event){
		
		//First Widget:
		event.setValue("widgetId", "jenkins-1");
		event.setValue("refreshRate", 30);
		event.setValue("rowPosition", 1);
		event.setValue("colPosition", 1);
		event.setValue("colWidth", 2);
		event.setValue("rowHeight", 1);
		event.setValue("bgColour", "orange");
		myFusebox.do( action="display.widget_blank", contentvariable="widgets", append=true);
		
		//Second Widget:
		event.setValue("widgetId", "jenkins-2");
		event.setValue("refreshRate", 45);
		event.setValue("rowPosition", 1);
		event.setValue("colPosition", 3);
		event.setValue("colWidth", 1);
		event.setValue("rowHeight", 1);
		event.setValue("bgColour", "blue");
		myFusebox.do( action="display.widget_twitter", contentvariable="widgets", append=true);

		//Third widget
		event.setValue("widgetId", "jenkins-3");
		event.setValue("refreshRate", 45);
		event.setValue("rowPosition", 2);
		event.setValue("colPosition", 1);
		event.setValue("colWidth", 1);
		event.setValue("rowHeight", 1);
		event.setValue("bgColour", "blue");
		myFusebox.do( action="display.widget_blank", contentvariable="widgets", append=true);
		
		//Fourth Widget:
		event.setValue("widgetId", "jenkins-4");
		event.setValue("refreshRate", 45);
		event.setValue("rowPosition", 2);
		event.setValue("colPosition", 2);
		event.setValue("colWidth", 2);
		event.setValue("rowHeight", 1);
		event.setValue("bgColour", "yellow");
		myFusebox.do( action="display.widget_linechart", contentvariable="widgets", append=true);

		//Fifth widget
		event.setValue("widgetId", "jenkins-5");
		event.setValue("refreshRate", 45);
		event.setValue("rowPosition", 1);
		event.setValue("colPosition", 4);
		event.setValue("colWidth", 1);
		event.setValue("rowHeight", 2);
		event.setValue("bgColour", "orange");
		myFusebox.do( action="display.widget_blogfeed", contentvariable="widgets", append=true);
		
		
		//Render page
		myFusebox.do( action="display.dsp_dashboard", contentvariable="body" );
	}
}