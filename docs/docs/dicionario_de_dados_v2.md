# Dicionário de Dados

## Introdução

Um dicionário de dados é uma ferramenta fundamental para documentar e organizar as informações sobre os dados armazenados em um sistema. Ele funciona como um repositório centralizado que descreve em detalhes os elementos de dados, suas características e suas relações entre si.

## Desenvolvimento


### Pokedex
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | Um banco de dados ou enciclopédia de Pokémon que contém informações sobre todos os Pokémon conhecidos, incluindo suas características, tipos e evoluções. |
| Observação | Pode estar associada a um personagem como um item ou ferramenta. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| ID_Pokedex            | Identificador único da Pokédex                 | Inteiro       | -       | Chave Primária        |
| Numero_Pokemons       | Número total de Pokémon na Pokédex             | Inteiro       | -       | -                    |
| Numero_Pokemons_Vistos| Número de Pokémon vistos                       | Inteiro       | -       | -                    |
| Numero_Pokemons_Capturados | Número de Pokémon capturados               | Inteiro       | -       | -                    |
| Status_Completa       | Indica se a Pokédex está completa (Sim/Não)     | Texto         | 3       | Valores Predefinidos  |

### Personagem
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | Um indivíduo jogável ou NPC (personagem não jogável) no universo Pokémon. Pode ser um treinador, líder de ginásio, entre outros. |
| Observação | Pode ter um relacionamento com várias outras entidades, como Batalha, Insignia, e Captura. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| ID_Personagem         | Identificador único do Personagem              | Inteiro       | -       | Chave Primária        |
| Nome                  | Nome do Personagem                             | Texto         | 255     | -                    |
| Pokebolas_Normais     | Quantidade de Pokébolas Normais                | Inteiro       | -       | -                    |
| Pokebolas_Greats      | Quantidade de Pokébolas Greats                 | Inteiro       | -       | -                    |
| Pokebolas_Ultras      | Quantidade de Pokébolas Ultras                 | Inteiro       | -       | -                    |


### Rota
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | Uma área de viagem entre cidades ou ginásios onde os treinadores podem encontrar Pokémon selvagens e outros treinadores. |
| Observação | Relacionada a Cidades e Encontros de Pokémon. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| ID_Rota               | Identificador único da Rota                    | Inteiro       | -       | Chave Primária        |


### Pokebola
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | Um item usado para capturar Pokémon. Existem diferentes tipos com diferentes taxas de sucesso. |
| Observação | Pode ter variantes específicas como Pokeball_Normal, Pokeball_Great, e Pokeball_Ultra. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| ID_Pokebola           | Identificador único da Pokébola                | Inteiro       | -       | Chave Primária        |

### Pokeball_Normal
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | Uma Pokébola padrão com uma taxa básica de sucesso para capturar Pokémon. |
| Observação | Tipo específico de Pokebola. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| Chance_Captura        | Chance de captura oferecida pela Pokébola Normal| Decimal       | -       | -                    |

### Pokeball_Great
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | Um tipo de Pokébola que oferece uma taxa de captura superior à Pokébola Normal. |
| Observação | Tipo específico de Pokebola. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| Chance_Captura        | Chance de captura oferecida pela Pokébola Great | Decimal       | -       | -                    |


### Pokeball_Ultra
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | Uma Pokébola de alta qualidade que possui uma taxa de captura ainda maior que a Pokébola Great. |
| Observação | Tipo específico de Pokebola. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| Chance_Captura        | Chance de captura oferecida pela Pokébola Ultra | Decimal       | -       | -                    |

### Batalha
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | Um confronto entre Pokémon, onde um treinador enfrenta outro ou um Pokémon selvagem. |
| Observação | Pode envolver diferentes personagens e Pokémon. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| ID_Batalha            | Identificador único da Batalha                 | Inteiro       | -       | Chave Primária        |
| Exp                   | Experiência ganha na Batalha                   | Inteiro       | -       | -                    |
| Resultado             | Resultado da Batalha (Vitória/Derrota)         | Texto         | 10      | Valores Predefinidos  |

### Lider
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | Um treinador especializado que dirige um ginásio e desafia os treinadores a batalhar para ganhar uma insignia. |
| Observação | Relacionado a Ginasio e Insignia. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| ID_Lider              | Identificador único do Líder                   | Inteiro       | -       | Chave Primária        |
| Nome                  | Nome do Líder                                 | Texto         | 255     | -                    |
| Biografia             | Biografia do Líder                             | Texto         | 1000    | -                    |
| Vendido_Por_Personagem| Identificador do Personagem que vende o Líder   | Inteiro       | -       | Chave Estrangeira     |

### Ginasio
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | Um local onde treinadores enfrentam líderes de ginásio para ganhar insignias. |
| Observação | Associado a Lider e Insignia. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| ID_Ginasio            | Identificador único do Ginásio                 | Inteiro       | -       | Chave Primária        |

### Insignia
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | Uma medalha ou emblema concedido por um líder de ginásio após uma vitória em batalha. |
| Observação | Relacionado a Lider e Ginasio. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| ID_Insignia           | Identificador único da Insígnia                | Inteiro       | -       | Chave Primária        |

### Liga Pokemon
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | Uma competição de alto nível onde treinadores batalham após coletar todas as insignias dos ginásios. |
| Observação | Pode envolver batalhas finais e eventos importantes. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| ID_Liga               | Identificador único da Liga Pokémon            | Inteiro       | -       | Chave Primária        |
| Descricao             | Descrição da Liga Pokémon                      | Texto         | 1000    | -                    |
| Numero_Insignias_Necessarias | Número de Insígnias necessárias para a Liga | Inteiro       | -       | -                    |

### Cidade
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | Uma área urbana onde os treinadores podem encontrar ginásios, lojas e outras facilidades. |
| Observação | Pode estar associada a Rotas e Ginasios. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| ID_Cidade             | Identificador único da Cidade                  | Inteiro       | -       | Chave Primária        |
| Possui_Pokecenter     | Indica se a cidade possui um Pokécenter         | Texto         | 3       | Valores Predefinidos  |
| Possui_Pokemarket     | Indica se a cidade possui um Pokémarket         | Texto         | 3       | Valores Predefinidos  |
| Possui_Ginasio        | Indica se a cidade possui um Ginásio            | Texto         | 3       | Valores Predefinidos  |

### Encontro
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | A ocasião em que um treinador encontra um Pokémon selvagem ou outro treinador. |
| Observação | Relacionado a Rotas e Captura. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| ID_Encontro           | Identificador único do Encontro                | Inteiro       | -       | Chave Primária        |
| Capturado             | Indica se o Pokémon foi capturado (Sim/Não)     | Texto         | 3       | Valores Predefinidos  |
| Derrotado             | Indica se o Pokémon foi derrotado (Sim/Não)     | Texto         | 3       | Valores Predefinidos  |
| Correu                | Indica se o Pokémon fugiu (Sim/Não)             | Texto         | 3       | Valores Predefinidos  |
| Perdeu                | Indica se o Pokémon perdeu (Sim/Não)            | Texto         | 3       | Valores Predefinidos  |
| Experiencia           | Quantidade de experiência ganha no encontro     | Inteiro       | -       | -                    |

### Captura
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | O ato de usar uma Pokébola para capturar um Pokémon selvagem. |
| Observação | Envolve Pokebola e Pokémon. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| ID_Captura            | Identificador único da Captura                 | Inteiro       | -       | Chave Primária        |
| Experiencia           | Experiência ganhada durante a captura           | Inteiro       | -       | -                    |

### Pokemon
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | Criaturas com habilidades especiais que podem ser treinadas e usadas em batalhas. |
| Observação | Relacionado a Ataque, Tipo e Efetividade. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| ID_Pokemon            | Identificador único do Pokémon                 | Inteiro       | -       | Chave Primária        |
| Defesa_Especial       | Valor de defesa especial do Pokémon            | Inteiro       | -       | -                    |
| Nome                  | Nome do Pokémon                                | Texto         | 255     | -                    |
| Velocidade            | Valor de velocidade do Pokémon                 | Inteiro       | -       | -                    |
| HP                    | Pontos de vida do Pokémon                      | Inteiro       | -       | -                    |
| Nivel                 | Nível do Pokémon                               | Inteiro       | -       | -                    |
| Experiencia           | Quantidade de experiência do Pokémon           | Inteiro       | -       | -                    |
| Ataque_Especial       | Valor de ataque especial do Pokémon            | Inteiro       | -       | -                    |
| Defesa                | Valor de defesa do Pokémon                     | Inteiro       | -       | -                    |

### Tipo
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | A classificação dos Pokémon e ataques que define suas características e fortalezas. Exemplos incluem Fogo, Água, Elétrico. |
| Observação | Relacionado a Ataque e Efetividade. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|------------------------------------------------|--------------|---------|----------------------|----|
| ID_Tipo               | Identificador único do Tipo                    | Inteiro       | -       | Chave |Primária        |

### Ataque
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | Ações ofensivas que um Pokémon pode usar em batalha para causar dano aos oponentes. |
| Observação | Associado a Tipo e Efetividade. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| ID_Ataque             | Identificador único do Ataque                  | Inteiro       | -       | Chave Primária        |
| Dano                  | Quantidade de dano causado pelo ataque         | Inteiro       | -       | -                    |

### Efetividade
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | O impacto que um tipo de ataque tem sobre um tipo específico de Pokémon, determinando se o ataque é mais ou menos eficaz. |
| Observação | Relacionado a Tipo e Ataque. |

| Nome          | Descrição                                  | Tipo de Dado | Tamanho | Restrição de Domínio |
|---------------|--------------------------------------------|--------------|---------|----------------------|
| ID_Efetividade| Identificador único da Efetividade         | Inteiro       | -       | Chave Primária        |
| Veneno        | Modificador de efetividade contra Veneno   | Decimal       | -       | -                    |
| Terra         | Modificador de efetividade contra Terra    | Decimal       | -       | -                    |
| Normal        | Modificador de efetividade contra Normal   | Decimal       | -       | -                    |
| Voador        | Modificador de efetividade contra Voador   | Decimal       | -       | -                    |
| Fogo          | Modificador de efetividade contra Fogo     | Decimal       | -       | -                    |
| Psiquico      | Modificador de efetividade contra Psiquico | Decimal       | -       | -                    |
| Agua          | Modificador de efetividade contra Água     | Decimal       | -       | -                    |
| Inseto        | Modificador de efetividade contra Inseto   | Decimal       | -       | -                    |
| Eletrico      | Modificador de efetividade contra Elétrico | Decimal       | -       | -                    |
| Pedra         | Modificador de efetividade contra Pedra    | Decimal       | -       | -                    |
| Grama         | Modificador de efetividade contra Grama    | Decimal       | -       | -                    |
| Fantasma      | Modificador de efetividade contra Fantasma | Decimal       | -       | -                    |
| Gelo          | Modificador de efetividade contra Gelo     | Decimal       | -       | -                    |
| Dragao        | Modificador de efetividade contra Dragão   | Decimal       | -       | -                    |
| Lutador       | Modificador de efetividade contra Lutador  | Decimal       | -       | -                    |
| Fada          | Modificador de efetividade contra Fada     | Decimal       | -       | -                    |
| Aco           | Modificador de efetividade contra Aço      | Decimal       | -       | -                    |



| Versão | Autor         | Descrição da Alteração                                                                                                                                      | Data       |
|--------|---------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|
| 1.0    | Carlos Gabriel  | Criação da segunda versão do dicionário de dados. | 21/07/2024|
| 1.1    | Todos | Revisão e Pequenas alteracoes no dicionário de dados. | 22/07/2024|




