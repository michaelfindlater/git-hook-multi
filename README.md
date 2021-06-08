# git-hook-multi
  Super simple structure/delegating script to allow for multiple scripts per hook.
  
## Usage
  - Hooks are contained in `.githooks`
  - Scripts can be placed in Debian-style `hook-name.d/` directiories
  - A several scripts for use with awslabs/git-secrets is included as an example
  - Scripts must be made executable

### Setup
#### Git >=2.9
````
git config core.hooksPath .githooks
````

#### Git <2.9
Setup is possible by using a symbolic linking.
````
find .git/hooks -type l -exec rm {} \; && find .githooks -type f -exec ln -sf ../../{} .git/hooks/ \;
````
  
## Todo
  - ...
