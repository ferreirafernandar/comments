all: terraform-init terraform-apply set-permision-key-pair move-key-pair ansible-playbook

terraform-init:
	cd terraform && terraform init 

terraform-apply:
	cd terraform && terraform apply -auto-approve  

set-permision-key-pair: terraform-apply
	cd terraform && chmod 400 comments.pem

move-key-pair: set-permision-key-pair
	cd terraform && mv comments.pem ../ansible/roles/comments.pem

ansible-playbook: move-key-pair
	cd ansible/roles && ansible-playbook -i ../hosts main.yml

terraform_destroy: move-key-pair
	cd terraform && terraform destroy -auto-approve	
