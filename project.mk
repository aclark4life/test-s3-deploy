PROJECT_NAME := test-s3-deploy
BUCKET_NAME = test-s3-website-$(GIT_REV)
define BUCKET_POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::$(BUCKET_NAME)/*"
        }
    ]
}
endef
export BUCKET_POLICY

create-bucket:
	aws s3api create-bucket --bucket $(BUCKET_NAME) | cat
	aws s3api put-public-access-block --bucket $(BUCKET_NAME) --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false"
	@echo $$BUCKET_POLICY > policy.json
	aws s3api put-bucket-policy --bucket $(BUCKET_NAME) --policy file://policy.json

create-website:
	aws s3 cp index.html s3://$(BUCKET_NAME)/index.html
	aws s3 cp error.html s3://$(BUCKET_NAME)/error.html
	aws s3 website s3://$(BUCKET_NAME) --index-document index.html --error-document error.html

test-s3-website: create-bucket html-index html-error create-website
