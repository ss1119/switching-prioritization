#!/bin/bash

if [ -z "$1" ]
then
	echo "Need to pass in IP to listen on as first parameter. Usually: ./start_client.sh 0.0.0.0"
	exit 1
fi

# typical way to call this: ./start_client.sh

echo "First shutting down running containers (if they exist), then starting new quicker/quicker:latest container."

sudo docker stop quicker_client && sudo docker rm quicker_client
sudo docker run --privileged --restart unless-stopped --name quicker_client --network quicker --volume=/Users/yudai/switching-prioritization-logs:/logs -d quicker/quicker:latest "$@"

echo "Now run    sudo docker logs -f quicker_client    to view output, or    sudo docker exec -it quicker_client bash    to login to container"