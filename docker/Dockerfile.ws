FROM oven/bun:1

WORKDIR /usr/src/app

COPY ./packages ./packages
COPY ./package.json ./package.json
COPY ./bun.lock ./bun.lock
COPY ./apps/ws/package.json ./apps/ws/package.json

COPY ./turbo.json ./turbo.json


RUN bun install
RUN bun run db:generate

COPY . .

EXPOSE 8081

CMD ["bun", "run", "start:ws"]