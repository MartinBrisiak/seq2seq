```bash
docker build -t seq2seq .
```

```bash
docker run -it --rm --name seq2seq -p 8888:8888 seq2seq
```

```bash
docker build -t seq2seq:gpu -f Dockerfile-gpu .
```

```bash
docker run -it --rm --name seq2seq -p 8888:8888 seq2seq:gpu
```
