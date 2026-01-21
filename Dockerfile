FROM node:24-slim

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci

COPY . .

RUN npm run build-prod
RUN mkdir -p static && cp index.html static/index.html

EXPOSE 3000

CMD ["npx", "tsx", "src/server/Server.ts"]
