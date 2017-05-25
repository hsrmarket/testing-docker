# testing-docker

## Info
* to change DB content, switch out elephant/dump.sql
* Play Framework App is based on rest-interface/android_testing

### requirements
* docker --> www.docker.com

## How to use

### 1) fetch everything & switch to SU
```shell
$ git clone https://github.com/hsrmarket/testing-docker.git
$ su -
```

### 2) build Postgresql DB
```shell
# cd ./testing-docker/elephant/
# docker build -t elephant .
# docker images
```

### 3) build Play Framework App
```shell
# cd ../kobold
# docker build -t kobold .
# docker images
```

### 4) run Postgresql DB
* the name has to be exactly like below (because the play framework app is already preconfigured to the name)
* wait about 30s before going to next step (because importing dump takes time)

```shell
# docker run --name flying_dumbo -d -p 5432:5432 elephant
# docker ps -a
```

### 5) run Play Frameworh App
```shell
# docker run --name green_kobold --link flying_dumbo:elephant -d -p 9000:9000 kobold
# docker ps -a
```

### 6) check with Postman or shell
```
$ curl -X GET http://localhost:9000/api/articles/books
```

### 7) kill instance
* to restart, follow step 4 & 5

```
# docker stop green_kobold flying_dumbo
# docker rm green_kobold flying_dumbo
```
