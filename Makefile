lint:
	docker run -it --rm -v "${PWD}:/repo" -w /repo hashicorp/terraform:1.2.8 fmt -check -recursive .
format:
	docker run -it --rm -v "${PWD}:/repo" -w /repo hashicorp/terraform:1.2.8 fmt -recursive .
