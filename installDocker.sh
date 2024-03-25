#!/bin/bash
echo "this script uses sudo"

#https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#set-up-the-repository 
sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
check=`sudo apt-key fingerprint '0EBFCD88' |grep "9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88"`
if [[ -z $check ]]
then

  echo "Failed fingerprint check"
  exit -1
fi
echo $check
echo "passed fingerprint check"

sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-compose-plugin

echo "Remember to sudo usermod -aG docker $USER"
echo "Also, groups don't refresh until you log out and back in."
