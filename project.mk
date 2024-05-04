PROJECT_NAME := test-s3-deploy

create-bucket:
	aws s3api create-bucket --bucket test-s3-deploy-$(GIT_REV)

