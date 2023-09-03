FROM mysql:8
RUN mkdir -p /usr/local/river/etc
COPY go-mysql-elasticsearch   /usr/local/river/
COPY river.toml /usr/local/river/etc/
CMD chmod +x /usr/local/river/go-mysql-elasticsearch
WORKDIR /usr/local/river/
CMD /usr/local/river/go-mysql-elasticsearch 
