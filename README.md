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

