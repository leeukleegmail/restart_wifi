CONTAINER_NAME="restart_wifi"
CONTAINER_PORT="5001"

docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME
docker build --tag $CONTAINER_NAME --build-arg container_name=$CONTAINER_NAME .
docker run -d -p $CONTAINER_PORT:5000 --name $CONTAINER_NAME --restart unless-stopped -v $(pwd)/:/$CONTAINER_NAME $CONTAINER_NAME