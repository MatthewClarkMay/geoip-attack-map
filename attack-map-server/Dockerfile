FROM python:3.9.13-buster

WORKDIR /app

RUN apt-get -y update
RUN apt-get -y install unzip

COPY attack-map-server/* ./attack-map-server/
COPY attack-map-server/static/* ./attack-map-server/static/

COPY requirements.txt ./

RUN unzip ./attack-map-server/static/flags.zip
RUN mv flags ./attack-map-server/static
RUN pip3 install -U -r requirements.txt
RUN find .

ENV GEOIP_REDIS_HOST localhost
ENV GEOIP_LAT 13.7457
ENV GEOIP_LONG 100.5025
ENV GEOIP_MAPBOX_TOKEN=please-change-here
ENV GEOIP_LEGEND1 "RTARF(CGIA)"
ENV GEOIP_LEGEND2 "Cyber GeoIP Attack"
ENV GEOIP_IMAGE_PATH "/static/logocyberB.png"

EXPOSE 8080

WORKDIR /app/attack-map-server

ENTRYPOINT ["./start.bash"]