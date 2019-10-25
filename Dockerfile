 FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

## start second base

FROM nginx
EXPOSE 80 
## Elasticbeanstalk maps auto to this exposed port herein
COPY --from=builder /app/build /usr/share/nginx/html 


