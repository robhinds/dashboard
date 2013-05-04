<cfparam name="attributes.rowPosition" >
<cfparam name="attributes.colPosition" >
<cfparam name="attributes.colWidth" >
<cfparam name="attributes.rowHeight" >
<cfparam name="attributes.bgColour" default="orange">

<cfif (thisTag.ExecutionMode IS "end")>
	<cfset thisTag.GeneratedContent = "<li data-row='" & attributes.rowPosition 
		& "'  data-col='" & attributes.colPosition 
		& "' data-sizex='" & attributes.colWidth 
		& "' data-sizey='" & attributes.rowHeight 
		& "' class='gs_w widget-" & attributes.bgColour & "'>"
		& thisTag.GeneratedContent
		& "</li>" />	
</cfif>