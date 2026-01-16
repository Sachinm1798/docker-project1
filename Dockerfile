FROM node:20-alpine

RUN mkdir -p /home/app

COPY ./app /home/app

# setting a default directory so that next commands executes in /home/app dir
WORKDIR /home/app

# execute the command npm install in /home/app 
RUN npm install

# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]
