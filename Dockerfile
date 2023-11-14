FROM node:20 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
#FROM node:14-alpine AS runtime
FROM gcr.io/distroless/nodejs20-debian12 AS runtime
WORKDIR /app
COPY  --from=build /app /app
CMD ["node", "app.js"]
