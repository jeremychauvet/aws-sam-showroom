.PHONY: install-sam


install-sam:
	brew tap aws/tap
	brew install aws-sam-cli
	sam --version