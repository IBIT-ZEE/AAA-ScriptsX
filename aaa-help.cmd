::


:MAIN
	:: Call aaa-log %0 %*
	:: Call aaa-main %~f0
	Call aaa-obs %0

	echo,
	echo,
	
	exit /b

	
:OBS
    AAA Concepts/Models

    #Scripts
        Fork ....... Using generic semanthics decide operations
        Leverage ... Using generic semanthics override Actions from argument

    #ScriptsX
        Classes ...... Class-*, aggregate related actions/operations

    #ScriptsXX
        Private ...... me-* prefix
        Overloads .... pre/post processing of arguments/results
        Decorators ... pre/Post work of standard scripts

    Helpers
        - ..... All meta-commands (beggining with -)
        -- .... All classes (from #ScriptX)
        --- ... 2DO***


