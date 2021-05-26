FROM ubuntu:18.04

RUN apt update && apt install -y software-properties-common

RUN apt-add-repository ppa:ansible/ansible && apt update && apt install -y python3-pip ansible

RUN python3 -m pip install --upgrade pip

COPY requirements.txt /requirements.txt 

RUN pip3 install --upgrade -r /requirements.txt
