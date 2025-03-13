FROM node:lts-buster
USER root
RUN apt-get update && \
    apt-get install -y ffmpeg webp git && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*
USER node
RUN git clone https://github.com/KHULEKANI702/MVELASE-MD-BOT.git /home/node/MVELASE-MD-BOT
WORKDIR /home/node/MVELASE-MD-BOT
RUN chmod -R 777 /home/node/MVELASE-MD-BOT/
RUN yarn install --network-concurrency 1
EXPOSE 7860
ENV NODE_ENV=production
CMD ["npm", "start"]
