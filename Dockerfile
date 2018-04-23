FROM jenkins:latest
USER root

# Install Node.js
RUN apt-get update -y
RUN apt-get install -y apt-utils
RUN apt-get install -y sudo
RUN apt-get install --yes curl
RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-198.0.0-linux-x86_64.tar.gz
RUN tar -zxvf google-cloud-sdk-198.0.0-linux-x86_64.tar.gz
RUN ./google-cloud-sdk-198.0.0-linux-x86_64/install.sh
RUN ./google-cloud-sdk-198.0.0-linux-x86_64/bin/gcloud init
RUN curl --silent --location https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install --yes nodejs
RUN apt-get install --yes build-essential
RUN npm i -g npm

RUN npm install serverless -g
RUN npm install --global serverless serverless-openwhisk

RUN npm config set prefix '~/.npm-global'
RUN export PATH=~/.npm-global/bin:$PATH
RUN npm i --save serverless-openwhisk

USER jenkins