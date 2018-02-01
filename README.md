# AeroFS Docker

## AeroFS on Docker with CoreOS

This repository contains a `cloud-config.yml` file that can be used to launch
the AeroFS Private Cloud Appliance in one click on the hosting platform of your
choice. The only requirement is that CoreOS must be supported by your hosting
platform (CoreOS is supported by most public cloud hosting platforms, including
AWS, DigitalOcean and Azure).

When booting using cloud config, a web interface should become available on
`http://<ip>`. Installation progress can be monitored by visiting the web
interface.

Note that, due to the registry compatibility issue described in the following
section, CoreOS [1520.9.0](https://coreos.com/releases/#1520.9.0) is the last
version that will be able to run this script out-of-the-box. Newer releases need
to be [configured to use Docker 1.12](https://coreos.com/blog/toward-docker-17-in-container-linux).

## AeroFS On Docker, Generally

This repository also contains an `aerofs-docker.sh` file that can be used to
launch the AeroFS Private Cloud Appliance on any x86\_64 system that supports
Docker 1.7. It has been tested with Ubuntu 14.04 LTS.

Note that, at this time, the AeroFS docker images are hosted on a private
Docker registry v1. Support for v1 registry was dropped from Docker 1.13,
which means that, although the images themselves should work perfectly fine
with newer versions of Docker, this script will only work with Docker 1.12.6
or older.

When booting using the `aerofs-docker.sh` script, please note the script will
run in the foreground (but can be daemonized). Once the script completes the
Dockerized installation, it will print `Running on http://0.0.0.0:80`.
Now you just need to point your Web browser to your machine's IP address to begin
[setting up your appliance](https://support.aerofs.com/hc/en-us/articles/204592814-How-do-I-set-up-my-AeroFS-Appliance-).

## Best Practices
The host machine should preferably be running only AeroFS and nothing else as
AeroFS Private Cloud Appliance can be resource-intensive under heavy usages.

Please check out the [list of ports](https://support.aerofs.com/hc/en-us/articles/204624454)
used by the AeroFS Private Cloud Appliance. The host machine needs to reserve
these ports for the AeroFS Private Cloud Appliance and ensure the firewall is
allowing traffic to these ports.

## Contact

For more information on how to launch the AeroFS Private Cloud appliance using
cloud-init, please consult our
[support documentation](https://support.aerofs.com/hc/en-us/articles/204968364).
For support please contact us at <support@aerofs.com>.
