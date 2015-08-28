<cfswitch expression="#THISTAG.ExecutionMode#">

    <cfcase value="Start">
        <cfset THISTAG.Children = ArrayNew( 1 ) />
    </cfcase>

    <cfcase value="End">
        <!--- Test --->
		<cfoutput>
            I Found #ArrayLen(THISTAG.Children)# Children.
        </cfoutput>
		<cfdump var="#THISTAG.Children#">
		<cfset tempContent = replace(THISTAG.GeneratedContent,'?','<cf_queryparam cfsqltype="cf_sql_varchar" value="comedy">') />
		<cfset tempContent = replace(tempContent,'?','<cf_queryparam cfsqltype="cf_sql_integer" value="14">') />
		<cfdump var="#tempContent#">
		<cfparam name="Attributes.name" default="qFlexiResult">
	    <cfparam name="Attributes.datasource" default="movielist">
	    <!--- <cfparam name="Attributes.cachedWithin" default="#CreateTimeSpan(0,6,0,0)#"> --->
	    <cfparam name="Attributes.maxRows" default="25">
	    <cfparam name="Attributes.timeOut" default="600">

	    <cfquery name="qProcess"
		         datasource="#Attributes.datasource#"
	             <!--- cachedWithin="#Attributes.cachedWithin#" --->
	             maxRows="#Attributes.maxRows#"
	             timeOut="#Attributes.timeOut#">
	          <cfoutput>#THISTAG.GeneratedContent#</cfoutput>
	    </cfquery>
		<!---  set the value in the caller scope --->
		<cfset CALLER[ATTRIBUTES.name] = qProcess />
		<!--- <cfexit method="exittag" /> --->
    </cfcase>
</cfswitch>