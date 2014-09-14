grails clean
grails compile
grails war
cd webapps
rm -f nbilling.war
rm -R nbilling
cd ..
cd target
mv nbilling.war ../webapps
