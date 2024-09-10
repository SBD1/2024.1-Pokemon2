# Dicionário de Dados

## Introdução

Um dicionário de dados é uma ferramenta fundamental para documentar e organizar as informações sobre os dados armazenados em um sistema. Ele funciona como um repositório centralizado que descreve em detalhes os elementos de dados, suas características e suas relações entre si.

## Desenvolvimento

### **Treinador**

| Tabela   | Treinador |
|----------|------------------|
| Descrição | Armazena informações sobre os treinadores Pokémon, incluindo nome e atributos gerais. |
| Observação | Treinadores podem possuir times de Pokémon e participar de batalhas. |

| Nome          | Descrição                  | Tipo de Dado | Tamanho | Restrição de Domínio       |
|---------------|----------------------------|--------------|---------|----------------------------|
| id            | Identificador único         | SERIAL       | N/A     | PRIMARY KEY                |
| qtdPokeball   | Quantidade de Pokébolas     | INTEGER      | N/A     | NOT NULL                   |
| qtdGreatBall  | Quantidade de Great Balls   | INTEGER      | N/A     | NOT NULL                   |
| qtdUltraBall  | Quantidade de Ultra Balls   | INTEGER      | N/A     | NOT NULL                   |
| qtdMasterBall | Quantidade de Master Balls  | INTEGER      | N/A     | NOT NULL                   |
| timePokemonId | ID do time de Pokémon       | INTEGER      | N/A     | FOREIGN KEY (TimePokemon)  |

### **Rota**

| Tabela   | Rota |
|----------|------------------|
| Descrição | Representa as rotas do mundo Pokémon onde ocorrem encontros com Pokémon selvagens e NPCs. |
| Observação | Cada rota está associada a uma cidade de origem e destino. |

| Nome          | Descrição                  | Tipo de Dado | Tamanho | Restrição de Domínio       |
|---------------|----------------------------|--------------|---------|----------------------------|
| id            | Identificador único         | SERIAL       | N/A     | PRIMARY KEY                |

### **RotaRota**

| Tabela   | RotaRota |
|----------|------------------|
| Descrição | Define a relação entre rotas que se conectam. |
| Observação | Permite a navegação entre diferentes rotas. |

| Nome          | Descrição                       | Tipo de Dado | Tamanho | Restrição de Domínio       |
|---------------|---------------------------------|--------------|---------|----------------------------|
| id            | Identificador único             | SERIAL       | N/A     | PRIMARY KEY                |
| origemRotaId  | ID da rota de origem            | INTEGER      | N/A     | FOREIGN KEY (Rota)         |
| destinoRotaId | ID da rota de destino           | INTEGER      | N/A     | FOREIGN KEY (Rota)         |

### **RotaRotaCidade**

| Tabela   | RotaRotaCidade |
|----------|------------------|
| Descrição | Define a relação entre rotas e cidades que elas conectam. |
| Observação | Permite a navegação entre diferentes cidades por rotas específicas. |

| Nome            | Descrição                        | Tipo de Dado | Tamanho | Restrição de Domínio       |
|-----------------|----------------------------------|--------------|---------|----------------------------|
| id              | Identificador único              | SERIAL       | N/A     | PRIMARY KEY                |
| origemRotaId    | ID da rota de origem             | INTEGER      | N/A     | FOREIGN KEY (Rota)         |
| destinoCidadeId | ID da cidade de destino          | INTEGER      | N/A     | FOREIGN KEY (Cidade)       |

### **RotaCidadeRota**

| Tabela   | RotaCidadeRota |
|----------|------------------|
| Descrição | Relaciona uma cidade com as rotas que a conectam a outras cidades. |
| Observação | Permite determinar as rotas disponíveis para cada cidade. |

| Nome            | Descrição                        | Tipo de Dado | Tamanho | Restrição de Domínio       |
|-----------------|----------------------------------|--------------|---------|----------------------------|
| id              | Identificador único              | SERIAL       | N/A     | PRIMARY KEY                |
| origemCidadeId  | ID da cidade de origem           | INTEGER      | N/A     | FOREIGN KEY (Cidade)       |
| destinoRotaId   | ID da rota de destino            | INTEGER      | N/A     | FOREIGN KEY (Rota)         |

### **Cidade**

| Tabela   | Cidade |
|----------|------------------|
| Descrição | Armazena as cidades presentes no mundo Pokémon, que podem ter ginásios, centros Pokémon, e NPCs. |
| Observação | Cada cidade pode estar associada a um ginásio e rotas que a conectam a outras cidades. |

| Nome               | Descrição                          | Tipo de Dado | Tamanho | Restrição de Domínio       |
|--------------------|------------------------------------|--------------|---------|----------------------------|
| id                 | Identificador único                | SERIAL       | N/A     | PRIMARY KEY                |
| nome               | Nome da cidade                     | TEXT         | N/A     | NOT NULL                   |
| possui_pokemart     | Indica se possui PokéMart          | BOOLEAN      | N/A     | NOT NULL                   |
| possui_centro_pokemon | Indica se possui Centro Pokémon   | BOOLEAN      | N/A     | NOT NULL                   |
| possui_ginasio      | Indica se possui Ginásio           | BOOLEAN      | N/A     | NOT NULL                   |

### **Lider**

| Tabela   | Lider |
|----------|------------------|
| Descrição | Armazena informações sobre os líderes de ginásios Pokémon. |
| Observação | Cada líder está associado a um ginásio específico e possui insígnias para serem entregues após uma vitória. |

| Nome        | Descrição                 | Tipo de Dado | Tamanho | Restrição de Domínio       |
|-------------|---------------------------|--------------|---------|----------------------------|
| id          | Identificador único        | SERIAL       | N/A     | PRIMARY KEY                |
| ginasioId   | ID do ginásio              | INTEGER      | N/A     | FOREIGN KEY (Ginasio)      |
| biografia   | Biografia do líder         | TEXT         | N/A     | NOT NULL                   |
| timeLiderID | ID do time do líder        | INTEGER      | N/A     | FOREIGN KEY (TimeNPC)      |

### **Insignia**

| Tabela   | Insignia |
|----------|------------------|
| Descrição | Representa as insígnias que podem ser obtidas pelos treinadores ao derrotarem líderes de ginásios. |
| Observação | Cada insígnia está relacionada a um ginásio e líder específico. |

| Nome        | Descrição                  | Tipo de Dado  | Tamanho | Restrição de Domínio            |
|-------------|----------------------------|---------------|---------|---------------------------------|
| id          | Identificador único         | SERIAL        | N/A     | PRIMARY KEY                    |
| nome        | Nome da insígnia            | TEXT          | N/A     | NOT NULL                       |
| liderId     | ID do líder associado       | INTEGER       | N/A     | FOREIGN KEY (Lider)            |
| tipoPokemon | Tipo de Pokémon da insígnia | TipoPokemon   | N/A     | NOT NULL, Enum (tipos Pokémon) |

### **Habilidade**

| Tabela   | Habilidade |
|----------|------------------|
| Descrição | Armazena as habilidades dos Pokémon, incluindo atributos como poder e tipo. |
| Observação | Cada habilidade é única para o Pokémon e pode ser usada em batalhas. |

| Nome        | Descrição          | Tipo de Dado  | Tamanho | Restrição de Domínio         |
|-------------|--------------------|---------------|---------|------------------------------|
| id          | Identificador único | SERIAL        | N/A     | PRIMARY KEY                  |
| nome        | Nome da habilidade  | TEXT          | N/A     | NOT NULL                     |
| tipo        | Tipo da habilidade  | TipoPokemon   | N/A     | NOT NULL, Enum (tipos Pokémon)|
| poder       | Poder da habilidade | INTEGER       | N/A     | NOT NULL                     |
| precisao    | Precisão da habilidade | INTEGER     | N/A     | NOT NULL                     |

### **EntregaInsignia** 

| Tabela   | EntregaInsignia |
|----------|------------------|
| Descrição | Armazena as informações sobre as insígnias entregues a treinadores. |
| Observação | Relaciona o treinador com a insígnia recebida. | 

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| id | Identificador único da entrega | SERIAL | | PRIMARY KEY |
| insigniaId | Identificador da insígnia | INTEGER | | NOT NULL |
| treinadorId | Identificador do treinador | INTEGER | | NOT NULL |

### **Ginasio**  

| Tabela   | Ginasio |
|----------|------------------|
| Descrição | Representa os ginásios localizados em cidades específicas. |
| Observação | Contém o líder do ginásio e a liga à qual ele pertence. |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| id | Identificador único do ginásio | SERIAL | | PRIMARY KEY |
| cidadeId | Identificador da cidade onde o ginásio está localizado | INTEGER | | NOT NULL |
| liderId | Identificador do líder do ginásio | INTEGER | | NOT NULL |
| ligaId | Identificador da liga à qual o ginásio pertence | INTEGER | | NULL |

### **Habilidade** 

| Tabela   | Habilidade |
|----------|------------------|
| Descrição | Armazena as habilidades dos Pokémon, como tipo, poder e precisão. |
| Observação | Cada habilidade está associada a um tipo de Pokémon. |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| id | Identificador único da habilidade | SERIAL | | PRIMARY KEY |
| nome | Nome da habilidade | TEXT | | NOT NULL |
| tipo | Tipo da habilidade com base no tipo do Pokémon | TipoPokemon | | NOT NULL |
| poder | Poder da habilidade | INTEGER | | NOT NULL |
| precisao | Precisão da habilidade | INTEGER | | NOT NULL |


### **PokemonInst**  

| Tabela   | PokemonInst |
|----------|------------------|
| Descrição | Representa uma instância de um Pokémon pertencente a um treinador ou NPC. |
| Observação | Inclui atributos específicos do Pokémon como HP, ataque, defesa e nível. |
 
| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| id | Identificador único da instância de Pokémon | SERIAL | | PRIMARY KEY |
| pokemonDex | Identificador do Pokémon baseado no Dex | INTEGER | | NOT NULL |
| treinadorId | Identificador do treinador proprietário | INTEGER | | NOT NULL |
| nivel | Nível do Pokémon | INTEGER | | NOT NULL |
| hp | Pontos de vida (HP) | INTEGER | | NOT NULL |
| ataque | Valor de ataque do Pokémon | INTEGER | | NOT NULL |
| defesa | Valor de defesa do Pokémon | INTEGER | | NOT NULL |
| velocidade | Velocidade do Pokémon | INTEGER | | NOT NULL |
| spAtaque | Ataque especial do Pokémon | INTEGER | | NOT NULL |
| spDefesa | Defesa especial do Pokémon | INTEGER | | NOT NULL |
| timePokemonId | Identificador do time do treinador | INTEGER | | NULL |
| timeNPCId | Identificador do time do NPC | INTEGER | | NULL |


### **Pokemon** 

| Tabela   | Pokemon |
|----------|------------------|
| Descrição | Define os Pokémon da Pokédex com suas estatísticas base e tipo. |
| Observação | Está associada a possíveis evoluções e habilidades. |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| dex | Identificador único na Pokédex | SERIAL | | PRIMARY KEY |
| nome | Nome do Pokémon | TEXT | | NOT NULL |
| tipo | Tipo principal do Pokémon | TipoPokemon | | NOT NULL |
| hp | Pontos de vida base (HP) | INTEGER | | NOT NULL |
| ataque | Valor base de ataque | INTEGER | | NOT NULL |
| defesa | Valor base de defesa | INTEGER | | NOT NULL |
| velocidade | Velocidade base | INTEGER | | NOT NULL |
| spAtaque | Ataque especial base | INTEGER | | NOT NULL |
| spDefesa | Defesa especial base | INTEGER | | NOT NULL |
| evolucaoDex | Identificador da evolução do Pokémon | INTEGER | | NULL |
| habilidadeId | Identificador da habilidade principal | INTEGER | | NOT NULL |
| pokemonDex | Identificador do Pokémon evoluído na Pokédex | INTEGER | | NOT NULL |
| rotaId | Identificador da rota onde o Pokémon pode ser encontrado | INTEGER | | NULL |

### **Liga** 

| Tabela   | Liga |
|----------|------------------|
| Descrição | Armazena as ligas que treinadores podem desafiar. |
| Observação | Contém a quantidade de insígnias necessárias para participar. |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| id | Identificador único da liga | SERIAL | | PRIMARY KEY |
| descricao | Descrição da liga | TEXT | | NOT NULL |
| nInsignias | Número de insígnias necessárias para a liga | INTEGER | | NOT NULL |

### **NPC**  

| Tabela   | NPC |
|----------|------------------|
| Descrição | Representa os NPCs do jogo, incluindo treinadores não jogáveis. |
| Observação | NPCs podem ser associados a uma liga e possuem um time de Pokémon. |
 
| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| id | Identificador único do NPC | SERIAL | | PRIMARY KEY |
| nome | Nome do NPC | TEXT | | NOT NULL |
| TimeNPCId | Identificador do time do NPC | INTEGER | | NOT NULL |
| ligaId | Identificador da liga à qual o NPC pertence | INTEGER | | NULL |

### **TimePokemon** 

| Tabela   | TimePokemon |
|----------|------------------|
| Descrição | Armazena o time de Pokémon de um treinador ou NPC. |
| Observação | Cada time pode pertencer a um treinador ou NPC. |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| id | Identificador único do time de Pokémon | SERIAL | | PRIMARY KEY |

### **TimeNPC**  

| Tabela   | TimeNPC |
|----------|------------------|
| Descrição | Registra os times de Pokémon associados aos NPCs do jogo. |
| Observação | Usado principalmente para batalhas com NPCs. |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| id | Identificador único do time do NPC | SERIAL | | PRIMARY KEY |

### **Pokeball**  

| Tabela   | Pokeball |
|----------|------------------|
| Descrição | Define os tipos de Pokébolas disponíveis no jogo. |
| Observação | Cada Pokébola tem um tipo que afeta suas chances de captura. |
 
| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| id | Identificador único da Pokébola | SERIAL | | PRIMARY KEY |
| tipo | Tipo da Pokébola (comum, super, ultra etc.) | PokeballTipo | | NOT NULL |

### **Captura**  

| Tabela   | Captura |
|----------|------------------|
| Descrição | Registra as capturas de Pokémon realizadas por treinadores. |
| Observação | Inclui a Pokébola utilizada e o treinador que realizou a captura. |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| id | Identificador único da captura | SERIAL | | PRIMARY KEY |
| treinadorId | Identificador do treinador que realizou a captura | INTEGER | | NOT NULL |
| pokemonId | Identificador do Pokémon capturado | INTEGER | | NOT NULL |
| pokeballId | Identificador da Pokébola usada na captura | INTEGER | | NOT NULL |

**Surgimento**  

| Tabela   | Surgimento |
|----------|------------------|
| Descrição | Define as rotas onde determinados Pokémon podem aparecer. |
| Observação | Relaciona um Pokémon a uma rota específica. |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| id | Identificador único do surgimento | SERIAL | | PRIMARY KEY |
| pokemonId | Identificador do Pokémon | INTEGER | | NOT NULL |
| rotaId | Identificador da rota onde o Pokémon pode surgir | INTEGER | | NOT NULL |


### **EncontroPokemon** 

| Tabela   | EncontroPokemon |
|----------|------------------|
| Descrição | Armazena encontros entre treinadores e Pokémon selvagens. |
| Observação | Inclui se o Pokémon foi capturado, vencido, ou se o treinador fugiu. |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| id | Identificador único do encontro | SERIAL | | PRIMARY KEY |
| pokemonId | Identificador do Pokémon encontrado | INTEGER | | NOT NULL |
| treinadorId | Identificador do treinador envolvido no encontro | INTEGER | | NOT NULL |
| rotaId | Identificador da rota onde ocorreu o encontro | INTEGER | | NOT NULL |
| capturado | Se o Pokémon foi capturado ou não | BOOLEAN | | NOT NULL |
| venceu | Se o treinador venceu o encontro | BOOLEAN | | NOT NULL |
| correu | Se o treinador fugiu do encontro | BOOLEAN | | NOT NULL |
| perdeu | Se o treinador perdeu o encontro | BOOLEAN | | NOT NULL |


### **BatalhaLider**  

| Tabela   | BatalhaLider |
|----------|------------------|
| Descrição | Registra batalhas contra líderes de ginásio. |
| Observação | Indica se o treinador ganhou ou perdeu a batalha. |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| id | Identificador único da batalha | SERIAL | | PRIMARY KEY |
| ganhou | Indica se o treinador ganhou a batalha | BOOLEAN | | NOT NULL |
| perdeu | Indica se o treinador perdeu a batalha | BOOLEAN | | NOT NULL |
| treinadorId | Identificador do treinador | INTEGER | | NOT NULL |
| liderId | Identificador do líder do ginásio | INTEGER | | NOT NULL |

### **BatalhaLiga**  

| Tabela   | BatalhaLiga |
|----------|------------------|
| Descrição | Armazena batalhas realizadas em ligas contra NPCs. |
| Observação | Relaciona o treinador, o NPC e o resultado da batalha. |
 
| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| id | Identificador único da batalha | SERIAL | | PRIMARY KEY |
| ganhou | Indica se o treinador ganhou a batalha | BOOLEAN | | NOT NULL |
| perdeu | Indica se o treinador perdeu a batalha | BOOLEAN | | NOT NULL |
| treinadorId | Identificador do treinador | INTEGER | | NOT NULL |
| npcId | Identificador do NPC enfrentado | INTEGER | | NOT NULL |
| ligaId | Identificador da liga | INTEGER | | NOT NULL |

### **DesafioLiga**  

| Tabela   | DesafioLiga |
|----------|------------------|
| Descrição | Registra os desafios feitos por treinadores em ligas. |
| Observação | Relaciona o treinador e a liga desafiada. |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| id | Identificador único do desafio | SERIAL | | PRIMARY KEY |
| treinadorId | Identificador do treinador | INTEGER | | NOT NULL |
| ligaId | Identificador da liga desafiada | INTEGER | | NOT NULL |

### **LancamentoBall**  

| Tabela   | LancamentoBall |
|----------|------------------|
| Descrição | Armazena os lançamentos de Pokébolas durante batalhas. |
| Observação | Registra o treinador, o encontro e a Pokébola lançada. |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| id | Identificador único do lançamento | SERIAL | | PRIMARY KEY |
| treinadorId | Identificador do treinador que lançou a Pokébola | INTEGER | | NOT NULL |
| encontroId | Identificador do encontro em que a Pokébola foi lançada | INTEGER | | NOT NULL |
| pokeballId | Identificador da Pokébola usada | INTEGER | | NOT NULL |


### **Pokedex**  

| Tabela   | Pokedex |
|----------|------------------|
| Descrição | Armazena o progresso do treinador na captura e registro de Pokémon. |
| Observação | Contém informações sobre Pokémon vistos, capturados e registrados. |

| Nome | Descrição | Tipo de Dado | Tamanho | Restrição de Domínio |
|---|---|---|---|---|
| id | Identificador único da Pokédex | SERIAL | | PRIMARY KEY |
| treinadorId | Identificador do treinador | INTEGER | | NOT NULL |
| qtdPokemonVistos | Quantidade de Pokémon vistos | INTEGER | | NOT NULL |
| qtdPokemonCapturados | Quantidade de Pokémon capturados | INTEGER | | NOT NULL |
| qtdPokemonRegistrados | Quantidade de Pokémon registrados | INTEGER | | NOT NULL |
| pokemonVistosId | Lista de Pokémon vistos | INTEGER[] | | NULL |
| pokemonRegistradosId | Lista de Pokémon registrados | INTEGER[] | | NULL |
| statusCompletude | Indica se a Pokédex está completa | BOOLEAN | | NOT NULL |
| dexRegistradosId | Lista de Dex registrados na Pokédex | INTEGER[] | | NULL |


## Histórico de versão

| Versão | Autor         | Descrição da Alteração                                                                                                                                      | Data       |
|--------|---------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|
| 1.0    | Carlos Gabriel  | Criação da quinta versão do dicionário de dados. | 08/09/2024|
