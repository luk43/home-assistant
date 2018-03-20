FROM python:3

LABEL maintainer.name "luk43"

VOLUME ["/config"]

COPY requirements.txt /

RUN apt update && apt install -y build-essential --no-install-recommends && \
  python3 -m pip install -r /requirements.txt && \ 
  apt purge -y build-essential && \
  apt-get -y autoremove && \
  rm -rf /var/lib/apt/lists/* && \
  apt-get -y clean

EXPOSE 8123
  
CMD [ "hass", "-c", "/config" ]