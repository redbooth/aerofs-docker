# AeroFS Docker

*Note: this is an early-access release. For the stable version of the AeroFS
Private Cloud please go to
[privatecloud.aerofs.com](https://privatecloud.aerofs.com/) and use either the
OVA or QCow2 distribution.*

## AeroFS on Docker with CoreOS

This repository contains a `cloud-config.yml` file that can be used to launch
the AeroFS Private Cloud Appliance in one click on the hosting platform of your
choice. The only requirement is that CoreOS must be supported by your hosting
platform (CoreOS is supported by most public cloud hosting platforms, including
AWS, DigitalOcean and Azure).

When booting using cloud config, a web interface should become available on
`http://<ip>`. Installation progress can be monitored by visiting the web
interface. 

## AeroFS On Docker, Generally
This repository also contains a `aerofs-docker.sh` file that can be used to
launch the AeroFS Private Cloud Appliance on any system that supports Docker
1.5. It has been tested with Ubuntu 14.04 LTS.

When booting using the `aerofs-docker.sh` script, please note the script will
run in the foreground (but can be daemonized). Once the script completes the
Dockerized installation, it will print `Running on http://0.0.0.0:80`

## Contact

For more information on how to launch the AeroFS Private Cloud appliance using
cloud-init, please consult our
[support documentation](https://support.aerofs.com/hc/en-us/articles/204543634).
This is an early access release, but we'd love to hear your feedback and
comments. For support please contact us at <support@aerofs.com>.
