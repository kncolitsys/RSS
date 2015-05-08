<cfsetting enablecfoutputonly=true>
<cfsetting showdebugoutput=false>
<cfset meta = structNew()>
<cfset meta.title = "Foo">
<cfset meta.link = "http://www.foo.com">
<cfset meta.description = "The site for foo.">
<cfset meta.image = structNew()>
<cfset meta.image.url = "http://www.foo.com/site.gif">
<cfset meta.image.title = "Foo">
<cfset meta.image.link = "http://www.foo.com">

<cfset data = queryNew("title,body,link,subject,date")>

<cfloop from="1" to="4" index="x">
	<cfset queryAddRow(data,1)>
	<cfset querySetCell(data,"title","Title #x#")>
	<cfset querySetCell(data,"body","Body #x#")>
	<cfset querySetCell(data,"link","http://www.foo.com/index.cfm?id=#x#")>
	<cfset querySetCell(data,"subject","Subject #x#")>
	<cfset querySetCell(data,"date",now())>
</cfloop>


<cfset rss = createObject("component","rss")>

<cfset rssXML = rss.generateRSS("rss1",data,meta)>

<cffile action="write" file="#expandPath('./foo.xml')#" output="#rssXML#">

<cfcontent type="text/xml" reset="true"><cfoutput>#rssxml#</cfoutput>