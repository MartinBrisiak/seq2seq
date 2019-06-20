FROM ubuntu:16.04

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y python3 python3-pip

RUN python3 -m pip install \
                    jupyter \
                    tensorflow \
                    pandas \
                    keras

RUN useradd -ms /bin/bash me
USER me
WORKDIR /home/me

COPY fra.txt /home/me/fra.txt
COPY dictionary.ipynb /home/me/dictionary.ipynb
ENTRYPOINT jupyter notebook --ip=0.0.0.0
# --NotebookApp.token='' --NotebookApp.password=''
