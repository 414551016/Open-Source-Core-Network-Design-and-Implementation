FROM debian:bookworm-slim
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
       tshark xvfb xterm xfonts-base fonts-dejavu-core scrot \
    && rm -rf /var/lib/apt/lists/*
