#choice the proper node image hub.docker.com
FROM alpine:3.20 AS BUILDER_IMAGE
WORKDIR /app/react.app

#copy package.json
COPY package.json .

#copy all our remaining files
COPY . .
#finally build our project
RUN npm run build

COPY --from=BUILDER_IMAGE /app/react.app/dist/ /app/react.app/dist/