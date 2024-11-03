FROM steamcmd/steamcmd:latest

RUN dpkg --add-architecture i386 # 32 bit support
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y software-properties-common winbind lib32gcc-s1 wine xvfb

RUN mkdir /conan_exiles

ENV WINEARCH=win64 WINEPREFIX=/wine64

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME "/conan_exiles", "/wine64" "/config"
EXPOSE 7777/udp 7778/udp 27015/udp 7777/tcp 25575/tcp

ENTRYPOINT "/entrypoint.sh"
LABEL org.opencontainers.image.source=https://github.com/malinowskikam/conan_exiles_server

