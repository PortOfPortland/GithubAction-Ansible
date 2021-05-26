FROM ubuntu:18.04

#install packages
RUN apt update && apt install -y software-properties-common python3 python3-pip

#upgrade pip
RUN python3 -m pip install --upgrade pip

#copy requirements over
COPY requirements.txt /requirements.txt

#install requirements
RUN pip3 install --upgrade -r /requirements.txt

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["bash","/entrypoint.sh"]
