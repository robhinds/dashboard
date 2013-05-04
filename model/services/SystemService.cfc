/**
 * SystemService class - provides functions to return core system related data
 * such as EoD status, EoD date, lastBusinessDay date etc.
 */
component output="false"{

	/**
	 * Singleton constructor (CF doesnt support static variables so we will use
	 * an application scoped global variable to store this)
	 */
	public SystemService function init() {
		if (NOT structKeyExists(application, "systemService")){
			application.systemService = this;
		}		
		return application.systemService;
	}


	public Struct function getEodStatus(){
		var eodStatus = {eod1="Complete", eod2="Running", eod3="Pending"};
		return eodStatus;
	}
	
	public void function getEodDate(){
		
	}
	
	public void function getLAstBusinessDayDate(){
		
	}
	
}