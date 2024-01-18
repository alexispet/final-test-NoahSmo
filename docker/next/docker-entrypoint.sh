#!/bin/sh

echo "Executing docker-entrypoint"

if [ "$NODE_ENV" = "development" ]
then
    npm install
fi

echo "Executing run db:import"
npm run db:import

exec "$@"
