# Docker Test

## build
```
docker build -t hillwater/aws_batch_test:1.0 .
```


## run
```
docker run hillwater/aws_batch_test:1.0 java -version
```

## push to docker hub
```
docker login
docker push hillwater/aws_batch_test:1.0
```
