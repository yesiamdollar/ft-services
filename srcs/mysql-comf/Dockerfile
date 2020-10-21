FROM alpine
RUN apk add --no-cache openrc mysql mysql-client


RUN /etc/init.d/mariadb setup
RUN /etc/init.d/mariadb start

RUN mysql_secure_instalation 

RUN echo "\r" && \
echo "n\r" && \ 
echo "y\r" && \ 
echo "1337\r" && \ 
echo "y\r" && \
echo "y\r" && \ 
echo "y\r" && \ 
echo "y\r" 

RUN rc-service mariadb restart


RUN sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/my.cnf && \
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf && \
sed -i "s|.*skip-networking.*|skip-networking|g" /etc/mysql/my.cnf && \
sed -i "s|.*skip-networking.*|skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
