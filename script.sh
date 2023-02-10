#!/bin/bash

echo "---------------------------------------------------"
read -p "Enter tha name of network you want to run:->" net
echo "---------------------------------------------------"
docker network create --driver bridge $net
echo "---------$net, network is created-----------------"

i=1
while [[ $i -lt 7 ]]
do
	echo "-----------------------------------------"
	read -p "Enter the name of the container:->" con
	echo "------------------------------------------"
	docker run -dt --name $i$con --network $net ubuntu
	echo "---------$i$con, container is running------"
       echo "--------------------------------------------"	
	i=`expr $i + 1`
done
echo "------------------------------------------------------------"
read -p "Enter the name of container you want to link with all:->" a
echo "-------------------------------------------------------------"
docker run -dt --name $a --network $net --link $con:2$con --link 2$con:3$con --link 3$con:4$con --link 4$con:5$con --link 5$con:6$con --link 6$con:1$con busybox sh
echo "--------------------------------------------------------------------------"
echo "-------------------------------DONE---------------------------------------"
echo "--------------------------------------------------------------------------"


