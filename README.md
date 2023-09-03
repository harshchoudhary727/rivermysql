<h1>SET up River on mysql to push data in elasticsearch</h1>

## Prerequisites:

1. You must have podman/docker install on your system.
2. Install Mysql DB
3. Elasticsearch is required to save the data in index.

### Setup mysql:

 podman run -itd --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=redhat docker.io/library/mysql:8 

 Test the mysql from Base machine

 mysql -h 192.168.122.1 -u root -p
 Enter password redhat

 create database test;

 use test;
 
  CREATE TABLE employee(ID INT PRIMARY KEY, First_Name VARCHAR(20), Last_Name VARCHAR(20), Salary INT, Email_Id VARCHAR(40));
  ![image](https://github.com/harshchoudhary727/rivermysql/assets/66783694/b8dcd17a-3b94-4583-bc57-658fe4188c19)

 

 ### Setup Elasticsearch

 podman run -itd --name elasticdbz -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.7.0








