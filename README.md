#Docker Containerisation#

To start the application

Step 1: create docker network

        docker network create mongo-network 
        
Step 2: building docker image for app
        
        docker build -f Dockerfile -t [username/]repository[:tag]

Step 3: run the app in container
        
        docker run -d -p -p 3000:3000 -e MONGO_DB_USERNAME=admin -e MONGO_DB_PWD=password --name myapp --net mongo-network mongo  [username/]repository[:tag]

Step 4: start mongodb-database
        
        docker run -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password --name mongodb --net mongo-network mongo    

Step 5: start mongo-express
       
       docker run -d -p 8081:8081 -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=password --net mongo-network --name mongo-express -e ME_CONFIG_MONGODB_SERVER=mongodb mongo-express   


#Docker Compose#
A simple multi-container application using Docker Compose, consisting of a Node.js web application, a MongoDB database, and the Mongo Express administration interface. It showcases how containerized services can communicate with each other through Docker’s internal networking while remaining easy to run on any local machine. The application dynamically reads data from MongoDB and displays it through a web UI.

<--- Start the application---->

Step 1: start mongodb and mongo-express and then access mongo-express UI under localhost:8080 from your browser

        docker-compose -f docker-compose.yaml up
           
Step 2: open mongo-express from browser
        
        http://localhost:8081
   
Step 3: create `my-db` database and `my-collection' collection and document with "{myid: 1, data: "some dynamic data loaded from db"}" in mongo-express
    

Step 4: Access you nodejs application UI from browser
        
        http://localhost:3000
    
    
