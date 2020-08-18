FROM python:3.6-stretch
#ENV LANG C.UTF-8
MAINTAINER Vedang Pingle <vedang.pingle19@gmail.com>

RUN apt-get update && \
	apt-get install -y gcc make apt-transport-https ca-certificates build-essential

RUN python3 --version
RUN pip3 --version

RUN mkdir /home/lg_project

WORKDIR /home/lg_project

COPY requirements.txt .

RUN pip install --upgrade pip
RUN apt-get update
RUN pip install cmake==3.18.0
RUN apt-get install -y libgl1-mesa-glx
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python3", "lg_watcher.py"]

