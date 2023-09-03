<h1>Rivermysql</h1>

<h2> Prerequisites: </h2>

1. You must have podman/docker install on your system.
2. Install Mysql DB
3. Elasticsearch is required to save the data in index.

Setup mysql:

 podman run -itd --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=redhat docker.io/library/mysql:8 





