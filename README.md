```bash
docker build -t seq2seq .
```

```bash
docker run -it --rm -v <absolute_path>/some_folder:/home/me/mount-this --name seq2seq -p 8888:8888 seq2seq
```

```bash
docker build -t seq2seq:gpu -f Dockerfile-gpu .
```

```bash
docker run -it --gpus=all --rm -v <absolute_path>/some_folder:/home/me/mount-this --name seq2seq -p 8888:8888 seq2seq:gpu
```
