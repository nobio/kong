#ln -s /share/homes/nobio/docker-compose /usr/local/bin
docker-compose pull
docker-compose stop
docker-compose down 
docker-compose up -d --remove-orphans
#docker system prune --force
#docker volume prune --force
docker-compose logs -f
