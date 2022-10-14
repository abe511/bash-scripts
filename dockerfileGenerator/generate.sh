#!/bin/bash

read -p "Choose image. ex: ubuntu " image;
read -p "Choose version. ex: latest " version;
read -p "Choose server. ex: nginx " server;
echo "from $image:$version" > Dockerfile;
echo 'label maintainer="ab"' >> Dockerfile;
read -p "Choose port number. ex: 8080 " port;
echo "expose 80" >> Dockerfile;
echo "expose 443" >> Dockerfile;

if [ $image == "ubuntu" ]; then
    if [ $server == "nginx" ]; then
        echo "run apt-get update -y && apt-get install -y nginx" >> Dockerfile;
        echo "copy ./public/ /var/www/html" >> Dockerfile;
        echo 'cmd ["nginx", "-g", "daemon off;"]' >> Dockerfile;
    elif [ $server == "apache" ]; then
        echo "run apt-get update -y && apt-get install -y apache2 apache2-utils" >> Dockerfile;
        echo "copy ./public/ /var/www/html" >> Dockerfile;
        echo 'cmd ["apache2ctl", "-D", "FOREGROUND"]' >> Dockerfile;
    fi
elif [ $image == "centos" ]; then
    echo "run cd /etc/yum.repos.d/" >> Dockerfile;
    echo "run sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*" >> Dockerfile;
    echo "run sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*" >> Dockerfile;
    # echo "run dnf update -y" >> Dockerfile;
    # echo "run dnf upgrade -y" >> Dockerfile;
    echo "run dnf install epel-release -y" >> Dockerfile;
    if [ $server == "nginx" ]; then
        echo "run dnf install nginx -y" >> Dockerfile;
        echo "copy ./public/ /usr/share/nginx/html" >> Dockerfile;
        echo 'cmd ["nginx", "-g", "daemon off;"]' >> Dockerfile;
    elif [ $server == "apache" ] || [ $server == "httpd" ]; then
        echo "run dnf install httpd -y" >> Dockerfile;
        echo "copy ./public/ /var/www/html" >> Dockerfile;
        echo 'cmd ["httpd", "-D", "FOREGROUND"]' >> Dockerfile;
    fi
fi

read -p "Choose name. ex: app " name;
docker build -t $name/$image/$server:$version .;
docker run -d -p $port:80 --name $name-$server $name/$image/$server:$version;
