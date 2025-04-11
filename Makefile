init-terraform:
	@echo "Init Terraform"
	terraform -chdir=terraform init 

plan-terraform:
	@echo "Plan Terraform"
	terraform -chdir=terraform plan 

apply-terraform:
	@echo "Create EC2 instance"
	terraform -chdir=terraform apply -auto-approve

deploy-ansible:
	@echo "Deploy with ansible"
	ansible-playbook -i ansible/inventory.ini ansible/playbook.yml

destroy-terraform:
	@echo "Destruct EC2"
	terraform -chdir=terraform destroy -auto-approve
	rm -rf terraform/.terraform terraform/.terraform.lock.hcl terraform/terraform.tfstate terraform/terraform.tfstate.backup
