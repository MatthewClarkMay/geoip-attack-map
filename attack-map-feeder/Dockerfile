FROM python:3.9.13-buster

WORKDIR /app

RUN apt-get -y update
RUN apt-get -y install unzip


COPY attack-map-feeder/* ./attack-map-feeder/
COPY requirements.txt ./

RUN pip3 install -U -r requirements.txt setuptools==45
RUN find .

WORKDIR /app/DataServerDB
RUN wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz
RUN gunzip GeoLite2-City.mmdb.gz
RUN find .

WORKDIR /app/attack-map-feeder
ENTRYPOINT ["./start.bash"]