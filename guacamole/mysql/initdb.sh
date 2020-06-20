#!/bin/sh

mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE ${GUACAMOLE_DB}; \
    CREATE USER '${GUACAMOLE_DB_USER}'@'%' IDENTIFIED BY '${GUACAMOLE_DB_PASSWORD}'; \
    GRANT SELECT,INSERT,UPDATE,DELETE ON guacamole_db.* TO '${GUACAMOLE_DB_USER}'@'%'; \
     FLUSH PRIVILEGES;"

mysql -uroot -p${MYSQL_ROOT_PASSWORD} ${GUACAMOLE_DB} < /sqls/initdb.sql