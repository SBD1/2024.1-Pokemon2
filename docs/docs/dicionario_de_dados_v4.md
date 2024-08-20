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
| Descrição | Define as rotas que conectam diferentes cidades ou regiões no jogo. |
| Observação | Pode estar relacionada a diversas cidades e encontros de Pokémon. |

| Nome              | Descrição                              | Tipo de Dado | Tamanho | Restrição de Domínio |
|-------------------|----------------------------------------|--------------|---------|----------------------|
| ID_Rota           | Identificador único da rota            | Inteiro       | -       | Chave Primária        |
| fk_Rota_ID_Rota   | Identificador da rota relacionada      | Inteiro       | -       | Chave Estrangeira     |

### Pokeball
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | Dispositivos usados para capturar e armazenar Pokémon. |
| Observação | Diferentes tipos de Pokébolas têm diferentes taxas de captura. |

| Nome              | Descrição                              | Tipo de Dado | Tamanho | Restrição de Domínio |
|-------------------|----------------------------------------|--------------|---------|----------------------|
| ID_Pokebola       | Identificador único da Pokébola        | Inteiro       | -       | Chave Primária        |
| Chance_Captura    | Chance de captura de Pokémon           | Decimal       | -       | -                    |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| ID_Pokebola           | Identificador único da Pokébola                | Inteiro       | -       | Chave Primária        |


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

### Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | Informação sobre os líderes de ginásio e suas equipes. |
| Observação | Inclui informações sobre o ginásio, insígnias e a Pokédex. |

| Nome                                            | Descrição                                               | Tipo de Dado | Tamanho | Restrição de Domínio |
|-------------------------------------------------|---------------------------------------------------------|--------------|---------|----------------------|
| ID_Lider                                        | Identificador único do líder do ginásio                 | Inteiro       | -       | Parte da Chave Primária|
| Nome                                            | Nome do líder do ginásio                                | Texto         | -       | -                    |
| Biografia                                       | Biografia do líder do ginásio                           | Texto         | -       | -                    |
| ID_Ginasio                                      | Identificador único do ginásio                          | Inteiro       | -       | Parte da Chave Primária|
| fk_Personagem_Pokedex_Equipe_ID_Personagem      | Identificador da equipe do líder                        | Inteiro       | -       | Chave Estrangeira     |
| ID_Insignia                                     | Identificador único da insígnia do ginásio              | Inteiro       | -       | Parte da Chave Primária|
| Tipo                                            | Tipo predominante do ginásio                            | Texto         | -       | -                    |
| ID_Personagem                                   | Identificador único do personagem                       | Inteiro       | -       | Parte da Chave Primária|
| Pokebolas_Normais                               | Número de Pokébolas normais                             | Inteiro       | -       | -                    |
| Pokebolas_Greats                                | Número de Pokébolas Great                               | Inteiro       | -       | -                    |
| Pokebolas_Ultras                                | Número de Pokébolas Ultra                               | Inteiro       | -       | -                    |
| ID_Pokedex                                      | Identificador único da Pokédex                          | Inteiro       | -       | Parte da Chave Primária|
| Numero_Pokemons                                 | Número total de Pokémon da equipe                       | Inteiro       | -       | -                    |
| Numero_Pokemons_Vistos                          | Número de Pokémon vistos na Pokédex                     | Inteiro       | -       | -                    |
| Numero_Pokemons_Capturados                      | Número de Pokémon capturados na Pokédex                 | Inteiro       | -       | -                    |
| Status_Completa                                 | Status de completude da Pokédex                         | Inteiro       | -       | -                    |
| fk_Inst_Pokemon_Id_Pokemon_Inst                 | Identificador da instância Pokémon                      | Inteiro       | -       | Chave Estrangeira     |



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
| Descrição | Representa uma cidade no jogo, com suas funcionalidades como Pokécenter e Pokémarket. |
| Observação | Está relacionada a ginásios, líderes de ginásio e rotas. |

| Nome                                                        | Descrição                                                       | Tipo de Dado | Tamanho | Restrição de Domínio |
|-------------------------------------------------------------|-----------------------------------------------------------------|--------------|---------|----------------------|
| Possui_Pokecenter                                            | Indica se a cidade possui um Pokécenter                         | Inteiro       | -       | -                    |
| Possui_Pokemarket                                            | Indica se a cidade possui um Pokémarket                         | Inteiro       | -       | -                    |
| Possui_Ginasio                                               | Indica se a cidade possui um ginásio                            | Inteiro       | -       | -                    |
| fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Lider | Identificador do líder do ginásio                               | Inteiro       | -       | Chave Estrangeira     |
| fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Ginasio| Identificador do ginásio relacionado                            | Inteiro       | -       | Chave Estrangeira     |
| fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Insignia| Identificador da insígnia relacionada                           | Inteiro       | -       | Chave Estrangeira     |
| fk_Rota_ID_Rota                                              | Identificador da rota relacionada                               | Inteiro       | -       | Chave Estrangeira     |


### Batalha_Batalha
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | Armazena informações sobre batalhas ocorridas no jogo. |
| Observação | Relacionado a líderes de ginásio e suas equipes. |

| Nome                                                        | Descrição                                                       | Tipo de Dado | Tamanho | Restrição de Domínio |
|-------------------------------------------------------------|-----------------------------------------------------------------|--------------|---------|----------------------|
| ID_Batalha                                                  | Identificador único da batalha                                  | Inteiro       | -       | Chave Primária        |
| Exp                                                         | Experiência obtida na batalha                                   | Inteiro       | -       | -                    |
| Resultado                                                   | Resultado da batalha                                            | Inteiro       | -       | -                    |
| fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Lider | Identificador do líder envolvido na batalha                     | Inteiro       | -       | Chave Estrangeira     |
| fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Ginasio| Identificador do ginásio envolvido na batalha                   | Inteiro       | -       | Chave Estrangeira     |
| fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Insignia| Identificador da insígnia envolvida na batalha                  | Inteiro       | -       | Chave Estrangeira     |
| fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Personagem| Identificador do personagem envolvido na batalha                | Inteiro       | -       | Chave Estrangeira     |
| fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Pokedex| Identificador da Pokédex envolvida na batalha                   | Inteiro       | -       | Chave Estrangeira     |

### Captura_Captura
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | Contém informações sobre as capturas de Pokémon realizadas no jogo. |
| Observação | Relacionada a vários tipos de Pokémon. |

| Nome                                  | Descrição                                        | Tipo de Dado | Tamanho | Restrição de Domínio |
|---------------------------------------|--------------------------------------------------|--------------|---------|----------------------|
| ID_Captura                            | Identificador único da captura                   | Inteiro       | -       | Chave Primária        |
| Experiencia                           | Experiência obtida na captura                    | Inteiro       | -       | -                    |
| fk_Pokeball_ID_Pokebola               | Identificador da Pokébola usada na captura       | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDeAgua_id                   | Identificador do Pokémon de água relacionado     | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDeAgua_ID_Pokemon           | Identificador do Pokémon de água capturado       | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonEletrico_ID_Pokemon         | Identificador do Pokémon elétrico capturado      | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDeFogo_id                   | Identificador do Pokémon de fogo relacionado     | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDeFogo_ID_Pokemon           | Identificador do Pokémon de fogo capturado       | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDeGelo_id                   | Identificador do Pokémon de gelo relacionado     | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDeGelo_ID_Pokemon           | Identificador do Pokémon de gelo capturado       | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonVenenoso_id                 | Identificador do Pokémon venenoso relacionado    | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonVenenoso_ID_Pokemon         | Identificador do Pokémon venenoso capturado      | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonTerrestre_id                | Identificador do Pokémon terrestre relacionado   | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonTerrestre_ID_Pokemon        | Identificador do Pokémon terrestre capturado     | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonVoador_id                   | Identificador do Pokémon voador relacionado      | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonVoador_ID_Pokemon           | Identificador do Pokémon voador capturado        | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonPsíquico_id                 | Identificador do Pokémon psíquico relacionado    | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonPsíquico_ID_Pokemon         | Identificador do Pokémon psíquico capturado      | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonInseto_id                   | Identificador do Pokémon inseto relacionado      | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonInseto_ID_Pokemon           | Identificador do Pokémon inseto capturado        | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDePedra_id                  | Identificador do Pokémon de pedra relacionado    | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDePedra_ID_Pokemon          | Identificador do Pokémon de pedra capturado      | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDragao_ID_Pokemon           | Identificador do Pokémon dragão capturado        | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonSombrio_ID_Pokemon          | Identificador do Pokémon sombrio capturado       | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonFada_id                     | Identificador do Pokémon fada relacionado        | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonFada_ID_Pokemon             | Identificador do Pokémon fada capturado          | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDePlanta_id                 | Identificador do Pokémon de planta relacionado   | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDePlanta_ID_Pokemon         | Identificador do Pokémon de planta capturado     | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonLutador_ID_Pokemon          | Identificador do Pokémon lutador capturado       | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonMetalico_id                 | Identificador do Pokémon metálico relacionado    | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonMetalico_ID_Pokemon         | Identificador do Pokémon metálico capturado      | Inteiro       | -       | Chave Estrangeira     |

### Encontro_Encontra
| Tabela   | Nome da Entidade |
|----------|------------------|
| Descrição | Registra informações sobre encontros de personagens com Pokémon. |
| Observação | Inclui dados sobre a captura, derrota, e experiência obtida. |

| Nome                                  | Descrição                                        | Tipo de Dado | Tamanho | Restrição de Domínio |
|---------------------------------------|--------------------------------------------------|--------------|---------|----------------------|
| ID_Encontro                           | Identificador único do encontro                  | Inteiro       | -       | Chave Primária        |
| Capturado                             | Indica se o Pokémon foi capturado                | Inteiro       | -       | -                    |
| Derrotado                             | Indica se o Pokémon foi derrotado                | Inteiro       | -       | -                    |
| Correu                                | Indica se o personagem fugiu do encontro         | Inteiro       | -       | -                    |
| Perdeu                                | Indica se o personagem perdeu o encontro         | Inteiro       | -       | -                    |
| Experiencia                           | Experiência obtida no encontro                   | Inteiro       | -       | -                    |
| fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Lider | Identificador do líder relacionado ao encontro   | Inteiro       | -       | Chave Estrangeira     |
| fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Ginasio| Identificador do ginásio relacionado ao encontro | Inteiro       | -       | Chave Estrangeira     |
| fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Insignia| Identificador da insígnia relacionada ao encontro| Inteiro       | -       | Chave Estrangeira     |
| fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Personagem| Identificador do personagem relacionado ao encontro| Inteiro   | -       | Chave Estrangeira     |
| fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Pokedex| Identificador da Pokédex relacionada ao encontro | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDeAgua_id                   | Identificador do Pokémon de água relacionado     | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDeAgua_ID_Pokemon           | Identificador do Pokémon de água encontrado      | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonEletrico_ID_Pokemon         | Identificador do Pokémon elétrico encontrado     | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDeFogo_id                   | Identificador do Pokémon de fogo relacionado     | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDeFogo_ID_Pokemon           | Identificador do Pokémon de fogo encontrado      | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDeGelo_id                   | Identificador do Pokémon de gelo relacionado     | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDeGelo_ID_Pokemon           | Identificador do Pokémon de gelo encontrado      | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonVenenoso_id                 | Identificador do Pokémon venenoso relacionado    | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonVenenoso_ID_Pokemon         | Identificador do Pokémon venenoso encontrado     | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonTerrestre_id                | Identificador do Pokémon terrestre relacionado   | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonTerrestre_ID_Pokemon        | Identificador do Pokémon terrestre encontrado    | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonVoador_id                   | Identificador do Pokémon voador relacionado      | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonVoador_ID_Pokemon           | Identificador do Pokémon voador encontrado       | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonPsíquico_id                 | Identificador do Pokémon psíquico relacionado    | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonPsíquico_ID_Pokemon         | Identificador do Pokémon psíquico encontrado     | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonInseto_id                   | Identificador do Pokémon inseto relacionado      | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonInseto_ID_Pokemon           | Identificador do Pokémon inseto encontrado       | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDePedra_id                  | Identificador do Pokémon de pedra relacionado    | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDePedra_ID_Pokemon          | Identificador do Pokémon de pedra encontrado     | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDragao_ID_Pokemon           | Identificador do Pokémon dragão encontrado       | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonSombrio_ID_Pokemon          | Identificador do Pokémon sombrio encontrado      | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonFada_id                     | Identificador do Pokémon fada relacionado        | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonFada_ID_Pokemon             | Identificador do Pokémon fada encontrado         | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDePlanta_id                 | Identificador do Pokémon de planta relacionado   | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonDePlanta_ID_Pokemon         | Identificador do Pokémon de planta encontrado    | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonLutador_ID_Pokemon          | Identificador do Pokémon lutador encontrado      | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonMetalico_id                 | Identificador do Pokémon metálico relacionado    | Inteiro       | -       | Chave Estrangeira     |
| fk_PokemonMetalico_ID_Pokemon         | Identificador do Pokémon metálico encontrado     | Inteiro       | -       | Chave Estrangeira     |


### PokemonDeAgua
| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| hydro_pump            | Poder do movimento Hydro Pump                  | Inteiro       | -       | -                    |
| id                    | Identificador único da instância do Pokémon    | Inteiro       | -       | Parte da Chave Primária |
| ID_Pokemon            | Identificador do Pokémon base                  | Inteiro       | -       | Parte da Chave Primária |
| Nome                  | Nome do Pokémon                                | Texto         | -       | -                    |
| Nivel                 | Nível atual da instância                       | Inteiro       | -       | -                    |
| Experiencia           | Experiência acumulada                          | Inteiro       | -       | -                    |
| Defesa_Especial       | Defesa especial do Pokémon                     | Inteiro       | -       | -                    |
| Velocidade            | Velocidade do Pokémon                          | Inteiro       | -       | -                    |
| Tipo                  | Tipo do Pokémon                                | Texto         | -       | -                    |
| fk_Inst Pokemon_Id_Pokemon_Inst | Chave estrangeira para Instância Pokémon | Inteiro       | -       | Chave Estrangeira     |

### PokemonEletrico
| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| fire_blast            | Poder do movimento Fire Blast                  | Inteiro       | -       | -                    |
| ID_Pokemon            | Identificador do Pokémon base                  | Inteiro       | -       | Chave Primária        |
| Nome                  | Nome do Pokémon                                | Texto         | -       | -                    |
| Nivel                 | Nível atual da instância                       | Inteiro       | -       | -                    |
| Experiencia           | Experiência acumulada                          | Inteiro       | -       | -                    |
| Defesa_Especial       | Defesa especial do Pokémon                     | Inteiro       | -       | -                    |
| Velocidade            | Velocidade do Pokémon                          | Inteiro       | -       | -                    |
| Tipo                  | Tipo do Pokémon                                | Texto         | -       | -                    |
| fk_Inst Pokemon_Id_Pokemon_Inst | Chave estrangeira para Instância Pokémon | Inteiro       | -       | Chave Estrangeira     |

### PokemonDeFogo
| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| id                    | Identificador único da instância do Pokémon    | Inteiro       | -       | Parte da Chave Primária |
| ID_Pokemon            | Identificador do Pokémon base                  | Inteiro       | -       | Parte da Chave Primária |
| Nome                  | Nome do Pokémon                                | Texto         | -       | -                    |
| Nivel                 | Nível atual da instância                       | Inteiro       | -       | -                    |
| Experiencia           | Experiência acumulada                          | Inteiro       | -       | -                    |
| Defesa_Especial       | Defesa especial do Pokémon                     | Inteiro       | -       | -                    |
| Velocidade            | Velocidade do Pokémon                          | Inteiro       | -       | -                    |
| Tipo                  | Tipo do Pokémon                                | Texto         | -       | -                    |
| fk_Inst Pokemon_Id_Pokemon_Inst | Chave estrangeira para Instância Pokémon | Inteiro       | -       | Chave Estrangeira     |

### PokemonDePlanta
| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| id                    | Identificador único da instância do Pokémon    | Inteiro       | -       | Parte da Chave Primária |
| ID_Pokemon            | Identificador do Pokémon base                  | Inteiro       | -       | Parte da Chave Primária |
| Nome                  | Nome do Pokémon                                | Texto         | -       | -                    |
| Nivel                 | Nível atual da instância                       | Inteiro       | -       | -                    |
| Experiencia           | Experiência acumulada                          | Inteiro       | -       | -                    |
| Defesa_Especial       | Defesa especial do Pokémon                     | Inteiro       | -       | -                    |
| Velocidade            | Velocidade do Pokémon                          | Inteiro       | -       | -                    |
| Tipo                  | Tipo do Pokémon                                | Texto         | -       | -                    |
| fk_Inst Pokemon_Id_Pokemon_Inst | Chave estrangeira para Instância Pokémon | Inteiro       | -       | Chave Estrangeira     |

### PokemonDeGelo
| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| id                    | Identificador único da instância do Pokémon    | Inteiro       | -       | Parte da Chave Primária |
| ID_Pokemon            | Identificador do Pokémon base                  | Inteiro       | -       | Parte da Chave Primária |
| Nome                  | Nome do Pokémon                                | Texto         | -       | -                    |
| Nivel                 | Nível atual da instância                       | Inteiro       | -       | -                    |
| Experiencia           | Experiência acumulada                          | Inteiro       | -       | -                    |
| Defesa_Especial       | Defesa especial do Pokémon                     | Inteiro       | -       | -                    |
| Velocidade            | Velocidade do Pokémon                          | Inteiro       | -       | -                    |
| Tipo                  | Tipo do Pokémon                                | Texto         | -       | -                    |
| fk_Inst Pokemon_Id_Pokemon_Inst | Chave estrangeira para Instância Pokémon | Inteiro       | -       | Chave Estrangeira     |

### PokemonLutador
| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| focus_blast           | Poder do movimento Focus Blast                 | Inteiro       | -       | -                    |
| ID_Pokemon            | Identificador do Pokémon base                  | Inteiro       | -       | Chave Primária        |
| Nome                  | Nome do Pokémon                                | Texto         | -       | -                    |
| Nivel                 | Nível atual da instância                       | Inteiro       | -       | -                    |
| Experiencia           | Experiência acumulada                          | Inteiro       | -       | -                    |
| Defesa_Especial       | Defesa especial do Pokémon                     | Inteiro       | -       | -                    |
| Velocidade            | Velocidade do Pokémon                          | Inteiro       | -       | -                    |
| Tipo                  | Tipo do Pokémon                                | Texto         | -       | -                    |
| fk_Inst Pokemon_Id_Pokemon_Inst | Chave estrangeira para Instância Pokémon | Inteiro       | -       | Chave Estrangeira     |

### PokemonVenenoso
| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| id                    | Identificador único da instância do Pokémon    | Inteiro       | -       | Parte da Chave Primária |
| ID_Pokemon            | Identificador do Pokémon base                  | Inteiro       | -       | Parte da Chave Primária |
| Nome                  | Nome do Pokémon                                | Texto         | -       | -                    |
| Nivel                 | Nível atual da instância                       | Inteiro       | -       | -                    |
| Experiencia           | Experiência acumulada                          | Inteiro       | -       | -                    |
| Defesa_Especial       | Defesa especial do Pokémon                     | Inteiro       | -       | -                    |
| Velocidade            | Velocidade do Pokémon                          | Inteiro       | -       | -                    |
| Tipo                  | Tipo do Pokémon                                | Texto         | -       | -                    |
| fk_Inst Pokemon_Id_Pokemon_Inst | Chave estrangeira para Instância Pokémon | Inteiro       | -       | Chave Estrangeira     |

### PokemonTerrestre
| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| id                    | Identificador único da instância do Pokémon    | Inteiro       | -       | Parte da Chave Primária |
| ID_Pokemon            | Identificador do Pokémon base                  | Inteiro       | -       | Parte da Chave Primária |
| Nome                  | Nome do Pokémon                                | Texto         | -       | -                    |
| Nivel                 | Nível atual da instância                       | Inteiro       | -       | -                    |
| Experiencia           | Experiência acumulada                          | Inteiro       | -       | -                    |
| Defesa_Especial       | Defesa especial do Pokémon                     | Inteiro       | -       | -                    |
| Velocidade            | Velocidade do Pokémon                          | Inteiro       | -       | -                    |
| Tipo                  | Tipo do Pokémon                                | Texto         | -       | -                    |
| fk_Inst Pokemon_Id_Pokemon_Inst | Chave estrangeira para Instância Pokémon | Inteiro   |-       | Chave Estrangeira     |

### PokemonVoador
| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| id                    | Identificador único da instância do Pokémon    | Inteiro       | -       | Parte da Chave Primária |
| ID_Pokemon            | Identificador do Pokémon base                  | Inteiro       | -       | Parte da Chave Primária |
| Nome                  | Nome do Pokémon                                | Inteiro       | -       | -                    |
| Nivel                 | Nível atual da instância                       | Inteiro       | -       | -                    |
| Experiencia           | Experiência acumulada                          | Inteiro       | -       | -                    |
| Defesa_Especial       | Defesa especial do Pokémon                     | Inteiro       | -       | -                    |
| Velocidade            | Velocidade do Pokémon                          | Inteiro       | -       | -                    |
| Tipo                  | Tipo do Pokémon                                | Inteiro       | -       | -                    |
| fk_Inst Pokemon_Id_Pokemon_Inst | Chave estrangeira para Instância Pokémon | Inteiro       | -       | Chave Estrangeira     |

### PokemonPsíquico
| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| id                    | Identificador único da instância do Pokémon    | Inteiro       | -       | Parte da Chave Primária |
| ID_Pokemon            | Identificador do Pokémon base                  | Inteiro       | -       | Parte da Chave Primária |
| Nome                  | Nome do Pokémon                                | Texto         | -       | -                    |
| Nivel                 | Nível atual da instância                       | Inteiro       | -       | -                    |
| Experiencia           | Experiência acumulada                          | Inteiro       | -       | -                    |
| Defesa_Especial       | Defesa especial do Pokémon                     | Inteiro       | -       | -                    |
| Velocidade            | Velocidade do Pokémon                          | Inteiro       | -       | -                    |
| Tipo                  | Tipo do Pokémon                                | Texto         | -       | -                    |
| fk_Inst Pokemon_Id_Pokemon_Inst | Chave estrangeira para Instância Pokémon | Inteiro       | -       | Chave Estrangeira     |

### PokemonInseto
| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| id                    | Identificador único da instância do Pokémon    | Inteiro       | -       | Parte da Chave Primária |
| ID_Pokemon            | Identificador do Pokémon base                  | Inteiro       | -       | Parte da Chave Primária |
| Nome                  | Nome do Pokémon                                | Texto         | -       | -                    |
| Nivel                 | Nível atual da instância                       | Inteiro       | -       | -                    |
| Experiencia           | Experiência acumulada                          | Inteiro       | -       | -                    |
| Defesa_Especial       | Defesa especial do Pokémon                     | Inteiro       | -       | -                    |
| Velocidade            | Velocidade do Pokémon                          | Inteiro       | -       | -                    |
| Tipo                  | Tipo do Pokémon                                | Texto         | -       | -                    |
| fk_Inst Pokemon_Id_Pokemon_Inst | Chave estrangeira para Instância Pokémon | Inteiro       | -       | Chave Estrangeira     |

### PokemonDePedra
| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| id                    | Identificador único da instância do Pokémon    | Inteiro       | -       | Parte da Chave Primária |
| ID_Pokemon            | Identificador do Pokémon base                  | Inteiro       | -       | Parte da Chave Primária |
| Nome                  | Nome do Pokémon                                | Texto         | -       | -                    |
| Nivel                 | Nível atual da instância                       | Inteiro       | -       | -                    |
| Experiencia           | Experiência acumulada                          | Inteiro       | -       | -                    |
| Defesa_Especial       | Defesa especial do Pokémon                     | Inteiro       | -       | -                    |
| Velocidade            | Velocidade do Pokémon                          | Inteiro       | -       | -                    |
| Tipo                  | Tipo do Pokémon                                | Texto         | -       | -                    |
| fk_Inst Pokemon_Id_Pokemon_Inst | Chave estrangeira para Instância Pokémon | Inteiro       | -       | Chave Estrangeira     |

### PokemonFantasma
| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| (Nenhuma coluna definida) | (Nenhuma coluna definida)                  | -            | -       | -                    |

### PokemonDragao
| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| ID_Pokemon            | Identificador do Pokémon base                  | Inteiro       | -       | Chave Primária        |
| Nome                  | Nome do Pokémon                                | Texto         | -       | -                    |
| Nivel                 | Nível atual da instância                       | Inteiro       | -       | -                    |
| Experiencia           | Experiência acumulada                          | Inteiro       | -       | -                    |
| Defesa_Especial       | Defesa especial do Pokémon                     | Inteiro       | -       | -                    |
| Velocidade            | Velocidade do Pokémon                          | Inteiro       | -       | -                    |
| Tipo                  | Tipo do Pokémon                                | Texto         | -       | -                    |
| fk_Inst Pokemon_Id_Pokemon_Inst | Chave estrangeira para Instância Pokémon | Inteiro       | -       | Chave Estrangeira     |

### PokemonSombrio
| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| ID_Pokemon            | Identificador do Pokémon base                  | Inteiro       | -       | Chave Primária        |
| Nome                  | Nome do Pokémon                                | Texto         | -       | -                    |
| Nivel                 | Nível atual da instância                       | Inteiro       | -       | -                    |
| Experiencia           | Experiência acumulada                          | Inteiro       | -       | -                    |
| Defesa_Especial       | Defesa especial do Pokémon                     | Inteiro       | -       | -                    |
| Velocidade            | Velocidade do Pokémon                          | Inteiro       | -       | -                    |
| Tipo                  | Tipo do Pokémon                                | Texto         | -       | -                    |
| fk_Inst Pokemon_Id_Pokemon_Inst | Chave estrangeira para Instância Pokémon | Inteiro       | -       | Chave Estrangeira     |

### PokemonMetalico
| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| id                    | Identificador único da instância do Pokémon    | Inteiro       | -       | Parte da Chave Primária |
| ID_Pokemon            | Identificador do Pokémon base                  | Inteiro       | -       | Parte da Chave Primária |
| Nome                  | Nome do Pokémon                                | Texto         | -       | -                    |
| Nivel                 | Nível atual da instância                       | Inteiro       | -       | -                    |
| Experiencia           | Experiência acumulada                          | Inteiro       | -       | -                    |
| Defesa_Especial       | Defesa especial do Pokémon                     | Inteiro       | -       | -                    |
| Velocidade            | Velocidade do Pokémon                          | Inteiro       | -       | -                    |
| Tipo                  | Tipo do Pokémon                                | Texto         | -       | -                    |
| fk_Inst Pokemon_Id_Pokemon_Inst | Chave estrangeira para Instância Pokémon | Inteiro       | -       | Chave Estrangeira     |

### PokemonFada
| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| id                    | Identificador único da instância do Pokémon    | Inteiro       | -       | Parte da Chave Primária |
| ID_Pokemon            | Identificador do Pokémon base                  | Inteiro       | -       | Parte da Chave Primária |
| Nome                  | Nome do Pokémon                                | Texto         | -       | -                    |
| Nivel                 | Nível atual da instância                       | Inteiro       | -       | -                    |
| Experiencia           | Experiência acumulada                          | Inteiro       | -       | -                    |
| Defesa_Especial       | Defesa especial do Pokémon                     | Inteiro       | -       | -                    |
| Velocidade            | Velocidade do Pokémon                          | Inteiro       | -       | -                    |
| Tipo                  | Tipo do Pokémon                                | Texto         | -       | -                    |
| fk_Inst Pokemon_Id_Pokemon_Inst | Chave estrangeira para Instância Pokémon | Inteiro       | -       | Chave Estrangeira     |

### Inst Pokemon
| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| Id_Pokemon_Inst       | Identificador único da instância do Pokémon    | Inteiro       | -       | Chave Primária        |
| Probabilidade_Surgimento | Probabilidade de surgimento da instância      | Real          | -       | -                    |

### Elite
| Tabela | Elite |
|--------|------------------|
| Descrição | Representa uma liga de Elite no jogo, que desafia os jogadores com um aumento de dificuldade e requisitos específicos. |
| Observação | A tabela armazena detalhes sobre o multiplicador de dificuldade, a descrição da liga, o número de insignias necessárias e a referência ao ginásio associado. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| Multiplicador_Dificuldade | Multiplicador que afeta a dificuldade da Elite | Real          | -       | -                    |
| ID_Liga               | Identificador único da liga de Elite            | Inteiro       | -       | Chave Primária        |
| Descricao             | Descrição da liga de Elite                      | Texto         | 255     | -                    |
| Numero_Insignias_Necessarias | Número de insignias necessárias para enfrentar a Elite | Inteiro | -       | -                    |
| fk_Ginásio_ID_Ginasio | Chave estrangeira para o Ginásio associado      | Inteiro       | -       | Chave Estrangeira     |

### Passa por
| Tabela | Passa Por |
|--------|------------------|
| Descrição | Representa a relação entre um personagem e um Pokémon em relação a uma rota específica que eles atravessam juntos. |
| Observação | A tabela contém chaves estrangeiras para o personagem, o Pokémon e a rota associada, indicando o caminho percorrido. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| fk_Personagem_Pokedex_Equipe_ID_Personagem | Chave estrangeira para o Personagem da equipe | Inteiro       | -       | Chave Estrangeira     |
| fk_Personagem_Pokedex_Equipe_ID_Pokedex | Chave estrangeira para o Pokémon da equipe | Inteiro       | -       | Chave Estrangeira     |
| fk_Rota_ID_Rota       | Chave estrangeira para a Rota                   | Inteiro       | -       | Chave Estrangeira     |

### Lança
| Tabela | Lança |
|--------|------------------|
| Descrição | Representa a relação entre um personagem e um Pokémon com uma Pokébola específica que o Pokémon usa. |
| Observação | A tabela armazena as chaves estrangeiras para o personagem, o Pokémon e a Pokébola utilizada, indicando quais Pokébolas foram lançadas por quais personagens e Pokémon. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| fk_Personagem_Pokedex_Equipe_ID_Personagem | Chave estrangeira para o Personagem da equipe | Inteiro       | -       | Chave Estrangeira     |
| fk_Personagem_Pokedex_Equipe_ID_Pokedex | Chave estrangeira para o Pokémon da equipe | Inteiro       | -       | Chave Estrangeira     |
| fk_Pokeball_ID_Pokebola | Chave estrangeira para a Pokébola               | Inteiro       | -       | Chave Estrangeira     |

### Surge
| Tabela | Surge |
|--------|------------------|
| Descrição | Representa o encontro entre uma instância de Pokémon e uma rota específica no jogo. |
| Observação | A tabela contém chaves estrangeiras para a rota e a instância de Pokémon, indicando em qual rota o Pokémon surge. |

| Nome                  | Descrição                                      | Tipo de Dado | Tamanho | Restrição de Domínio |
|-----------------------|------------------------------------------------|--------------|---------|----------------------|
| fk_Rota_ID_Rota       | Chave estrangeira para a Rota                   | Inteiro       | -       | Chave Estrangeira     |
| fk_Inst Pokemon_Id_Pokemon_Inst | Chave estrangeira para a Instância Pokémon | Inteiro       | -       | Chave Estrangeira     |



| Versão | Autor         | Descrição da Alteração                                                                                                                                      | Data       |
|--------|---------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|
| 4.0    | Carlos Gabriel  | Criação da terceira versão do dicionário de dados. | 19/08/2024|
