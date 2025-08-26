# For simulation 

# the commands have to be run in order to work in this cp for simulation is
sudo apt-get update
sudo apt-get install -y docker.io docker-compose
sudo service docker start
sudo usermod -aG docker $USER
newgrp docker
sudo service docker start
cd ~/ros2_ws/src/fastbot_ros2_docker/simulation

# /Building and running docker/ SKIP
docker build -f Dockerfile.fastbot-ros2-gazebo -t regvith-cp22:fastbot-ros2-gazebo .
docker build -f Dockerfile.fastbot-ros2-slam -t regvith-cp22:fastbot-ros2-slam .
docker build -f Dockerfile.fastbot-ros2-webapp -t regvith-cp22:fastbot-ros2-webapp .

# Pull the image
docker-compose pull
# launching the conatiners
docker-compose up

# For real robot 
## Important ## Install docker compose version 2.0 or above, else the setup is bound to fail
sudo apt update 

sudo apt install docker.io -y 

sudo systemctl start docker 

sudo systemctl enable docker

sudo apt update 

sudo apt install -y ca-certificates curl gnupg lsb-release

sudo mkdir -p /etc/apt/keyrings curl -fsSL https://download.docker.com/linux/ubuntu/gpg | 
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg]
https://download.docker.com/linux/ubuntu
$(lsb_release -cs) stable" |
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update

 sudo apt install docker-compose-plugin -y

# Git clone the repository inside pi in ros2_ws 
cd ros2_ws/
git clone https://github.com/Regvith/fastbot_ros2_docker

# Skip and go to compose directly
cd ros2_ws/real
docker build -t real-fastbot .

# compose pull and build
docker compose pull
docker compose up 
