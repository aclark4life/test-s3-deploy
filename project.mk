PROJECT_NAME := test-s3-deploy
BUCKET_NAME = test-s3-deploy-$(GIT_REV)

create-bucket:
	aws s3api create-bucket --bucket $(BUCKET_NAME) | cat

list-buckets:
	aws s3 ls | grep test

deploy:
	aws s3 cp index.html s3://$(BUCKET_NAME)/index.html

test-s3-deploy: create-bucket list-buckets deploy
