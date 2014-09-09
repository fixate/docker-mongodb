# Dockerfile for Mongodb on phusion/baseimage 0.9.13 (Ubuntu 14.04)

[Docker index](https://index.docker.io/u/fixate/mongodb/)

### Build

```
make build
```


### Next steps

To run from docker index:

```shell
First run:
CONTAINER=$(docker run -d \
            --name fixate_mongodb \
             -p 27017 -p 28017 \
             -v="/var/mongodb/data:/var/mongodb/data:rw" \
             -v="/var/mongodb/logs:/var/mongodb/logs:rw" \
              -d "fixate/mongodb:0.0.1")
# Start up:
CONTAINER=$(docker start fixate_mongodb)
# Get the IP:
IP=`$(docker inspect -format='{{ .NetworkSettings.IPAddress }}' $CONTAINER )
```
