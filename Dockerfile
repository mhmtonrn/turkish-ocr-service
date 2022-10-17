#FROM ubuntu:18.04
#FROM python:latest
#MAINTAINER mehmet onar
#
#RUN mkdir "dirname"
#RUN apt-get update
#RUN apt-get -y install \
#    tesseract-ocr \
#    tesseract-ocr-script-latn \
#    tesseract-ocr-tur \
#    libleptonica-dev \
#    libgl1-mesa-dev;
#RUN apt-get clean
#
#COPY ./requirements.txt /app/requirements.txt
#
#WORKDIR /app
#RUN pip install -r requirements.txt
#COPY . ./app
##CMD [ "python", "-m" , "flask", "run", "-h 0.0.0.0 -p 3000"]
#ENTRYPOINT [ "python" ]
#
#CMD [ "app.py" ]

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