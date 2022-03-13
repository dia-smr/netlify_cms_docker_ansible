FROM node:14-buster AS build

EXPOSE 8000 9000

RUN npm install -g gatsby-cli@3

COPY gatsby_cms /opt/gatsby_cms/

WORKDIR /opt/gatsby_cms

RUN npm install \
&& gatsby build \
&& rm -rf /var/lib/apt/lists/*

CMD ["gatsby", "serve", "-H", "0.0.0.0", "--port", "8000"]

# FROM nginx:1.21-alpine

# COPY --from=build /opt/gatsby_cms/public /opt/gatsby_cms/