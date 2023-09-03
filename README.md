<h1>SET up River on mysql to push data in elasticsearch</h1>

## Prerequisites:

1. You must have podman/docker install on your system.
2. Install Mysql DB
3. Elasticsearch is required to save the data in index.

### Setup mysql:

 #podman run -itd --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=redhat docker.io/library/mysql:8 

  Test the mysql from Base machine

 #mysql -h 192.168.122.1 -u root -p
 Enter password redhat

 #create database test;

 #use test;
 
  #CREATE TABLE employee(ID INT PRIMARY KEY, First_Name VARCHAR(20), Last_Name VARCHAR(20), Salary INT, Email_Id VARCHAR(40));
  ![image](https://github.com/harshchoudhary727/rivermysql/assets/66783694/b8dcd17a-3b94-4583-bc57-658fe4188c19)


 Insert some data in table:
  INSERT INTO employee(ID, First_Name, Last_Name, Salary, Email_Id) VALUES(1, "Neeta", "Korade", 59000, "neetak12@gmail.com"), (2, "Sushma", "Singh", 62000, "sushsingh67@gmail.com"), (3, "Kavita", "Rathod", 27000, "kavitar09@gmail.com"), (4, "Mrunalini", "Deshmukh", 88000, "mrunald78@gmail.com"), (5, "Swati", "Patel", 34000, "swatip67@gmail.com"), (6, "Laxmi", "Kadam", 44000, "laxmik14@gmail.com"), (7, "Lalita", "Shah", 66000, "lalita45@gmail.com"), (8, "Savita", "Kulkarni", 31000, "savitak56@gmail.com"), (9, "Shravani", "Jaiswal", 38000, "shravanij39@gmail.com"), (10, "Shweta", "Wagh", 20000, "shwetaw03@gmail.com");
  ![image](https://github.com/harshchoudhary727/rivermysql/assets/66783694/94e0cafe-6a54-4b0c-a37c-51b1aec4b038)

 

 ### Setup Elasticsearch

 podman run -itd --name elasticdbz -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.7.0


 ### RUN The River container.

 git clone the repository

 #git clone https://github.com/harshchoudhary727/rivermysql.git

 ![image](https://github.com/harshchoudhary727/rivermysql/assets/66783694/c047e84c-af83-4236-bfe0-111387718a14)

 #cd rivermysql

 #configure river.toml file as per the requirement.
 
 #podman build -t localhost/river:v1 .

 #podman run -itd --name river -v ./river.toml:/usr/local/river/etc/river.toml:rw  localhost/river:v1 


 ###Check data in Elasticsearch.

#curl 'http://localhost:9200/new/_search?pretty'  // change index name new as per the index name done in river.toml file


Test cases:

 
 

 
 
 

 








