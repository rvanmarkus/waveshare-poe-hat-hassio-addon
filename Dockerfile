ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
# Setup base
RUN \
    apk add --no-cache --virtual .build-dependencies \
    g++=10.3.1_git20211027-r0 \
    gcc=10.3.1_git20211027-r0 \
    libc-dev=0.7.2-r3 \
    linux-headers=5.10.41-r0 \
    make=4.3-r0 
    # py3-pip=20.3.4-r1 \
    # python3-dev=3.9.7-r4 
RUN apk --no-cache add \
    build-base \
    python3 \
    python3-dev \
    python3-tkinter \
    # wget dependency
    openssl \
    # dev dependencies
    bash \
    git \
    meson \
    py3-pip \
    sudo \
    # Pillow dependencies
    freetype-dev \
    fribidi-dev \
    harfbuzz-dev \
    jpeg-dev \
    lcms2-dev \
    libimagequant-dev \
    openjpeg-dev \
    tcl-dev \
    tiff-dev \
    tk-dev \
    zlib-dev

RUN apk add --update --no-cache py3-numpy


RUN \
    pip install \
    RPi.GPIO smbus pillow

COPY PoE_HAT_B_code/python /.poe-hat
RUN chmod -R a+x /.poe-hat

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]