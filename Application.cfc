component extends="fusebox5.Application" output="false"{


	this.name = right(REReplace(getDirectoryFromPath(getCurrentTemplatePath()),'[^A-Za-z]','','all'),64);
	this.sessionmanagement = true;
    this.sessiontimeout = createTimeSpan(0,0,30,0);
	this.enablerobustexception  = "yes";



	FUSEBOX_PARAMETERS.defaultFuseaction = "dashboard.welcome";

	// must enable implicit (no-XML) mode!
	FUSEBOX_PARAMETERS.allowImplicitFusebox = true;	
	// possible values: development-full-load, development-circuit-load or production:
	FUSEBOX_PARAMETERS.mode = "development-full-load";
	FUSEBOX_PARAMETERS.conditionalParse = true;
	// change this to something more secure:
	FUSEBOX_PARAMETERS.password = "skeleton";
	FUSEBOX_PARAMETERS.strictMode = true;
	FUSEBOX_PARAMETERS.debug = false;
	FUSEBOX_PARAMETERS.errortemplatesPath = "/dashboard/view/error/";
	
	// force the directory in which we start to ensure CFC initialization works:
	FUSEBOX_CALLER_PATH = getDirectoryFromPath(getCurrentTemplatePath());
	
	FUSEBOX_PARAMETERS.queryStringStart = "/";
	FUSEBOX_PARAMETERS.queryStringSeparator = "/";
	FUSEBOX_PARAMETERS.queryStringEqual = "/";

	
	public void function onFuseboxApplicationStart(){
		super.onFuseboxApplicationStart();
		myFusebox.getApplicationData().startTime = now();
		
		//Initialise Service classes (this is our stateless, singleton service layer)
		application.widgetService 	= new model.services.WidgetService();
		
	}
		
	public void function onRequestStart(required string TargetPage) {
		super.onRequestStart(arguments.targetPage);
		self = myFusebox.getSelf();
		myself = myFusebox.getMyself();
	}
	
}