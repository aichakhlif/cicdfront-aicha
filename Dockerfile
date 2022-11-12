FROM nginx:1.17.1-alpine
RUN rm -rf /usr/share/nginx/html/*
COPY ./dist/crudtuto-Front /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
