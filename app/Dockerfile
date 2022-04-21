FROM python:3.7.4-slim
COPY requirements.txt /
RUN pip3 install -r /requirements.txt
COPY . /app
WORKDIR /app
RUN chmod +x starter.sh
EXPOSE 8000
ENTRYPOINT ["./starter.sh"]