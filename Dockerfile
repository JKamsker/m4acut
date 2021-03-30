FROM docker.pkg.github.com/jkamsker/l-smash/l-smash:2.14.7-beta-01

WORKDIR /app
ADD . ./

RUN rm -rf /build \
    && (automake || true) \
    && autoreconf -i \
    && ./configure \
    && make \
    && make install \
    && mkdir -p /build \
    && cp ./m4acut /build