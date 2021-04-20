FROM alpine:3.13.5

RUN apk update && \
    apk add lua5.3 lua-dev make git luajit luarocks libressl-dev gcc libc-dev

RUN /usr/bin/luarocks-5.1 install luacrypto &&  \
    /usr/bin/luarocks-5.1 install lua-resty-http &&  \
    /usr/bin/luarocks-5.1 install lua-resty-hmac
RUN cd /tmp \
    && git clone https://github.com/LuaDist/squish.git \
    && cd squish \
    && make install \
    && cp make_squishy /usr/local/bin/make_squishy \
    && chmod +x /usr/local/bin/make_squishy \
    && cd \
    && apk del --purge make git libressl-dev gcc libc-dev \
    && rm -rf /var/cache/apk/* /tmp/*

WORKDIR /build

CMD [ "/usr/local/bin/squish" ]