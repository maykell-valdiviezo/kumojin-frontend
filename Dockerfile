FROM node:18.17.0 AS builder

WORKDIR /app

COPY package-lock.json package.json
COPY package-lock.json package-lock.json
RUN npm install --production

COPY . .
RUN npm run build

FROM node:18.17.0

WORKDIR /app
COPY --from=builder /app/ ./
EXPOSE 3000
EXPOSE 80

CMD ["npm", "start"]