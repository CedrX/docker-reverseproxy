Docker compose debapache
=========

A docker-compose.yml file to create a functional web server under apache 2.4  


Requirements
------------

One free port for incoming connections over http protocol (by defaut 80)
Another free port for incoming connections over HTTPS protocol (by default 443)

Shared folders with container:
------------------------------------
*   ./sites-enabled --> /etc/apache2/sites-enabled
*   ./ssl/keys --> /etc/ssl/apache/keys/
*   ./ssl/certs --> /etc/ssl/apache/certs/
*   ./logs --> /var/log/apache2/

To build an start the container
----------------

```{r, engine='bash', docker-compose command}
docker-compose up
```
Ports by default: 
----------------
*   By default port 80 from host is redirected to port port 80 of container 
*   By default port 443 from host is redirected to port port 443 of container 
*   You can change this by editing docker-compose (section ports)

Author Information
------------------

Cedric TINTANET (Senior IT Architect)
