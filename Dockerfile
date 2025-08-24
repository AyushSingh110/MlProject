FROM python:3.8-slim-buster
WORKDIR /app
COPY . /app
RUN apt-get update && apt-get upgrade -y
RUN pip install -r requirements.txt
CMD ["python3", "application.py"]