docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker build $PSScriptRoot  -t crazyyoshi/personal-archives:latest
docker run -d -p 80:80 -p 81:81 -p 82:82 -p 83:83 crazyyoshi/personal-archives:latest