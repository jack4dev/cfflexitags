<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Flexi Query Demo</title>
</head>
<body>
<!--- <cfdump var="#application.getApplicationSettings()#" /><cfabort> --->
<cfoutput>
	<!--- Attempt #1  --->
	<!--- <cf_flexiquery name="qFlexiResult">
		SELECT * FROM movies
		WHERE genre = "comedy"
		AND actor_id != 14
	</cf_flexiquery> --->
	<!--- Attempt #2 # --->
	<!--- <cf_flexiquery>
		SELECT * FROM movies
		WHERE genre = <cfqueryparam cfsqltype="cf_sql_varchar" value="comedy">
		AND actor_id != <cfqueryparam cfsqltype="cf_sql_integer" value="14">
	</cf_flexiquery> --->

	<!--- Workaround #1 : Using nested custom tags (parent/child)--->
	<!---
		<tag:parent>
		    <tag:child />
		    <tag:child />
		    <tag:child />
		    <tag:child />
		    <tag:child />
		</tag:parent>
	 --->

	<!--- <cfscript>
		myTestQuery = new Query();
		writeDump(myTestQuery);
		abort;
	</cfscript> --->

	<!--- TAG DEMOs --->
	<!--- 1. select demo --->
	<!--- <cf_flexiquery>
		SELECT * FROM movies
		WHERE genre = <cf_flexiqueryparam cfsqltype="cf_sql_varchar" value="comedy">
		AND actor_id NOT IN (<cf_flexiqueryparam cfsqltype="cf_sql_integer" list="true" value="11,12,13,14,15,16,17">)
	</cf_flexiquery>
	<cfdump var="#qFlexiResult#" />
	<cfdump var="#qFlexiMetaInfo#" /> --->

	<!--- 2. insert demo --->
	<!--- <cf_flexiquery>
		INSERT INTO movies(actor_id,name,genre,release_year,runtime,user_rating,gross,status,summary)
		VALUES(<cf_flexiqueryparam cfsqltype="cf_sql_integer" value="26">
				,<cf_flexiqueryparam cfsqltype="cf_sql_varchar" value="Lucy">
				,<cf_flexiqueryparam cfsqltype="cf_sql_varchar" value="sci-fi">
				,<cf_flexiqueryparam cfsqltype="cf_sql_integer" value="2014">
				,<cf_flexiqueryparam cfsqltype="cf_sql_integer" value="89">
				,<cf_flexiqueryparam cfsqltype="cf_sql_integer" value="7">
				,<cf_flexiqueryparam cfsqltype="cf_sql_integer" value="150000000">
				,<cf_flexiqueryparam cfsqltype="cf_sql_varchar" value="active">
				,<cf_flexiqueryparam cfsqltype="cf_sql_longtext" value='When a boyfriend tricks Lucy (Scarlett Johansson) into delivering a briefcase to a supposed business contact, the once-carefree student is abducted by thugs who intend to turn her into a drug mule. She is surgically implanted with a package containing a powerful chemical, but it leaks into her system, giving her superhuman abilities, including telekinesis and telepathy. With her former captors in pursuit, Lucy seeks out a neurologist (Morgan Freeman), who she hopes will be able to help her.'>
				)
	</cf_flexiquery>
	<cfdump var="#qFlexiMetaInfo#" /> --->

	<!--- 3. update demo --->
	<!--- <cf_flexiquery>
		UPDATE movies
		SET genre = <cf_flexiqueryparam cfsqltype="cf_sql_varchar" value="sci-fi">
			,user_rating = <cf_flexiqueryparam cfsqltype="cf_sql_integer" value="6">
		WHERE movie_id = 31
	</cf_flexiquery>
	<cfdump var="#qFlexiMetaInfo#" /> --->

	<!--- 4. delete demo --->
	<!--- <cf_flexiquery>
		DELETE FROM movies
		WHERE genre = <cf_flexiqueryparam cfsqltype="cf_sql_varchar" value="sci-fi">
		AND actor_id IN (<cf_flexiqueryparam cfsqltype="cf_sql_integer" list="true" value="26">)
	</cf_flexiquery>
	<cfdump var="#qFlexiResult#" /> --->
</cfoutput>
</body>
</html>
