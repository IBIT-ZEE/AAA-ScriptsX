AAA-Obs %0


:obs

	replace:

		"https://github.com/*"
			-with-
		"https://raw.githubusercontent.com/*"


	curl -O <raw-url>
	curl -JLO <raw-url>




