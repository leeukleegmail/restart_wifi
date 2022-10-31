CONTAINER_NAME="restart_wifi"
CONTAINER_PORT="5001"

docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME
docker build --tag $CONTAINER_NAME .
docker run -d -p 5000:$CONTAINER_PORT --name $CONTAINER_NAME --restart unless-stopped -v $(pwd)/:/$CONTAINER_NAME $CONTAINER_NAME