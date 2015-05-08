<cfset theURL = "http://news.google.com/news?q=google+rss&hl=en&lr=&ct=title&ie=UTF-8&output=rss">

<cfset rss = createObject("component","rss")>

	<cfset entries = rss.getEntries(theURL)>
	<cfdump var="#entries#">
	
