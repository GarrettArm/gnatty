A Drupal8 dev box for lib.lsu.edu

-------------------------------------------------------------------------------------------

## Build, if your computer's got the dependencies

  1. if on linux, `usermod -a www-data` to add yourself to the www-data group

  1. `git clone --recurse-submodules https://github.com/lsulibraries/gnatty`

  1. `cd gnatty`

  1. change the passwords in the file ".env"

  1. copy R/TechInit/Drupal8DbAuthoritative/drupal8_sandbox_db.sql to ./db_shared/

  1. `docker-compose up --build -d` 

  1. *The next steps will fail if the database is not yet initialized.  Keep typing `docker-compose logs` until it shows a line "MySQL init process done. Ready for start up."*

  1. `docker-compose exec webapp chown -R www-data:www-data /drupal_sync` (fixes a permissions error)

  1. `docker-compose exec webapp drush config-import -y`

  1. See the app at localhost:5000

---------------------------------------------------------------------------------------

## if you need dependecies:

### Git

##### windows10:

Install git from:  https://git-scm.com/download/win

  CRUCIAL -- "Checkout as-is, commit as-is".  Otherwise Windows will use \n\r line endings which will break the code in the containers and result in a "/usr/bin/env: 'bash\r': No such file or directory" error.

  If you already have this error post-install, reset the git lineendings config to "\n", with:
  
    git config --system core.autocrlf false
    git config --system core.whitespace cr-at-eol
    

  Also, I select "use git only from git bash" and then open git bash as my command prompt.


  Then in git bash, 

  from whatever directory you want the repo folder pulled to:

  `git clone --recurse-submodules https://github.com/lsulibraries/gnatty`
  
  `cd gnatty`

### Docker-Compose, version 1.22 or greater

##### linux:

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

##### windows10:

  1. install docker app from https://docs.docker.com/docker-for-windows/install/   
    - you may need to create a free docker account
    - "Use linux containers"
    - Hyper-V and Containers must be enabled in your Windows install.  Docker will attempt to enable them.
    - you may need to restart your computer.

  1. go to docker toolbar icon, right-click, 'Settings'. in Settings panel, do 'Shared Drive', enable drive sharing on the C drive (or whichever drive the repo was cloned to).  (This setting allows docker access to "Drupal8Scaffoldings" folder, but not any other folder on C.) 

  1. open PowerShell or gitbash (but not PowerShell ISE)
    - try `docker -v` and `docker-compose -v` to see whether they both installed
    - try `docker run hello-world` (this will pull an image from the repo & run it)


##### osX:

    - to be added

------------------------------------------------------------------------------------

### Common commands


#### - starting the containers

`docker-compose up --build -d`

#### - stopping the containers

```
docker-compose down
-or-
ctrl-C
```

#### - viewing the logs

`docker-compose logs`

#### - sharing config changes:

 - Use git on your host computer to push or pull "drupal_sync" to github.
 - the folder is live synced inside the drupal container.

 - Exporting config changes to drupal_sync/:

    `docker-compose exec webapp drush config-export -y`

 - Importing config settings from drupal_sync/:

    `docker-compose exec webapp drush config-import -y`

#### - sharing theme changes:

 - Use git on your host computer to push or pull "gnatty_theme" to github.
 - the folder is live synced inside the drupal container. 

#### - adding a drupal module:

 - add the module name + version into ./config/drupal/drupal_composer.json
 - wipe and rebuild the drupal container + its volume

    1. `docker-compose down`
    1. `docker volume rm -f gnatty_drupal_data`
    1. `docker image rm gnatty_webapp`
    1. `docker system prune`
    1. `docker-compose up --build -d`

#### - exporting the mysql database:

 - `docker-compose exec db bash` (from host computer)
 - `mysqldump -u {username} -p --all-databases --single-transaction > /docker-entrypoint-initdb.d/{somename}.sql` (from db container)
 - `exit`(returning to host computer)
 - the sql dump will be at ./db_shared/{somename}.sql

#### - importing a mysql database:

 - copy the sql dump you wish to import, to the ./db_shared/ folder
 - `docker-compose down`
 - `docker volume rm gnatty_db_data`
 - `docker-compose up --build -d`
 - wait for a few minutes/hours while the db ingests

----------------------------------------------------------------------------------

### some docker commands 

docker-compose

    up      {start the containers}

        -d  {in detached mode}
        --build {make the docker image if it doesn't yet exist}

    down    {kill & remove the containers,
             preserves volumes and images}

    exec container_name /bin/bash {or other program from inside the container}

    logs     {show logs}

docker

    ps    {show containers}

        -a      {including stopped ones}

    volume

        ls      {list}

        prune   {remove inactive volumes}

                - this will destroy the container's persistent data

        rm      {removes specific volume}