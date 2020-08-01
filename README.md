# ansible-bender 

ansible-bender image for CI/CD base on Alpine Linux

<a href='https://ko-fi.com/V7V51ZXN7' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://az743702.vo.msecnd.net/cdn/kofi2.png?v=0' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>

## Example with nginx rol

Run the container:

```zsh
docker run --name nginxexample \
--rm --privileged \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(pwd):/usr/src:rw \
-it quay.io/cogentwebworks/ansible-bender:latest zsh
```

Download and install the role and the example:

```zsh
ansible-galaxy install nginxinc.nginx
wget https://raw.githubusercontent.com/jandradap/ansible-bender/master/examples/nginx-playbook.yml
```

Build and push to the local daemon, for other storage [check here](https://github.com/containers/libpod/blob/master/docs/podman-push.1.md).

```zsh
ansible-bender build nginx-playbook.yml
ansible-bender list-builds
ansible-bender push docker-daemon:bender-nginx:latest 1
exit
```

Check local images:

```zsh
docker images | grep bender-nginx
```

Run the example container and check:

```zsh
docker run -d -p 8080:80 bender-nginx

curl http://localhost:8080
```
---
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
License: MIT
---
## Thanks
base image on
[marshallford]https://github.com/marshallford/podman
[jandradap]https://github.com/jandradap/ansible-bender
[ansible-bender]https://github.com/ansible-community/ansible-bender