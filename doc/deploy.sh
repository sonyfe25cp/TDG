#!/bin/sh

tomcat_home=/home/ubuntu/software/apache-tomcat-7.0.52


cd $tomcat_home

bin/shutdown.sh

mv webapps/ROOT/uploads/images webapps/

rm -rf webapps/ROOT

rm -rf work/*

cd $tomcat_home/webapps

mv /tmp/WebContent.tar.gz .

tar zxvf WebContent.tar.gz

mv  WebContent.tar.gz /home/ubuntu/download/

mv WebContent ROOT

rm -rf ROOT/uploads/images

mv images ROOT/uploads/

cd ROOT/WEB-INF/lib

rm .gitignore

rm .DS_Store
rm ._*.jar
rm ._.DS_Store

cd $tomcat_home
bin/startup.sh
