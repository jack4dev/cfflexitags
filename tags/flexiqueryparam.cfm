<cfif THISTAG.ExecutionMode EQ 'start'>
	<!--- declare the list attribute in the params to be false by default.
	this is to ensure its availability in the parent tag. --->
	<cfparam name="ATTRIBUTES.list" default="false">
	<cfparam name="ATTRIBUTES.separator" default=",">
	<cfparam name="ATTRIBUTES.null" default="no">

	<cfparam name="ATTRIBUTES.scale" default="">
	<cfparam name="ATTRIBUTES.maxLength" default="">

	<!--- append child tag information to the parent tag --->
	<cfset THISTAG.Parent = GetBaseTagData( "cf_flexiquery" ) />
	<cfset ArrayAppend(THISTAG.Parent.THISTAG.Children, ATTRIBUTES) />
	<cfoutput>?</cfoutput>
</cfif>