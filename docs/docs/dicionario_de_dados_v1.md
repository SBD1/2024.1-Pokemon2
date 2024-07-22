
# Dicionário de Dados

## Introdução

Um dicionário de dados é uma ferramenta fundamental para documentar e organizar as informações sobre os dados armazenados em um sistema. Ele funciona como um repositório centralizado que descreve em detalhes os elementos de dados, suas características e suas relações entre si.

## Desenvolvimento

### Item

|  Tabela | Item |
|---|---|
| Descrição | Representa todos os itens que podem ser utilizados no jogo, incluindo consumíveis, equipamentos, itens evolutivos, e outros. |
| Observação | Esta entidade pode ter chaves estrangeiras relacionadas a Pokémon compatíveis e eventos específicos. |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| ID_Item | Identificador único do item | INT | 4 | Primary Key, Not Null |
| Nome | Nome do item | VARCHAR | 100 | Not Null |
| Descrição | Descrição do item | TEXT | - |  |
| Efeito | Efeito do item | TEXT | - |  |
| Tipo de Item | Tipo do item | VARCHAR | 50 | Check (Consumível, Equipamento, Evolutivo, Aprendizado, Medicinais, Pokebolas, Batalha, Valiosos, Apriorísticos (Mega Evolução), Decoração, Eventos) |
| Preço | Preço do item | INT | 6 |  |
| Usos por Item | Número de vezes que pode ser usado | INT | 3 |  |
| Categoria | Categoria do item | VARCHAR | 50 | Check (Medicinal, Batalha, Aprimoramento, etc.) |
| ID_Pokemon_Compatível | Identificador do Pokémon compatível | INT | 4 | Foreign Key, Nullable |
| ID_Evento | Identificador do evento relacionado ao item | INT | 4 | Foreign Key, Nullable |

### Pokedex

|  Tabela | Pokedex |
|---|---|
| Descrição | Registro eletrônico que contém informações sobre os diferentes tipos de Pokémon encontrados e capturados pelo jogador. |
| Observação | Esta entidade recebe uma chave estrangeira da entidade Player. |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| ID_Pokedex | Identificador único da Pokédex | INT | 4 | Primary Key, Not Null |
| Nome | Nome da Pokédex | VARCHAR | 100 | Not Null |
| ID_Player | Identificador do jogador associado | INT | 4 | Foreign Key, Not Null |
| Data de Criação | Data de criação da Pokédex | DATE | - |  |
| Número de Pokémon Registrados | Número de Pokémon registrados na Pokédex | INT | 4 |  |
| Número de Pokémon Vistos | Número de Pokémon vistos na Pokédex | INT | 4 |  |
| Número de Pokémon Capturados | Número de Pokémon capturados na Pokédex | INT | 4 |  |
| Status de Completo | Status de completude da Pokédex | BOOLEAN | - | Check (Sim, Não) |
| Porcentagem de Completo | Porcentagem de completude da Pokédex | DECIMAL | 5,2 |  |
| Tipo de Pokedex | Tipo de Pokédex (Regional/Nacional) | VARCHAR | 50 | Check (Regional, Nacional) |

### Competição

|  Tabela | Competição |
|---|---|
| Descrição | Representa eventos competitivos onde jogadores e seus Pokémon podem participar para ganhar prêmios e reconhecimento. |
| Observação | Pode ter relacionamentos com entidades como Player e Pokémon. |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| ID_Competição | Identificador único da competição | INT | 4 | Primary Key, Not Null |
| Nome | Nome da competição | VARCHAR | 100 | Not Null |
| Descrição | Descrição da competição | TEXT | - |  |
| Localização | Localização da competição | VARCHAR | 100 |  |
| Tipo de Competição | Tipo de competição | VARCHAR | 50 | Check (Torneio, Campeonato, Desafio) |
| Nível de Dificuldade | Nível de dificuldade da competição | VARCHAR | 20 | Check (Iniciante, Intermediário, Avançado) |
| Formato da Competição | Formato da competição | VARCHAR | 50 | Check (Eliminatória, Pontuação) |
| Número de Rodadas | Número de rodadas da competição | INT | 3 |  |
| Critérios de Desempate | Critérios de desempate na competição | TEXT | - |  |


### Centro Pokémon

|  Tabela | Centro Pokémon |
|---|---|
| Descrição | Instalações onde os jogadores podem curar seus Pokémon, acessar o PC Box e utilizar outros serviços. |
| Observação | Esta entidade recebe uma chave estrangeira da entidade Região. |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| ID_Centro | Identificador único do Centro Pokémon | INT | 4 | Primary Key, Not Null |
| NPC | Lista de NPCs presentes no Centro Pokémon | TEXT | - |  |
| Pokemon | Lista de Pokémon atualmente no Centro Pokémon | TEXT | - |  |
| Pokeball | Número de Pokébolas disponíveis no Centro Pokémon | INT | 3 |  |
| Nome | Nome do Centro Pokémon | VARCHAR | 100 | Not Null |
| Horário de Funcionamento | Horário de funcionamento do Centro Pokémon | VARCHAR | 50 |  |
| Capacidade de Atendimento | Número de Pokémon que podem ser atendidos ao mesmo tempo | INT | 3 |  |
| Número de Enfermeiros | Número de enfermeiros no Centro Pokémon | INT | 2 |  |
| Serviços Oferecidos | Serviços oferecidos (Curar Pokémon, PC Box, Troca de Pokémon) | TEXT | - |  |
| Número de Máquinas de Cura | Número de máquinas de cura disponíveis | INT | 3 |  |
| ID_Região | Identificador da região onde o Centro Pokémon está localizado | INT | 4 | Foreign Key, Not Null |

### Líder de Ginásio

| Tabela | Líder de Ginásio |
|---|---|
| Descrição | Descreve um líder de ginásio, incluindo informações sobre sua especialidade e histórico. |
| Observação | Contém chaves estrangeiras para Personagem e Ginásio. |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| ID_Líder | Identificador único do Líder de Ginásio | INT | 4 | Primary Key, Not Null |
| Nome | Nome do Líder de Ginásio | VARCHAR | 100 | Not Null |
| ID_Personagem | Identificador do personagem associado ao Líder de Ginásio | INT | 4 | Foreign Key, Not Null |
| ID_Ginásio | Identificador do ginásio liderado | INT | 4 | Foreign Key, Not Null |
| Tipo de Pokémon Especialidade | Tipo de Pokémon de especialidade do líder | VARCHAR | 50 | Check (Fogo, Água, Planta, etc.) |
| Nível de Dificuldade | Nível de dificuldade do Líder de Ginásio | VARCHAR | 20 | Check (Iniciante, Intermediário, Avançado) |
| Biografia | Biografia do Líder de Ginásio | TEXT | - |  |
| Número de Vitórias | Número de vitórias do Líder de Ginásio | INT | 4 |  |
| Número de Derrotas | Número de derrotas do Líder de Ginásio | INT | 4 |  |
| Insígnia Oferecida | Nome da insígnia oferecida pelo Líder de Ginásio | VARCHAR | 100 |  |
| Região de Origem | Região de origem do Líder de Ginásio | VARCHAR | 100 |  |

### Liga Pokémon

| Tabela | Liga Pokémon |
|---|---|
| Descrição | Descreve a Liga Pokémon, incluindo localização, requisitos e outras características. |
| Observação | Contém chaves estrangeiras para Região e Ginásio. |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| ID_Liga | Identificador único da Liga Pokémon | INT | 4 | Primary Key, Not Null |
| Nome | Nome da Liga Pokémon | VARCHAR | 100 | Not Null |
| Localização | Localização da Liga Pokémon | VARCHAR | 100 |  |
| ID_Região | Identificador da região onde a Liga Pokémon está localizada | INT | 4 | Foreign Key, Not Null |
| Número de Insígnias Necessárias | Número de insígnias necessárias para participar da Liga Pokémon | INT | 2 |  |
| Descrição | Descrição da Liga Pokémon | TEXT | - |  |
| Quantidade de Experiência Ganho | Quantidade de experiência ganha ao vencer a Liga Pokémon | INT | 4 |  |
| Quantidade de Insígnias Oferecidas | Quantidade de insígnias oferecidas pela Liga Pokémon | INT | 2 |  |
| Dificuldade | Nível de dificuldade da Liga Pokémon | VARCHAR | 20 | Check (Iniciante, Intermediário, Avançado) |
| ID_Ginásio | Identificador do ginásio associado à Liga Pokémon (se aplicável) | INT | 4 | Foreign Key, Nullable |

### Personagem

| Tabela | Personagem |
|---|---|
| Descrição | Representa os personagens dentro do jogo, incluindo treinadores (Players) e personagens não jogáveis (NPCs). Os personagens têm atributos como nome, idade, e podem possuir Pokémon, capturar Pokémon e obter insígnias.|

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| ID_personagem | Identificador único do personagem | INT | 4 | Primary Key, Not Null |
| Nome | Nome do personagem | VARCHAR | 100 | Not Null |
| Idade | Idade do personagem | INT | 4 |  |

### NPC

| Tabela | NPC |
|---|---|
| Descrição | Subconjunto de Personagem, NPCs são personagens não jogáveis que interagem com o jogador e podem fornecer informações, desafios ou recompensas.|
| Observação | Contém chaves estrangeiras de Personagem e Regiao |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| ID_npc | Identificador único do NPC | INT | 4 | Primary Key, Not Null |
| FK_personagem | Chave estrangeira de personagem | INT | 4  | Not Null |
| Informacoes | Informacoes do NPC |VARCHAR | 100 | Not Null |
| Desafios | Desafios do NPC |VARCHAR | 100 | Not Null |
| Recompensas | Recompensas do NPC |VARCHAR | 100 | Not Null |
| FK_regiao| Chave estrangeira de regiao | INT | 4  | Not Null |

### Player

| Tabela | Player |
|---|---|
| Descrição | Subconjunto de Personagem, os jogadores são personagens controlados pelos usuários que podem capturar Pokémon, obter insígnias e interagir com o mundo do jogo.|
| Observação | Contém chaves estrangeiras de Personagem |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| ID_player | Identificador único do Player | INT | 4 | Primary Key, Not Null |
| FK_personagem | Chave estrangeira de personagem | INT | 4  | Not Null |

### Habilidade
| Tabela | Habilidade |
|---|---|
| Descrição | Descreve as habilidades que um Pokémon pode possuir, incluindo seus efeitos e tipos.|
| Observação | Contém chaves estrangeiras de Pokemon |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| ID_habilidade| Identificador único do Habilidade | INT | 4 | Primary Key, Not Null |
| Nome | Nome da Habilidade | VARCHAR | 100 | Not Null |
| Descricao | Nome da Descrição | VARCHAR | 100 | Not Null |
| FK_pokemon| Chave estrangeira de Pokemon | INT | 4  | Not Null |

### Tipo
| Tabela | Tipo |
|---|---|
| Descrição | Descreve o tipo de um Pokémon.|

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| ID_tipo| Identificador único do tipo do pokemon| INT | 4 | Primary Key, Not Null |
| Nome | Nome do tipo do pokemon | VARCHAR | 100 | Not Null |
| Descricao | Descrição do Tipo| VARCHAR | 100 | Not Null |

### Região
| Tabela | Região |
|---|---|
| Descrição | Descreve a região de um NPC.|

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| ID_regiao| Identificador único da Região| INT | 4 | Primary Key, Not Null |
| Nome | Nome do tipo da Região | VARCHAR | 100 | Not Null |
| Descricao | Descrição da Região | VARCHAR | 100 | Not Null |

| Versão | Autor         | Descrição da Alteração                                                                                                                                      | Data       |
|--------|---------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|
| 1.0    | Carlos Gabriel  | Criação da segunda versão do dicionário de dados. | 19/07/2024|
| 1.1    | Fellipe Pereira  | Adicionado algumas entidades. | 21/07/2024|
