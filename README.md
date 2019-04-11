# Drupal8Scaffoldings
experiments of various builds of Drupal 8

linux:

apt install git

windows:

Install git from:  https://git-scm.com/download/win

  default settings are ok.  I select "use git only from git bash" and then open git bash as my command prompt.

  CRUCIAL -- "Checkout as-is, commit as-is".  Otherwise Windows will use \n\r line endings which will break the code in the containers and result in a "/usr/bin/env: 'bash\r': No such file or directory" error.
  
  If you already have this error post-install, reset the git lineendings config to "\n", with:
  
    git config --system core.autocrlf false
    git config --system core.whitespace cr-at-eol
    

  Then in git bash, 

  from whatever directory you want the repo folder pulled to:

  `git clone --recursive https://github.com/lsulibraries/Drupal8Scaffoldings`
  
  `cd Drupal8Scaffoldings/DockerApproach`

See DockerApproach/README.md for more instruction
