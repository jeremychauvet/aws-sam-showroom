.PHONY: install-sam build test deploy destroy

install-sam:
	brew tap aws/tap
	brew install aws-sam-cli
	sam --version

build:
	sam build

test: build
	sam local invoke

deploy:
	sam deploy --guided

destroy:
	aws cloudformation delete-stack --stack-name sam-get-free-tier-limits