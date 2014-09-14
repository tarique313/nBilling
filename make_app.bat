call bin\shutdown.bat
call grails clean
call grails compile 
call grails war


call rd /s/q webapps\nbilling\
call DEL webapps\nbilling.war
COPY target\nbilling.war webapps