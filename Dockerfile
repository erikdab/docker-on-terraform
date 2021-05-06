FROM node:14

RUN mkdir /myapp

# Create app directory
WORKDIR /myapp

# Copy app info and dependencies list
COPY package*.json /myapp

# Install dependencies
RUN npm install
RUN npm install -g nodemon

# Bundle app source
COPY . /myapp

EXPOSE 8080

CMD [ "nodemon", "app.js" ]
