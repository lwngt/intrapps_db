FROM mysql:8.0.26
EXPOSE 3306

# For character code setting
ADD ./conf/my.conf /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]
