# specify the node base image with your desired version node:<version>
FROM node:8-alpine

# install angular cli
RUN npm install -g @angular/cli

# create workdir for app
RUN mkdir -p /app

# create user for app
# `node` image adds `node` user as uid:1000.
# so if you want to map to user who has uid:1000,
# you can use `node` user.
RUN apk add --update --no-cache shadow
#RUN useradd user
#RUN chown user /app

# switch user
USER 1000
WORKDIR /app

# expose app's port
EXPOSE 4200

CMD ["sh"]

