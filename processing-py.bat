@echo off 


set "ROOT=%~dp0"
set "DEFAULTSCRIPT=%ROOT%\workspace\example.py"

set JAVA=java
set JVM_ARGS=-Xmx1024m

set "SCRIPTARGUMENT=%~1"

if not "%SCRIPTARGUMENT%" == "" (
	REM Check if we run the default the given script 	
	set "DEFAULTSCRIPT=%SCRIPTARGUMENT%"	
) 


IF exist "%ROOT%\JREs\jre7.win" ( 
	REM Check if we should override default java
	set "JAVA=%ROOT%\JREs\jre7.win\bin\java"
) 


REM msg "%username%" "%JAVA% not found!"



"%JAVA%" %JVM_ARGS% -jar "%ROOT%\processing-py.jar" "%DEFAULTSCRIPT%"

if not %ERRORLEVEL% == 0 (
	echo "Unable to start Java"	
	msg "%username%" "Unable to start Java"
)
