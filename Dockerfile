FROM python:3.6
ENV PYTHONUNBUFFERED 1

#Setup File System
RUN mkdir ds
ENV HOME=/ds
ENV SHELL=/bin/bash
VOLUME /ds
WORKDIR /ds

COPY requirements.txt /ds
COPY run_jupyter.sh /ds

# Setup
RUN apt-get update -y
RUN apt-get -y install binutils libproj-dev gdal-bin libgeoip1 python-opencv
RUN apt-get -y install gettext bash tesseract-ocr poppler-utils python-poppler
RUN apt-get -y install cmake

COPY nodesource_setup.sh /ds

RUN bash nodesource_setup.sh
RUN apt install -y nodejs
RUN apt install -y build-essential

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -y && apt-get install -y yarn

# RUN apt --fix-broken install (fix broken packages of debian)

RUN pip install --upgrade pip
RUN pip install -r requirements.txt


RUN pip install dlib
RUN pip install face_recognition
# RUN apt-get -y install python-skimage

# Open Ports for Jupyter
EXPOSE 8888


RUN chmod +x /ds/run_jupyter.sh

# Run the shell
CMD ["bash"]
