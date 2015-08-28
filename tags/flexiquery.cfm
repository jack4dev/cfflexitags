<cfswitch expression="#THISTAG.ExecutionMode#">
    <cfcase value="Start">
        <cfset THISTAG.Children = ArrayNew(1) />
    </cfcase>

    <cfcase value="End">
        <!--- Test --->
		<cfoutput>
            I Found #ArrayLen(THISTAG.Children)# Children.
        </cfoutput>
		<!--- <cfdump var="#THISTAG.Children#"> --->

	    <cfscript>
		    param Attributes.name="qFlexiResult";
		    param Attributes.result="qFlexiMetaInfo";
		    param Attributes.datasource="movielist";
		    param Attributes.blockfactor="1";
		    param Attributes.cachedWithin=CreateTimeSpan(0,6,0,0);
		    param Attributes.cachedAfter="";
		    param Attributes.debug="";
		    param Attributes.maxRows="-1";
		    param Attributes.timeOut="";
		    param Attributes.fetchClientInfo="no";
		    param Attributes.username="";
		    param Attributes.password="";
		    //1. PREPARE QUERY STATEMENT
		    THISTAG.strQuery = THISTAG.GeneratedContent;
		    THISTAG.paramsCount = REMatchNoCase("\?",THISTAG.strQuery);
		    for(i=1;i<=arrayLen(THISTAG.paramsCount);i++){
		    	THISTAG.strQuery = replaceNoCase(THISTAG.strQuery,'?',':namedParam#i#','one');
		    }
		    //2. PREPARE QUERY OBJECT
		    THISTAG.queryService = new Query();
		    THISTAG.queryService.setSQL(THISTAG.strQuery);

		    //3. SET QUERY DEFAULT VALUES FROM TAG ATTRIBUTES
		    if(Attributes.datasource NEQ '')
			    THISTAG.queryService.setDataSource(Attributes.datasource);

			if(Attributes.blockfactor NEQ '')
			    THISTAG.queryService.setBlockFactor(Attributes.blockfactor);

			if(Attributes.cachedWithin NEQ '')
			    THISTAG.queryService.setCachedWithin(Attributes.cachedWithin);

			if(Attributes.cachedAfter NEQ '')
			    THISTAG.queryService.setCachedAfter(Attributes.cachedAfter);

			if(Attributes.debug NEQ '')
			    THISTAG.queryService.setDebug(Attributes.debug);

			if(Attributes.maxRows NEQ '')
			    THISTAG.queryService.setMaxRows(Attributes.maxRows);

			if(Attributes.timeOut NEQ '')
			    THISTAG.queryService.setTimeOut(Attributes.timeOut);

			if(Attributes.fetchClientInfo NEQ '')
			    THISTAG.queryService.setFetchClientInfo(Attributes.fetchClientInfo);

			if(Attributes.username NEQ '')
			    THISTAG.queryService.setUserName(Attributes.username);

			if(Attributes.password NEQ '')
			    THISTAG.queryService.setPassword(Attributes.password);

			//4. BIND PARAMETER VALUES BY MAPPING TO THE CUSTOM CHILD TAG DATA
			for(i=1;i<=arrayLen(THISTAG.paramsCount);i++){
				//check for attributes and bind accordingly
				if(THISTAG.Children[i].maxlength NEQ '')
					THISTAG.queryService.addParam(name="namedParam#i#", cfsqltype="#THISTAG.Children[i].CFSQLTYPE#", value="#THISTAG.Children[i].VALUE#"
										,maxlength="#THISTAG.Children[i].maxlength#", list="#THISTAG.Children[i].LIST#",separator="#THISTAG.Children[i].SEPARATOR#", null="#THISTAG.Children[i].NULL#");
				else if(THISTAG.Children[i].scale NEQ '' AND listFindnocase("CF_SQL_NUMERIC,CF_SQL_DECIMAL",THISTAG.Children[i].CFSQLTYPE) NEQ 0)
					THISTAG.queryService.addParam(name="namedParam#i#", cfsqltype="#THISTAG.Children[i].CFSQLTYPE#", value="#THISTAG.Children[i].VALUE#"
										,scale="#THISTAG.Children[i].scale#",list="#THISTAG.Children[i].LIST#",separator="#THISTAG.Children[i].SEPARATOR#", null="#THISTAG.Children[i].NULL#");
				else
					THISTAG.queryService.addParam(name="namedParam#i#", cfsqltype="#THISTAG.Children[i].CFSQLTYPE#", value="#THISTAG.Children[i].VALUE#"
										,list="#THISTAG.Children[i].LIST#",separator="#THISTAG.Children[i].SEPARATOR#", null="#THISTAG.Children[i].NULL#");
			}

			//5. EXECUTE QUERY AND GET RESULT
			THISTAG.qResult = THISTAG.queryService.execute();

			//6. SET THE VALUE IN THE CALLER SCOPE
			if(THISTAG.qResult.getResult() NEQ '')
				CALLER[ATTRIBUTES.name] = THISTAG.qResult.getResult();
			else
				CALLER[ATTRIBUTES.name] = THISTAG.qResult.getPrefix();

			CALLER[ATTRIBUTES.result] = THISTAG.qResult.getPrefix();

		</cfscript>
		<!--- <cfexit method="exittag" /> --->
    </cfcase>
</cfswitch>