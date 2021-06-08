# git-hook-multi
  Super simple structure with delegating script to allow for multiple scripts per hook.
  
## Usage
  - Hooks are contained in `.githooks`
  - Scripts can be placed in Debian-style `hook-name.d/` directiories
  - A several scripts for use with awslabs/git-secrets is included as an example
  - Scripts must be made executable
  
## Todo
  - Merge delegating scripting to a single script in order to reduce repeated code
