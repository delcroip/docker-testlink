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
ADD https://github.com/TestLinkOpenSourceTRMS/testlink-code/archive/${TL_VERSION}.tar.gz ./testlink-code-${TL_VERSION}.tar.gz
RUN tar -zxvf testlink-code-${TL_VERSION}.tar.gz -C /tmp
RUN mv /tmp/testlink-code-${TL_VERSION} /app/testlink 
RUN cp /app/config_db.inc.php /app/testlink/config_db.inc.php
RUN mkdir -p /var/testlink/logs
RUN mkdir -p /var/testlink/upload_area
RUN chmod 777 /var/testlink/logs /var/testlink/upload_area /var/lib/php 
RUN rm -fr /tmp/*

EXPOSE 80 3306
CMD ["/testlink.sh"]
