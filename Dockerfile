FROM node:18-alpine as installer
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:latest as deployer
COPY --from=installer /app/build /usr/share/nginx/html

