
## If you would like to use docker and Kubernetes sandbox environment , you can use below:
```
https://labs.play-with-docker.com/
https://labs.play-with-k8s.com/
```


# Getting started with the todoapp Docker practice

- Clone the below sample repository, or you can use any web application that you have

```
git clone https://github.com/bhartiiaf/toDoList-Docker.git
```

- cd into the directory
```
cd todoapp-docker/
```
- Create an empty file with the name Dockerfile
```
touch Dockerfile
```

- Using the text editor of your choice, paste the below content:
Note: Details about the below Dockerfile have already been shared in the video
```
FROM node:18-alpine as installer
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:latest as deployer
COPY --from=installer /app/build /usr/share/nginx/html
```

- Build the docker image using the application code and Dockerfile

```
docker build -t todoapp .
```
- Verify the image has been created and stored locally using the below command:
```
docker images | grep 'todoapp'
```

- Create a public repository named todoapp on hub.docker.com and push the image to remote repo
```
docker login
docker tag todoapp-docker:latest yourUserName/todoapp:latest
docker images
docker push yourUserName/todoapp:latest
```

- To pull the image to another environment, you can use the below command
```
docker pull yourUserName/todoapp:latest
```

- To start the docker container, use the below command

```
docker run -dp 3000:80 yourUserName/todoapp:latest
```

- Verify your app. If everything has gone correctly, your app should be listening on localhost:3000
- To enter(exec) into the container, use the below command

```
docker exec -it containername sh
or
docker exec -it containerid sh
```
- To view docker logs

```
docker logs containername
or
docker logs containerid
```

- To view the content of Docker container
```
docker inspect
```

- Cleanup the old docker images from local repo using below command:

```
docker image rm image-id
```
