# FROM debian

# RUN apt-get update -y && \
# 	apt-get upgrade -y && \
# 	apt-get install -y mariadb-server mariadb-client

# # RUN     mkdir -p /run/mysqld && chown mysql:mysql /var/lib/mysql
# # RUN     mkdir -p /var/lib/mysql/ && chmod 777 /var/lib/mysql

# # COPY	conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf.test

# COPY	conf/mariadb.sh /var/mariadb.sh

# # RUN		chmod -R 777 /var/log/mysql 
# # RUN		chmod +x /var/mariadb.sh

# EXPOSE	3306


# #CMD		["sh", "/var/mariadb.sh"]


FROM debian:buster

RUN apt update -y && apt install mariadb-server mariadb-client gettext-base -y


COPY	conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY	./conf/mariadb.sh /var/mariadb.sh
RUN		chown mysql:mysql /var/lib/mysql

EXPOSE	3306

CMD ["sh", "/var/mariadb.sh" ]
# CMD		["tail", "-f", "/dev/null"]