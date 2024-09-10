# Jogo Pokemon

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

## Funcoes do Jogo

#### `slow_print(text, delay=0.1)`
Esta função imprime o texto de maneira lenta, caractere por caractere, com um atraso ajustável entre os caracteres. Ela também verifica a entrada do usuário para interromper a impressão e mostrar o restante do texto rapidamente se houver uma interrupção.

#### `slow_input(prompt, delay=0.1)`
Exibe uma mensagem com a função `slow_print` e aguarda a entrada do usuário.

#### `clear_terminal()`
Limpa a tela do terminal, utilizando o comando apropriado dependendo do sistema operacional (Windows ou Unix-like).

#### `wait_for_keypress()`
Imprime uma mensagem solicitando que o usuário pressione qualquer tecla para continuar, e aguarda a entrada do usuário.

#### `get_db_engine()`
Cria e retorna uma conexão com o banco de dados PostgreSQL usando SQLAlchemy.

#### `get_ultimo_id_time(db_engine)`
Obtém o maior ID presente na tabela `TimePokemon` do banco de dados. Se houver um erro, uma mensagem é exibida e retorna `None`.

#### `criar_novo_time(db_engine, new_time_id)`
Insere um novo registro na tabela `TimePokemon` com o `id` fornecido. Exibe uma mensagem de erro caso a inserção falhe.


#### `criar_novo_treinador(db_engine)`
Cria um novo treinador no banco de dados, inserindo dados como nome, número de pokébolas, e um novo time. Retorna o treinador criado ou exibe uma mensagem de erro se algo der errado.

#### `listar_treinadores(db_engine)`
Lista todos os treinadores presentes no banco de dados, exibindo suas informações detalhadas. Em caso de erro, exibe uma mensagem correspondente.

#### `carregar_treinador(db_engine)`
Lista os treinadores disponíveis e permite ao usuário carregar um treinador com base no ID selecionado. Retorna o treinador carregado ou exibe uma mensagem de erro se o treinador não for encontrado ou outro problema ocorrer.

#### `get_treinador(db_engine, treinador_id)`
Recupera e retorna os dados completos de um treinador a partir de seu `id`. Em caso de erro, retorna `None` e exibe uma mensagem.

#### `navega_rotas(db_engine, player_treinador, destinos)`
Permite ao jogador escolher entre destinos disponíveis nas rotas, seja uma nova cidade ou continuar na rota. Atualiza a posição do treinador e retorna se ele se moveu ou não.

#### `navega_cidades(db_engine, player_treinador, destinos_cidade)`
Oferece ao jogador a opção de permanecer na cidade ou seguir para a próxima rota. Atualiza a posição do treinador e retorna um valor booleano dependendo da escolha.

#### `set_posicao_treinador_rota(db_engine, player_treinador, rotaAtual)`
Atualiza a posição do treinador para a rota atual no banco de dados, resetando a cidade atual. Em caso de erro, exibe uma mensagem.

#### `set_posicao_treinador_cidade(db_engine, player_treinador, cidadeAtual)`
Atualiza a posição do treinador para a cidade atual no banco de dados, resetando a rota atual. Exibe uma mensagem de erro caso a atualização falhe.

#### `get_cidade(db_engine, cidadeId)`
Retorna os dados de uma cidade a partir do seu `id`. Em caso de erro, retorna `None`.

#### `get_destinos_rota(db_engine, rotaAtual)`
Retorna os destinos (rotas ou cidades) disponíveis a partir de uma rota específica. Se houver erro, retorna `None`.

#### `get_destinos_cidade(db_engine, cidadeAtual)`
Obtém as rotas associadas a uma cidade específica. Em caso de erro, retorna `None`.

#### `is_on_cidade(db_engine, player_treinador)`
Verifica se o treinador está em uma cidade. Retorna o `id` da cidade atual ou `None` se o treinador não estiver em uma cidade.

#### `criar_instancia_pokemon(pokemon, treinador)`
Cria uma instância de um Pokémon no banco de dados associada a um treinador, inserindo suas estatísticas como nível, HP, ataque, defesa e outros atributos.

#### `capturar_pokemon(db_engine, pokemon_adversario, id_treinador, pokeball)`
Tenta capturar um Pokémon adversário com base na chance de captura da pokebola escolhida. Se capturado, cria uma instância do Pokémon para o treinador.

#### `jogar(db_engine, player_treinador)`
Controla o fluxo do jogo, permitindo que o jogador explore rotas, veja informações do treinador, insígnias, Pokémon capturados ou salve o progresso.

#### `mostrar_pokemons(db_engine, player_treinador)`
Exibe uma lista dos Pokémon capturados pelo treinador, consultando o banco de dados.

#### `batalhar_pokemon(db_engine, player_treinador, npc_ginasio)`
Inicia uma batalha entre o Pokémon do jogador e o Pokémon de um líder de ginásio, determinando o resultado da batalha.

#### `buscar_insignas(db_engine, player_treinador)`
Exibe as insígnias obtidas pelo treinador, realizando uma consulta ao banco de dados.

#### `buscar_insere_insignia(db_engine, player_treinador, npc_ginasio)`
Entrega uma insígnia ao treinador após a vitória contra um líder de ginásio, inserindo o registro no banco de dados.

#### `batalhar(db_engine, player_treinador, pokemon, pokemon_npc)`
Executa uma batalha entre o Pokémon do jogador e o Pokémon NPC, calculando danos e determinando o vencedor.

#### `calcular_dano(pokemon_atacante, pokemon_defensor)`
Calcula o dano causado pelo Pokémon atacante com base no ataque, defesa e nível dos Pokémons envolvidos.

#### `escolher_pokemon_npc(db_engine, npc_ginasio)`
Seleciona um Pokémon aleatório pertencente ao NPC de um ginásio para a batalha.

#### `get_ginasio_npc(db_engine, cidade)`
Obtém o NPC líder do ginásio de uma determinada cidade a partir do banco de dados.

#### `get_ginasio_cidade(db_engine, cidade)`
Verifica se uma cidade possui ginásio consultando o banco de dados.

#### `lutar_npc(db_engine, player_treinador, npc_ginasio)`
Inicia uma batalha contra o líder de ginásio, registrando o resultado no banco de dados.

#### `escolher_pokemon_batalha(db_engine, player_treinador)`
Permite ao jogador escolher um Pokémon de sua equipe para participar de uma batalha.

#### `iniciar_jogo(db_engine)`
Exibe o menu principal do jogo, permitindo ao jogador criar um novo treinador, carregar um salvo ou sair.
