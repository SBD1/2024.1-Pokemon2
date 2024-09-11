# 2024.1-Pokemon2

Repositório utilizado para criar o modelo da disciplina de banco de dados (SBD1) do jogo Pokémon

![Image](imagens/A.jpg)

## Alunos

| Nome                         | Matrícula   | 
| ---------------------------- | ----------- | 
| Arthur José Nascimento de Lima       | 190084600   | 
| Arthur Ferreira Rodrigues            | 200056981   | 
| Carlos Gabriel Cardoso Ramos | 211042327   |
| Fellipe Pereira da Costa Silva | 200017772   |

## Sobre
Nosso objetivo é construir um banco de dados funcional para um jogo no universo Pokémon, aplicando na prática os conceitos aprendidos em Sistemas de Bancos de Dados, incluindo a criação de tabelas para representar treinadores, Pokémon e batalhas, além de implementar as relações entre esses elementos.

## Link de Apresentações:

- Entrega do Trabalho - Módulo 1: [link](https://youtu.be/BzyO2wMSp1A)
- Entrega do Trabalho - Módulo 2: [link](https://youtu.be/O-SqRkyf6m8)
- Entrega do trabalho - Módulo 3: [link](https://youtu.be/wq15aTOOnYQ)

## Rodando o Jogo

Suba o docker compose

```bash
docker compose up -d
```

Crie um novo ambiente virtual com:

```bash
Python3 -m venv venv
```

Entre no manager

```bash
. venv/bin/activate
```

Instale os Requirements 

```bash
pip3 install -r game/requirements.txt
```

Rode o arquivo

```bash
python3 game/game_final.py 
```
