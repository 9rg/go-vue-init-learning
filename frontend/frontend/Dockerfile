# Node.js の公式イメージをベースに使用
FROM node:16-alpine

WORKDIR /app

# 必要な依存関係をインストール
COPY package*.json ./
RUN npm install

# アプリケーションのソースコードをコピー
COPY . .

# アプリケーションをビルド
RUN npm run build

# デフォルトのポート設定
EXPOSE 8080

CMD ["npm", "run", "serve"]
