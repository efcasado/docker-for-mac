# Docker for Mac

[Docker](https://www.docker.com/) is an excellent tool to create standardised
and fully isolated development environments. Sadly, Docker's I/O performance
on macOS is quite underwhelming, to say the least, which renders most efforts
at creating Docker-based workflows on macOS useless.

Docker Desktop 4.6 added (experimental) support for `virtiofs`-based accelerated
directory sharing. Enabling this experimental feature seems to have a dramatic
impact on I/O performance. Some people claim their Docker-based workflows are
now running up to 4x faster.

However, this feature is only available for developers running macOS 12.2 or
newer. Thus, developers running old versions of Docker and/or macOS are still
in need of alternatives to Docker Desktop on Mac to be able to get a near-native
developer experience when running Docker-based workflows on Mac.

This is what this repository is all about. An unnoficial alternative to
[Docker Desktop on Mac](https://docs.docker.com/desktop/mac/install/) aiming at
offering a near-native development experience to developers running Docker
on Mac.


### Requirements

- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/)


### Getting Started

```sh
source .env && vagrant up
```


```
vagrant plugin install vagrant-env
```

```sh
brew install direnv
```

https://direnv.net/docs/hook.html

```
direnv allow
```

```sh
brew install vagrant
```

```sh
vagrant plugin install vagrant-vbguest
```

```sh
vagrant up
vagrant reload
vagrant suspend
vagrant resume
vagrant halt
vagrant destroy
```

```sh
docker context create workbox --docker "host=ssh://vagrant@192.168.56.4"
docker context use workbox
```

```sh
docker context use default
time USE_DOCKER=1 make
# => 0.28s user 0.24s system 1% cpu 32.273 total

docker context use workbox
time USE_DOCKER=1 make
# => 0.35s user 0.14s system 1% cpu 25.123 total

USE_DOCKER=0 make
# => 34.23s user 4.89s system 215% cpu 18.169 total
```
