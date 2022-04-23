Para este projeto segui os passos abaixo:

- Adiciona projeto enviado
- Dockeriza projeto enviado
- Criar imagem docker
- Envia imagem para DockerHub

- Adiciona Terraform
- Criar arquivo main.tf com modulos necessários para criação de uma instância EC2 na AWS

- Adiciona Ansible
- Usa ansible-galaxy para criação de roles para: docker e comments-api

- Adiciona observabilidade com Prometheus
- Cria docker-compose com: prometheus, grafana, cadvisor e redis
- Cria prometheus.yml
- Configura Promethues com jobs para: prometheus, cadvisor e comments-api

- Cria pipeline GitHub Actions para imagem Docker

Para execução do projeto

- Realizar exporte de AWS Access Key ID e AWS Secret Access Key para AWS CLI
- Adicionar IP em ansible/hosts
- Executar na raiz do projeto make all


Observações:
- O projeto foi realizado nos dias 21/04/2022 e 23/04/2022
- Afim de não extender muito mais o tempo de teste:

- Optei por não realizar configuração de Kubernets no modulo Terraform
- Optei por não realizar a publicação da Comments API utlizando deployment no modulo Ansible
- Optei pela não criação de pipeline para IaC
- Optei por não utlizar ferramentas de análise de código
- Optei por não realizar teste para Terraform


- No modulo de observabilidade optei pelo uso cAdvisor afim de gerar mais metrícas para análise

