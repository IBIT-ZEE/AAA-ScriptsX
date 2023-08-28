call AAA-Log %0 %*  

:MAIN
	if "%1"=="" ( AAA-Obs %0 )
	exit /b

:OBS
>google-
>google$

//
after:       after:2020 ?before:
allintitle:  ?all words and in title | allintext:password filetype:log after:2020
cache:       consider only locally cached data
define:      google dictionary for word
filetype:    txt/log/pdf/ppt/docx/...
intitle:     ?text present in page title | inurl:http -site:.tv
inurl:       ?text present in page url
intext:      ?text in the page content
related:     sites related to a given domain
site:        search only on this site | site:.pt, site:.onion

  
