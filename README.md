# NXHost
Configuration microframework for NginX

# Author
All contents of this project are created by [Alex Furnica](https://github.com/chief93) and now they are composed in one repository

# Usage
You can use this tool in 2 ways:
 - automatic virtual host creation supported by `./site.sh` *(see `$ site.sh -h` for details)*
 - manual including of necessary features *(see items in `templates` for reference)*
 
 # Examples
 ## Creating a new virtual host with `site.sh`:
 
 ```
 $ site.sh create [template] [name] [type]
 ```
 
 Arguments:
 1. `template` - template used for virtual host. Can be:
    - `project` - virtual host is used for web access to a project (`php`, `mono` or `quark`)
    - `proxy` - virtual host is used as frontend-balancer/reverse proxy for some backend
    - `servies` - virtual host for serving web management of common used tools such `phpMyAdmin`, `GenghisApp`, `ScoutRealtime` and `LXC Web Panel`. You can disable unnecessary in generated virtual host configuration.
 2. `name` - virtual host' file name
 3. `type` - the type of virtual host. Used only when `template` is `project`. Can be:
    - `php` - generic php project *(at the moment supports only `php-fpm`)*
    - `mono` - virtual host for project served by `mono-fastcgi`
    - `quark` - special config for projects based on [Quark](https://github.com/Qybercom/quark)
    
 ## Enable all virtual hosts in `sites-available`
 > Note, that this feature DOES NOT auto-restart `NginX`. You must restart it manually.
 
 ```
 $ enableall.sh
 ```
 
 > Note, auto-enabling of all virtual hosts is included in `site.sh`