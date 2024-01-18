FROM node:latest as build

COPY . /app/

WORKDIR /app

RUN npm install

FROM node:21.5-alpine as node

WORKDIR /app

COPY --from=build /app/package.json .
COPY --from=build /app/node_modules ./node_modules

EXPOSE 3000

COPY docker/next/docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT [ "docker-entrypoint" ]
CMD ["npm", "run", "start"]