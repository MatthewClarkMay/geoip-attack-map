FROM python:3.9.13-buster

WORKDIR /app

RUN apt-get -y update
RUN apt-get -y install unzip

COPY attack-map-server/* ./attack-map-server/
COPY requirements.txt ./

RUN unzip ./attack-map-server/static/flags.zip
RUN pip3 install -U -r requirements.txt setuptools==45
RUN find .

EXPOSE 8888

WORKDIR /app/attack-map-server

ENTRYPOINT ["./start.bash"]