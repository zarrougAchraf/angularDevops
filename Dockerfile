FROM node:18.12.1 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install -f
COPY . .
RUN npm run build
FROM nginx:1.21.1
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
