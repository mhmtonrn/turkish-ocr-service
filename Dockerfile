FROM ubuntu:18.04
FROM python

WORKDIR /project

RUN apt-get update
RUN apt-get -y install \
    tesseract-ocr \
    tesseract-ocr-script-latn \
    tesseract-ocr-tur \
    libleptonica-dev \
    libgl1-mesa-dev;
RUN apt-get clean

ADD . /project
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python","app.py"]