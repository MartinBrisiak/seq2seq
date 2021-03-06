FROM ubuntu:16.04

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y python3 python3-pip

RUN python3 -m pip install --upgrade pip==9.0.1
RUN python3 -m pip install \
                    numpy==1.16.4 \
                    jupyter \
                    tensorflow==1.9 \
                    keras \
                    matplotlib

RUN useradd -ms /bin/bash me
WORKDIR /home/me

COPY sequential.ipynb /home/me/sequential.ipynb
RUN chmod 777 /home/me/sequential.ipynb
COPY cornell-movie-dialogs-corpus /home/me/cornell-movie-dialogs-corpus
RUN chmod 777 -R /home/me/cornell-movie-dialogs-corpus
USER me
RUN mkdir /home/me/mount-this

# port 8888
ENTRYPOINT jupyter notebook --ip=0.0.0.0
# --NotebookApp.token='' --NotebookApp.password=''
