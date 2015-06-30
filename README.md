# How to run selenium tests on Docker container.

This is an attempt to provide a docker container with pre-installed Java, ANT, Firefox and VNC. To run selenium test you have to import codebase in the docker container either manually or by editing `Dockerfile`.

### Steps:
1. Install docker. Follow https://docs.docker.com/installation/
2. Pull the dockerized selenium image by writing command `docker build -t "selenium:base-v1" .`
3. Run docker container by writing command `docker run -it -p 5900:5900 selenium:base-v1 x11vnc -create`.
4. Run Selenium tests by wriging your own command.
5. Connect the display by vnc using `http://docker-host-ip:5900`. In case if it asks password then use `123456`.
