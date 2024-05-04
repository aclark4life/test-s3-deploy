# test-s3-deploy

```
$ make test-s3-website
aws s3api create-bucket --bucket test-s3-deploy-d30ef51 | cat
{
    "Location": "/test-s3-deploy-d30ef51"
}
aws s3 cp index.html s3://test-s3-deploy-d30ef51/index.html
upload: ./index.html to s3://test-s3-deploy-d30ef51/index.html    
aws s3 cp error.html s3://test-s3-deploy-d30ef51/error.html
upload: ./error.html to s3://test-s3-deploy-d30ef51/error.html    

```
