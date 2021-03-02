FROM mattrayner/lamp:build-189-1604-php7

ENV TL_VERSION=1.9.20
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update && apt-get -y install php-gd


ADD testlink.sh /testlink.sh
ADD clean.sh /clean.sh
ADD import_mysql_testlink_data.sh /import_mysql_testlink_data.sh
RUN chmod 755 /testlink.sh /clean.sh /import_mysql_testlink_data.sh
COPY . /app


WORKDIR /app
ADD https://github.com/TestLinkOpenSourceTRMS/testlink-code/archive/${TL_VERSION}.tar.gz ./${TL_VERSION}.tar.gz
RUN tar -zxvf ${TL_VERSION}.tar.gz && rm -f ${TL_VERSION}.tar.gz
RUN mv testlink-code-${TL_VERSION} testlink && rm -fr testlink-code-${TL_VERSION}
RUN mkdir -p /var/testlink/logs
RUN mkdir -p /var/testlink/upload_area
RUN chmod 777 /var/testlink/logs /var/testlink/upload_area /var/lib/php5 testlink/gui/templates_c
RUN cp config_db.inc.php testlink/

EXPOSE 80 3306
CMD ["/testlink.sh"]
