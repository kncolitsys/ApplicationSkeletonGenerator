<cfcomponent output="false">

<!---
Returns the current URL for the page.

@return Returns a string.
@version 1, September 5, 2008
--->
<cffunction name="getCurrentURL" output="No" access="public" returnType="string">
    <cfset var theURL = getPageContext().getRequest().GetRequestUrl().toString()>
    <cfif len( CGI.query_string )><cfset theURL = theURL & "?" & CGI.query_string></cfif>
	<cfset theUrl = reReplaceNoCase(theUrl, "[&?]*cfid=[0-9]+", "")>
	<cfset theUrl = reReplaceNoCase(theUrl, "[&?]*cftoken=[^&]+", "")>
    <cfreturn theURL>
</cffunction>
	
</cfcomponent>