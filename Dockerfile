FROM registry-rhconnect.rhcloud.com/rhel71_updates
#Maintainer
MAINTAINER Glen Millard "gmillard@redhat.com"
#
#Install the necessities
RUN yum -y update
RUN yum -y install wget

#Need the EPEL as I do not see nginx in the offical RHEL repos
#RUN rpm -ivh https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
ADD Nginx.repo /etc/yum.repos.d/Nginx.repo
RUN yum -y update

#Add the nginx application
RUN yum -y install nginx

#Move the default config file out of the way
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.gln

#Add a custom config file
ADD nginx.conf /etc/nginx/nginx.conf
VOLUME ["/var/cache/nginx"]

#The required ports - http and https
EXPOSE 80 443

#Run the nginx application on launch of the container
CMD ["nginx", "-g", "daemon off;"]
