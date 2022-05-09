# grab the image from docker hub
FROM mileschou/lapis:alpine
RUN mkdir /code
WORKDIR /code
COPY . .
