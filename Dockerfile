FROM centos
MAINTAINER saro@nathantech.com
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN curl -O -L https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.69/bin/apache-tomcat-8.5.69.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.69/* /opt/tomcat/.
RUN yum -y install java
RUN java -version
WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war
EXPOSE 8090
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
