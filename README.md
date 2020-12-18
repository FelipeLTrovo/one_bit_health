# OneBitHealth

👋 Olá, Seja Bem-vindo(a) ao OneBitHealth.

O aplicativo criado no hackaton do Bootcamp do Onebitcode que tem a função de:
- Marcar consultas.
- Guardar histórico de saúde.
- Permitir o compartilhamento do usuário 'paciente' com o usuário 'médico' ou outros perfis.
- Centralizar e categorizar documentos relacionados a saúde do usuário.

Criadores:
- [César Ryan - linkedin](https://www.linkedin.com/in/cryanfigueiredo/)  
- [Claudi Martins de Freitas - linkedin](https://www.linkedin.com/in/claudimartinsdefreitas/)  
- [Emerson Duarte - linkedin](https://www.linkedin.com/in/emerson-duarte/)  
- [Fabio Muller - linkedin](https://www.linkedin.com/in/fabiomullerdev/)  
- [Fábio Vilhena - linkedin](https://www.linkedin.com/in/f%C3%A1bio-vilhena-468bab1b/)  
- [Felipe Leal Trovo - linkedin](https://www.linkedin.com/in/felipe-leal-trovo-843328141/)  
- [Igor Batista - linkedin](br.linkedin.com/in/igorcb)  

Visite o site:

- [https://one-bit-health.herokuapp.com/](https://one-bit-health.herokuapp.com/)  

# Principais tecnologias/Gemas
[Framework - Rails 6.0](https://rubygems.org/gems/rails/versions/4.2.6?locale=pt-BR)  
[Autenticação - Devise](https://github.com/heartcombo/devise)  
[Permissionamento - CanCanCan](https://github.com/CanCanCommunity/cancancan)  
[Teste Unitários - Rspec](https://github.com/rspec/rspec)  
[Documentação das classes - Annotate](https://github.com/ctran/annotate_models)  
[Cobertura de testes - Simplecov](https://github.com/simplecov-ruby/simplecov)  

# Exigências

**:warning: Atenção:** É necessário que os desenvolvedores usem o Docker no seu ambiente de desenvolvimento.

- **🛠 Modo Desenvolvimento Docker**
    - :computer: [Linux Ubuntu LTS](https://ubuntu.com/download/desktop)
    - 🐳 [Docker](https://docs.docker.com/engine/installation/) Deve estar instalado.
    - 🐳 [Docker Compose](https://docs.docker.com/compose/) Deve estar instalado.
    - **💡 Dica:** [Documentação do Docker](https://docs.docker.com/)

# Instalando

## 🐳 Modo Desenvolvimento com Docker

Após instalar o docker e docker-compose, estando na pasta raiz do projeto, execute:

```sh
docker-compose up
```

Para se certificar que os seus containers subiram corretamente, todos os containers deve estar com o status `UP`, execute:

```sh
docker-compose ps -a
```

Para acessar o container da aplicação, execute:

```sh
docker-compose run --rm web bash
```

Para acessar a instância do banco de dados, execute:

```sh
docker exec -it [nome do db] bash
```

Para derrubar e subir a instância do docker novamente, execute:

```sh
docker-compose down && docker-compose up
```
# Popular o banco
Acesse o container da aplicação, execute:

```sh
docker-compose run --rm web bash
```
## Apagar banco existente, criar, rodar migrações e popular o banco

Dentro do container da aplicação, execute:

```sh
rails db:reset
```
## Criar, rodar migrações e popular o banco

Dentro do container da aplicação, execute:

```sh
rails db:setup
```
## Em um banco recém criado

Dentro do container da aplicação, execute:

```sh
rails db:seed
```

🚀 :clap: Para visualizar o sistema basta acessar no navegador no endereço: [localhost:3000](localhost:3000)

# Como executar a Suíte de Teste

### Testes Unitários com Rspec, em um novo terminal execute:
```sh
docker-compose run --rm web bash
```

```sh
RAILS_ENV=test rails db:create
```

```sh
RAILS_ENV=test rails db:migrate
```

```sh
rspec
```

### Acessar cobertura de testes(Simplecov):
coverage/index.html

# Como subir servidor de e-mails(MailCatcher)

### Abra um novo terminal execute:
```sh
docker-compose run --rm mailcatcher
```
### Acesse a porta 1080 para ver o mailcatcher:
[localhost:1080](localhost:1080)

# Referências utilizadas

[1° Criar docker-compose para Ruby on Rails](https://docs.docker.com/compose/rails/)  
[2° Onebitcode - Como gerenciar as permissões (autorização) no Rails usando o Devise + CanCanCan](https://onebitcode.com/permissoes-de-acesso-rails-usando-devise-e-cancancan/)  
[3° Documentação do Rspec no Relishapp](https://relishapp.com/rspec)  
[4° Documentação do Rspec no RubyDoc](https://rubydoc.info/gems/rspec-rails/frames)  
[5° Better Specs for Rspec in Ruby on Rails](https://rubydoc.info/gems/rspec-rails/frames)  
[6° Shoulda Macthers IO](https://matchers.shoulda.io/)  
[7° Shoulda Macther Repository](https://github.com/thoughtbot/shoulda-matchers)
