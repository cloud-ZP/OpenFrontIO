FROM node:24-slim

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci

COPY . .

# フロントエンドだけビルド（サーバーはTSXで動く）
RUN npm run build-prod

EXPOSE 3001

CMD ["npx", "tsx", "src/server/Server.ts"]
