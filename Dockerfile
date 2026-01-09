# παίρνουμε ffmpeg έτοιμο
FROM jrottenberg/ffmpeg:6.1-alpine AS ffmpeg

# hardened n8n
FROM docker.n8n.io/n8nio/n8n:latest

USER root

COPY --from=ffmpeg /usr/local/bin/ffmpeg /usr/local/bin/ffmpeg
COPY --from=ffmpeg /usr/local/bin/ffprobe /usr/local/bin/ffprobe

RUN chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe

USER node
