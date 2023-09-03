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

 ##git clone the repository

 #git clone https://github.com/harshchoudhary727/rivermysql.git

 ![image](https://github.com/harshchoudhary727/rivermysql/assets/66783694/c047e84c-af83-4236-bfe0-111387718a14)

 #cd rivermysql

 #configure river.toml file as per the requirement.
 
 #podman build -t localhost/river:v1 .

 #podman run -itd --name river -v ./river.toml:/usr/local/river/etc/river.toml:rw  localhost/river:v1 


 ###Check data in Elasticsearch.

#curl 'http://localhost:9200/new/_search?pretty'  // change index name new as per the index name done in river.toml file


### Test cases:



![image](https://github.com/harshchoudhary727/rivermysql/assets/66783694/e0418b56-24ff-4c6e-b58c-787b6c1f0203)

 
 ![image](https://github.com/harshchoudhary727/rivermysql/assets/66783694/26fb3a8c-783b-487d-b5b7-9e8482d29d8e)

Data is available in elasticsearch index.

![image](https://github.com/harshchoudhary727/rivermysql/assets/66783694/d0e1fd1b-871b-4efb-86af-9adb24fa9929)

 
 
 
Change the value in the record check whether the data is changes in elasticsearch or not.(update yes working)

![image](https://github.com/harshchoudhary727/rivermysql/assets/66783694/4b1716cb-04fe-4b6f-8a5d-5ef465146ce5)



Delete the record check whether the data is changes in elasticsearch or not.(Delete yes working)
We have deleted the id on 2.

![image](https://github.com/harshchoudhary727/rivermysql/assets/66783694/7c3dbe4f-3805-479b-8f06-0ce00553504b)



addition of records:
![image](https://github.com/harshchoudhary727/rivermysql/assets/66783694/ed4e2d99-11c4-4904-ab5a-ca032e0f6a9c)



Report of test cases:
1. Change in Data in mysql and same is updated in elasticseach - Passed
2. Delete the Data in mysql and same is deleted in elasticseach - Passed
3. Addition of new Data  in mysql and same is added in elasticseach - Passed



 








