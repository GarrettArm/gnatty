Install docker-compose version 1.22 or greater

  - linux:

    - sudo apt remove docker docker-engine docker.io
    - sudo apt install apt-transport-https ca-certificates curl software-properties-common
    - curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    - sudo apt-key fingerprint 0EBFCD88
    - sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    - sudo apt update
    - sudo apt install docker-ce
    - sudo usermod -aG docker $USER
    { restart bash shell or ssh shell }
    - docker run hello-world
    - sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose 
        {replace with latest version}
    - sudo chmod +x /usr/local/bin/docker-compose


  - windows 10:

    - to be added

  - osX:

    - to be added





Note:  On first `docker-compose up`, the MySQL container will need a few seconds to prepare.  Until the database is built, it will give bad responses.  Wait a few seconds on first build.

phpMyAdmin runs at localhost:8888
apache runs at localhost:1337
drupal runs at localhost:8080

Some Commands:

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

    run container_name "/bin/bash"

    logs container_name     {show logs}
