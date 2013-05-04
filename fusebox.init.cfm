<cfscript>
	
	//*********************** URL ROUTING ***********************
	//for now we will just map directly URLs to controller/
	// function names - so if more than 2 error in the future 
	// we can have a URL map of urls and controller actions
	//***********************************************************
	urlPath = listToArray(cgi.path_info, "/");
	if (urlPath.size() NEQ 2 AND urlPath.size() NEQ 0){
		Throw(type="fusebox.undefinedFuseaction"); 
	}
	//set fuseaction as the url pair:
	if (urlPath.size() EQ 2 ){
		attributes.fuseaction = urlPath[1] & "." & urlPath[2];
	}

</cfscript>
