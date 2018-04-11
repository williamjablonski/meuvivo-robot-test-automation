# https://hub.docker.com/r/qualifylabs/robotframework-appium-docker/~/dockerfile/
FROM ubuntu:latest

MAINTAINER "William Melchior Jablonski" <williamjablonski@dellemc.com>

ENV DEBIAN_FRONTEND nointeractive
ENV GECKODRIVER_VER v0.15.0
ENV GECKODRIVER_URL https://github.com/mozilla/geckodriver/releases/download/${GECKODRIVER_VER}/geckodriver-${GECKODRIVER_VER}-linux64.tar.gz

RUN apt-get update -y \
    && apt-get install -y curl python-pip firefox dbus-x11 ttf-wqy-microhei \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
    && cd /usr/local/bin \
    && curl -L ${GECKODRIVER_URL} | tar xz \
    && pip install robotframework robotframework-selenium2library selenium

WORKDIR /robots

ADD . /robots

RUN chmod +x config/install.sh
RUN chmod +x run/run.sh

RUN /robots/config/install.sh

CMD ["/robots/run/run-meuvivo-PRE-PROD.sh"]