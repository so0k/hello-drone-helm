FROM nginx:1.12-alpine
ENV AUTHOR=HongKong

# change base directory nginx serves from
RUN set -ex \
    && cd /etc/nginx/conf.d/ \
    && sed -ie "s|/usr/share/nginx/html|/usr/share/nginx/temp|g"  default.conf

COPY index.html /usr/share/nginx/temp/index.html

WORKDIR /usr/share/nginx/temp
CMD sed -ie "s/Honestbee/"${AUTHOR}"/g" index.html ; nginx -g 'daemon off;'
