.PHONY: install-sam build test deploy destroy
STACK_NAME=sam-get-free-tier-limits
BUCKET_NAME=aws-sam-cli-managed-default-samclisourcebucket-900uctw6c80j

install-sam:
	brew tap aws/tap
	brew install aws-sam-cli
	sam --version

build:
	sam build

test: build
	sam local invoke

deploy: build
	sam deploy --stack-name $(STACK_NAME) --region eu-central-1 --s3-bucket $(BUCKET_NAME) --capabilities "CAPABILITY_IAM"

destroy:
	aws cloudformation delete-stack --stack-name $(STACK_NAME)