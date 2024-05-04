PROJECT_NAME := test-s3-deploy
BUCKET_NAME = test-s3-deploy-$(GIT_REV)

create-bucket:
	aws s3api create-bucket --bucket $(BUCKET_NAME) | cat

list-buckets:
	aws s3 ls | grep test
	aws s3 website s3://$(BUCKET_NAME) --index-document index.html --error-document error.html

deploy:
	aws s3 cp index.html s3://$(BUCKET_NAME)/index.html
	aws s3 cp error.html s3://$(BUCKET_NAME)/error.html

test-s3-website: create-bucket deploy
