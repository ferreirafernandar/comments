Para este projeto segui os passos abaixo:

1 - Adiciona projeto enviado
2 - Dockeriza projeto enviado
3 - Criar imagem docker
4 - Envia imagem para DockerHub

5 - Adiciona Terraform
6 - Criar arquivo main.tf com modulos necessários para criação de uma instância EC2 na AWS

7 - Adiciona Ansible
8 - Usa ansible-galaxy para criação de roles para: docker e comments-api

9 - Adiciona observabilidade com Prometheus
10 - Cria docker-compose com: prometheus, grafana, cadvisor e redis
11 - Cria prometheus.yml
12 - Configura Promethues com jobs para: prometheus, cadvisor e comments-api

13 - Cria pipeline GitHub Actions para imagem Docker

Para execução do projeto

1 - Realizar exporte de AWS Access Key ID e AWS Secret Access Key para AWS CLI
2 - Adicionar IP em ansible/hosts
2 - Executar na raiz do projeto make all


Observações:
- O projeto foi realizado nos dias 21/04/2022 e 23/04/2022
- Afim de não extender muito mais o tempo de teste:

- Optei por não realizar configuração de Kubernets no modulo Terraform
- Optei por não realizar a publicação da Comments API utlizando deployment no modulo Ansible
- Optei pela não criação de pipeline para IaC
- Optei por não utlizar ferramentas de análise de código
- Optei por não realizar teste para Terraform


- No modulo de observabilidade optei pelo uso cAdvisor afim de gerar mais metrícas para análise

