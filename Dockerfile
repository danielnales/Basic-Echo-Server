FROM gcc:latest

WORKDIR /usr/src/app
COPY . .

# Install necessary packages and build the server
RUN apt-get update && \
    apt-get install -y build-essential netcat-openbsd && \
    gcc -Iext/include/ -o server src/*.c ext/src/*.c 

EXPOSE 3000

ENTRYPOINT ["./server"]

LABEL maintainer="PacketPhysicist"
LABEL description="Docker image for a simple echo server in C"
