# test-s3-deploy

```
% make test-s3-website                                                                                                                      24-05-04 - 14:23:10
aws s3api create-bucket --bucket test-s3-website-99702bc | cat
{
    "Location": "/test-s3-website-99702bc"
}
aws s3api put-public-access-block --bucket test-s3-website-99702bc --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false"
aws s3api put-bucket-policy --bucket test-s3-website-99702bc --policy file://policy.json
aws s3 cp index.html s3://test-s3-website-99702bc/index.html
upload: ./index.html to s3://test-s3-website-99702bc/index.html   
aws s3 cp error.html s3://test-s3-website-99702bc/error.html
upload: ./error.html to s3://test-s3-website-99702bc/error.html  
aws s3 website s3://test-s3-website-99702bc --index-document index.html --error-document error.html
echo "Check it out"
Check it out
echo "http://test-s3-website-99702bc.s3-website-us-east-1.amazonaws.com"
http://test-s3-website-99702bc.s3-website-us-east-1.amazonaws.com
```
