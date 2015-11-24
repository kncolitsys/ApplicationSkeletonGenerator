<cflog file="bolt" text="Running expandSkeleton.cfm #timeFormat(now())#">
<cfparam name="ideeventinfo"> 
<cfset data = xmlParse(ideeventinfo)>

<cfset message = "" />
<cfset expandLocation = data.event.ide.projectview.resource.xmlAttributes.path />
<cfset skeletonLocation = data.event.user.input.xmlAttributes.value />

<!--- get the zip file under the skeleton location directory. I ignore any but the first one --->
<cfdirectory action="list" directory="#expandPath('../skeletons/#skeletonLocation#')#" filter="*.zip" name="mySkeletonsZip" />

<cfif mySkeletonsZip.recordCount>
	<cfzip action="unzip" destination="#expandLocation#" file="#mySkeletonsZip.directory#/#mySkeletonsZip.name#" storePath="true" />
	<cfset message = mySkeletonsZip.name & " unzipped to " & expandLocation />
<cfelse>
	<cfset message = "No zip file was found in that directory." />
</cfif>

<cfheader name="Content-Type" value="text/xml">  
<response status="success" showresponse="true">  
<ide>  
<dialog width="550" height="350" />  
<body>
<![CDATA[<p style="font-size:11px;">
<cfoutput>#message#</cfoutput>
</p>]]>
</body>
</ide>
</response>

