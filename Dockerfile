ARG version=5-debian-10
FROM bitnami/wordpress:$version

# Perform actions that require root permissions here
USER 0

RUN install_packages vim

# Perform actions as the apache/daemon user here
USER 1001

#COPY ./wp-content/plugins /opt/bitnami/wordpress/wp-content/plugins
#COPY ./wp-content/themes  /opt/bitnami/wordpress/wp-content/themes

EXPOSE 8080 8443
