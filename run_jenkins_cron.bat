@ECHO OFF


REM Replace with command line values
REM set SSS=SAMS=SAM-D,SAM-T

set pSAMS=SAM-T,SAM-S,SAM-D

SET URL="http://localhost:8080/job/Jenkinsfiles/job/active-choice/buildWithParameters?SAMS=%pSAMS%"

echo URL: %URL%

set /p token=<auto.TOKEN
REM echo token=%token%

curl -X POST -vL -u auto:%token%  %URL%
echo retVal=%ERRORLEVEL%

:end
