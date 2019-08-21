# version 8 of node
FROM balenalib/raspberrypi3-node:8

# Start ARM build
RUN [ "cross-build-start" ]

# create a directory for client
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# install app dependencies
COPY package*.json ./

RUN npm install 

# bundle app source
COPY . .

# End ARM build
RUN [ "cross-build-end" ]

# bind to port 3000
EXPOSE 3000
CMD ["npm", "run", "server"]
