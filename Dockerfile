FROM node:12.16.1-alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.17.9
COPY --from=builder /app/build /usr/share/nginx/html
