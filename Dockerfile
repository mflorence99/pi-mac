FROM openjdk:8-jdk

# download and install Docker itself
# https://forums.docker.com/t/
#  how-to-run-docker-inside-a-container-running-on-docker-for-mac/16268/2
RUN apt-get update \
  && apt-get install -y apt-transport-https ca-certificates curl software-properties-common \
  && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
  && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu trusty stable" \
  && apt-get update \
  && apt-get install -y docker-ce

# node setup
ENV NODE_VERSION 7.9.0

# download and install
RUN apt-get update \
  && apt-get install xz-utils \
  && wget -q -O /tmp/node.xz https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz \
  && tar -xJf /tmp/node.xz -C /usr/local --strip-components=1 \
  && rm /tmp/node.xz

# install global node components
RUN npm install -g bower mversion gulp typescript ts-node @angular/cli polymer-cli@next

# copy ssh-config
COPY ssh-config /root/.ssh-config

# we use this all the time, so try to get a nice looking bash
COPY bashrc /root/.bashrc
RUN chmod u+x /root/.bashrc

# mount project
VOLUME /usr/src/app
WORKDIR /usr/src/app

# mount to make caches persistent
VOLUME /root/.bower
VOLUME /root/.npm
