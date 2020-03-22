FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y python3 python3-pip

RUN python3 -m pip install --upgrade pip==9.0.1
RUN python3 -m pip install \
                    tensorflow-gpu==1.14 \
                    "numpy<1.17" \
                    jupyter \
                    matplotlib \
                    tqdm

RUN useradd -ms /bin/bash me
WORKDIR /home/me

COPY sequential.ipynb /home/me/sequential.ipynb
COPY seq2seq.ipynb /home/me/seq2seq.ipynb
RUN chmod 777 /home/me/sequential.ipynb
RUN chmod 777 /home/me/seq2seq.ipynb
COPY cornell-movie-dialogs-corpus /home/me/cornell-movie-dialogs-corpus
RUN chmod 777 -R /home/me/cornell-movie-dialogs-corpus
USER me
RUN mkdir /home/me/mount-this

# port 8888
ENTRYPOINT jupyter notebook --ip=0.0.0.0
# --NotebookApp.token='' --NotebookApp.password=''
