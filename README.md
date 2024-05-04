# test-s3-deploy

## Create bucket

```
-<%>- make create-bucket
aws s3api create-bucket --bucket test-s3-deploy-00cdfc5 | cat
{
    "Location": "/test-s3-deploy-00cdfc5"
}
```

## List buckets

```
-<%>- make list-buckets | grep test
2024-05-04 09:57:16 test-s3-deploy-00cdfc5
2024-05-04 09:55:01 test-s3-deploy-2869a94
```

## Create index.html
```
-<%>- make index
-<%>- cat index.html 
<h1>Hello world</h1>
```

## Deploy
-<%>- make test-s3-deploy
aws s3api create-bucket --bucket test-s3-deploy-8130f1c | cat
{
    "Location": "/test-s3-deploy-8130f1c"
}
aws s3 ls | grep test
2024-05-04 09:57:16 test-s3-deploy-00cdfc5
2024-05-04 09:55:01 test-s3-deploy-2869a94
2024-05-04 10:19:38 test-s3-deploy-8130f1c
aws s3 cp index.html s3://test-s3-deploy-8130f1c/index.html
upload: ./index.html to s3://test-s3-deploy-8130f1c/index.html    
