Install docker-compose version 1.22 or greater

  - linux:

```
sudo apt remove docker docker-engine docker.io
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce -y
sudo usermod -aG docker $USER
```

    Log out your computer & log back in.

```
docker run hello-world
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

  - windows 10:

    - install github app from desktop.github.com
    - clone this repo from github.com/lsulibraries/Drupal8Scaffoldings
    - install docker app from https://docs.docker.com/docker-for-windows/install/   
        - you may need to create a free docker account
        - Hyper-V and Containers must be enabled in your Windows install.  Docker will attempt to enable them.
    - open powershell
        - try 'docker -v' and 'docker-compose -v' to see the installed versions
        - try 'docker run hello-world' (this will pull an image from the repo & run it)
        - go to docker toolbar icon, right-click, 'Settings'. in Settings panel, do 'Shared Drive', enable 'C' drive sharing.

  - osX:

    - to be added

  - after installing docker:
    - navigate in a shell to the folder with your docker-composer, then 'docker-compose up'


Note:  On first `docker-compose up`, the MySQL container will need a few seconds to prepare.  Until the database is built, it will give bad responses.  Wait a few seconds on first build.

see Drupal at localhost:5000

Some Commands:

 Starting a box -- least invasive to most invasive

docker-compose up -d
 
  - builds, using the docker-compose.yml file in this directory (d = detached)

docker-compose build --no-cache

  - hard rebuilds the individual containers without cached version of build files (if your updates aren't sticking for some reason, do this)

docker-compose down && docker volume prune && docker system prune && docker-compose build --no-cache && docker-compose up

docker

    ps    {show containers}

        -a      {including stopped ones}

    network     

        ls      {list}

        prune   {remove inactive ones}

    volume

        ls      {list}

        prune   {remove inactive ones}

                - this will destroy the container's persistent data

    run

        -it     {with interactive teletype, i.e. command line}

    inspect     {see all details about a container}


docker-compose

    up      {start the containers}

        -d  {in detached mode}

    down    {kill & remove the containers}

    exec container_name /bin/bash {or other program from inside the container}

    logs container_name     {show logs}
