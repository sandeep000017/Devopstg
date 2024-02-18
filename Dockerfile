FROM centos:7

RUN for user in sandeep; do useradd $user; echo "1234" | passwd $user --stdin; done
RUN yum update -y 
