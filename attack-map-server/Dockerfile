FROM python:3.9.13-buster

WORKDIR /app

RUN apt-get -y update
RUN apt-get -y install unzip

COPY AttackMapServer/* ./AttackMapServer/
COPY requirements.txt ./

RUN unzip ./AttackMapServer/static/flags.zip
RUN pip3 install -U -r requirements.txt
RUN find .

EXPOSE 8888

WORKDIR /app/AttackMapServer

ENTRYPOINT ["./start.bash"]