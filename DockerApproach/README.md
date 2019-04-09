# Install docker-compose version 1.22 or greater

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
```
Log out your computer & log back in.
```
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

# run the containers

```
cd DockerApproach
docker-compose up
```

# stop the container

```
ctrl-C
-or-
docker-compose stop 
```

Note:  On each webapp build, the MySQL container will need a few seconds to prepare.  You'll see when it's ready, when localhost:8888 gives a page.  Until the database is built, the server will give bad responses.  Wait a few seconds on first build.

You'll soon see a base install Drupal at localhost:5000.
And you'll see the drupal code inside webapp container mirrored on your computer at ./drupal_app/
When you do a drupal sync from webapp container, those files will be mirrored at ./drupal_sync/

## to wipe the drupal project and start clean:

You may delete the repo folder, then git clone it again.
Or you may:

```
docker-compose down
sudo rm -R ./drupal_app ./drupal_sync
docker volume prune
docker system prune
docker-compose up
```

## to edit code and immediately see effect:

You may edit the files in ./drupal_app as though you were changing the files in the container's drupal directory.

## to export config changes to share with others:

`docker-compose exec webapp drush config-export`


## to import config settings:

`docker-composer exec webapp drush config-import`

### some docker commands 

    ps    {show containers}

        -a      {including stopped ones}

    network     

        ls      {list}

        prune   {remove inactive ones}

    volume

        ls      {list}

        prune   {remove inactive ones}

                - this will destroy the container's persistent data


docker-compose

    up      {start the containers}

        -d  {in detached mode}
        --build {make the docker container if it doesn't exist}

    down    {kill & remove the containers}

    exec container_name /bin/bash {or other program from inside the container}

    logs container_name     {show logs}
