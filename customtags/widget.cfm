<cfparam name="attributes.rowPosition" default="#caller.event.getValue('rowPosition')#" />
<cfparam name="attributes.colPosition" default="#caller.event.getValue('colPosition')#" />
<cfparam name="attributes.colWidth" default="#caller.event.getValue('colWidth')#" />
<cfparam name="attributes.rowHeight" default="#caller.event.getValue('rowHeight')#" />
<cfparam name="attributes.bgColour" default="#caller.event.getValue('bgColour')#" />
<cfparam name="attributes.title" default="#caller.event.getValue('title')#" />

<cfif (thisTag.ExecutionMode IS "end")>
	<cfset thisTag.GeneratedContent = "<li data-row='" & attributes.rowPosition 
		& "'  data-col='" & attributes.colPosition 
		& "' data-sizex='" & attributes.colWidth 
		& "' data-sizey='" & attributes.rowHeight 
		& "' class='gs_w widget-" & attributes.bgColour & "'>"
		& "<h3>" & attributes.title & "</h3>"
		& thisTag.GeneratedContent
		& "</li>" />	
</cfif>