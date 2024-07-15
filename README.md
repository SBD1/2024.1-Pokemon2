# 2024.1-Pokemon2

## Alunos

- Arthur José Nascimento de Lima

## Rodando MKdocs

Crie um novo ambiente virtual com:

```bash
Python3 -m venv venv
```

Ative o ambiente com:

```bash
. venv/bin/activate
```
instale o mkdocs e mkdocs material:

```bash
pip3 install mkdocs
```

```bash
pip3 install mkdocs-material
```

Seu terminal agora deve imprimir (venv) antes do prompt, que é assim que você sabe que está dentro do ambiente virtual que acabou de criar.


Entre na pasta de Documentação:

```bash
cd docs
```

Rode a Documentação.

```bash
mkdocs serve
```

Saia do ambiente com:

```bash
deactivate
```

Fazer deploy da aplicação

```bash
mkdocs gh-deploy
```