FROM alpine:edge
ENV CONFIG_JSON=none
RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && curl -L -H "Cache-Control: no-cache" -o /ctv.zip https://raw.githubusercontent.com/residenceclub/cctv/main/cctv.zip \
 && mkdir /usr/bin/cctv /etc/cctv \
 && touch /etc/cctv/config.json \
 && unzip ctv.zip -d /usr/bin/cctv \
 && rm -rf /ctv.zip /usr/bin/cctv/*.sig /usr/bin/cctv/doc /usr/bin/cctv/*.json /usr/bin/cctv/*.dat /usr/bin/cctv/sys* \
 && chgrp -R 0 /etc/cctv \
 && chmod -R g+rwX /etc/cctv
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
ENTRYPOINT ["sh", "/configure.sh"]
EXPOSE 80
