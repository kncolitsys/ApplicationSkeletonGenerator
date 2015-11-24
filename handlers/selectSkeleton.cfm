<cflog file="bolt" text="Running selectSkeleton.cfm #timeFormat(now())#">
<cfparam name="ideeventinfo"> 
<cfset data = xmlParse(ideeventinfo)>

<!--- get a list of folders in this applications skeletons folder --->
<cfdirectory action="list" directory="#expandPath('../skeletons')#" type="dir" name="mySkeletons" />

<cfheader name="Content-Type" value="text/xml">  
<cfoutput>  
<response status="success" type="default">  
	<ide handlerfile="expandSkeleton.cfm"> 
		<dialog width="300" height="200">  
			<input name="Select a Type" Lable="Select Type" type="list">
			<cfloop query="mySkeletons">
				<option value="#mySkeletons.name#" />
			</cfloop> 
			</input>					
		</dialog>
	</ide>
</response>  
</cfoutput> 

