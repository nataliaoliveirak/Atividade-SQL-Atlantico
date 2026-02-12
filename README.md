# Atividade 01: Modelagem e Consultas SQL 📚

Este repositório contém a resolução da primeira atividade do módulo de Banco de Dados. O projeto foca na gestão de uma biblioteca utilizando **SQLite** e a ferramenta **DBeaver**.

## 🛠️ Tecnologias Utilizadas

* 
**Banco de Dados:** SQLite.


* **Ferramenta de Gestão:** DBeaver 25.3.4.
* 
**Linguagem:** SQL.


## 📝 Questão 4: Implementação Prática (Biblioteca)

* **Modelagem Relacional:** Criação das tabelas `Livros`, `Membros` e `Emprestimos` com chaves primárias e estrangeiras.
* **Manipulação de Dados:** Inserção de registros para simular o funcionamento da biblioteca.
* 
**Consultas (Queries):** Scripts para responder questões de negócio, como:


* Identificação de livros emprestados por cidade.


* Relatório de membros com devoluções pendentes (`NULL`).


* Contagem de livros publicados antes do ano 2000.


* Identificação do livro mais popular da biblioteca.





## 🚀 Como visualizar

1. Basta abrir o arquivo `.sql` presente na raiz do projeto.
2. Os resultados das execuções podem ser visualizados na pasta `/screenshots`.

---

## 📖 Parte Teórica e Análise

### 1. Diagrama Entidade-Relacionamento (Questão 1)

* **1.1 Alunos e Trabalhos**: Relacionamento Muitos-para-Muitos (N:N). Um aluno realiza vários trabalhos e um trabalho pode ser feito por vários alunos.


* **1.2 Livros e Membros**: Relacionamento Muitos-para-Muitos (N:N). Um livro pode ser emprestado a vários membros ao longo do tempo, e um membro pode ter vários livros.


* **1.3 Médicos e Pacientes**: Relacionamento Um-para-Muitos (1:N). Um médico atende vários pacientes, mas cada paciente é atendido por um único médico.


### 2. Sistema de Berçário (Questão 2)

* 
**2.1 Entidades Identificadas**: Bebê, Mãe e Médico.


* **2.2 Relacionamentos**:
* 
**Mãe possui Bebê**: Relacionamento de 1 para N (uma mãe pode ter vários bebês cadastrados).

* 
**Médico realiza Parto**: Relacionamento de 1 para N (um médico pode ser responsável pelo parto de vários bebês).


### 3. Análise do Diagrama da Academia (Questão 3)

O diagrama representa o gerenciamento de matrículas e atividades de uma academia:

* **Entidades**: Clientes, Planos, Atividades e Horários.
* **Relacionamento Matrícula**: Um cliente pode ter zero ou vários planos `(0,n)`, e um plano pode ter zero ou vários clientes `(0,n)`.
* **Relacionamento Contém**: Um plano pode conter várias atividades `(0,n)`, mas uma atividade deve estar vinculada a pelo menos um plano `(1,n)`.
* **Relacionamento Ocorre**: Uma atividade ocorre em um horário fixo `(1,1)`, enquanto um horário pode comportar várias atividades `(1,n)`.

