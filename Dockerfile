FROM node:latest
RUN mkdir -p /usr/src/cave
WORKDIR /usr/src/cave
COPY package.json /usr/src/cave/
COPY package-lock.json /usr/src/cave/
RUN npm ci
RUN mkdir -p /usr/src/cave/bundles/telnet-networking
WORKDIR /usr/src/cave/bundles/telnet-networking
COPY bundles/telnet-networking/package*json /usr/src/cave/bundles/telnet-networking/
RUN npm install
RUN mkdir -p /usr/src/cave/bundles/cave
COPY bundles/cave/package*json /usr/src/cave/bundles/cave/
WORKDIR /usr/src/cave/bundles/cave
RUN npm install
WORKDIR /usr/src/cave
COPY . /usr/src/cave
EXPOSE 4000

CMD exec node ranvier >> log/ranvier.log
