FROM centos:7

RUN yum update -y && yum install nginx -y
