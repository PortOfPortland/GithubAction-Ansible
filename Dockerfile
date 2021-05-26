FROM ubuntu:18.04

RUN apt-add-repository ppa:ansible/ansible && apt update && apt install python3-pip ansible

COPY requirements.txt /requirements.txt 

RUN pip3 install --upgrade -r /requirements.txt