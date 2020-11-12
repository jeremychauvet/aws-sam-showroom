.PHONY: install-sam build test deploy logs destroy start-api
STACK_NAME=sam-get-free-tier-limits
BUCKET_NAME=aws-sam-cli-managed-default-samclisourcebucket-900uctw6c80j

install-sam:
	brew tap aws/tap
	brew install aws-sam-cli
	sam --version

build:
	sam build --use-container

test: build
	sam local invoke

deploy: build
	sam deploy --guided

destroy:
	aws cloudformation delete-stack --stack-name $(STACK_NAME)

start-api:
	sam local start-api

logs:
	sam logs -n CostForecastFunction --stack-name cost-forecast --tail
