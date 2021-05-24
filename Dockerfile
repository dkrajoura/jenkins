FROM centos:latest

COPY ./nginx.repo /etc/yum.repos.d/nginx.repo 

RUN yum install -y nginx && \
    yum clean all && \
    rm -rf /etc/nginx /usr/share/nginx/html && \
    mkdir -p /startup-hooks && \
    chown -R usgs-user \
        /etc/nginx \
        /startup-hooks \
        /usr/share/nginx \
        /var/log/nginx \
        /var/cache/nginx \
        /var/run \
        /run
COPY ./conf/ /etc/nginx/
COPY ./html/ /usr/share/nginx/html
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
COPY ./healthcheck.sh /healthcheck.sh