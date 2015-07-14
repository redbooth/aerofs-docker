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

## AeroFS On Docker, Generally
This repository also contains a `aerofs-docker.sh` file that can be used to
launch the AeroFS Private Cloud Appliance on any system that supports Docker
1.5. It has been tested with Ubuntu 14.04 LTS.

When booting using the `aerofs-docker.sh` script, please note the script will
run in the foreground (but can be daemonized). Once the script completes the
Dockerized installation, it will print `Running on http://0.0.0.0:80`.
Now you just need to point your Web browser to your machine's IP address to begin
[setting up your appliance](https://support.aerofs.com/hc/en-us/articles/204592814-How-do-I-set-up-my-AeroFS-Appliance-).

## Contact

For more information on how to launch the AeroFS Private Cloud appliance using
cloud-init, please consult our
[support documentation](https://support.aerofs.com/hc/en-us/articles/204736454)
For support please contact us at <support@aerofs.com>.
