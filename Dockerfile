# Static binaries που περιέχουν σίγουρα ffmpeg + ffprobe
FROM mwader/static-ffmpeg:7.0 AS ffmpeg

FROM docker.n8n.io/n8nio/n8n:latest

USER root

COPY --from=ffmpeg /ffmpeg /usr/local/bin/ffmpeg
COPY --from=ffmpeg /ffprobe /usr/local/bin/ffprobe

RUN chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe

USER node
