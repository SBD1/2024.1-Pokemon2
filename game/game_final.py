import time
import sys
import select
import os
from sqlalchemy import create_engine, text
import random

# Funções utilitárias para a interface do terminal
def slow_print(text, delay=0.1):
    start_time = time.time()
    for char in text:
        sys.stdout.write(char)
        sys.stdout.flush()
        time.sleep(delay / len(text))
        if time.time() - start_time > delay:
            if sys.stdin in select.select([sys.stdin], [], [], 0)[0]:
                input()
                print(text[len(text)-1:])
                break
    print()

def slow_input(prompt, delay=0.1):
    slow_print(prompt, delay)
    return input()

def clear_terminal():
    os.system('cls' if os.name == 'nt' else 'clear')

def wait_for_keypress():
    slow_print("Pressione qualquer tecla para continuar...")
    input()

# Conectar ao banco de dados usando SQLAlchemy
def get_db_engine():
    return create_engine('postgresql://postgres:postgres@localhost:5432/pokemon')

def get_ultimo_id_time(db_engine):
    query = text("""
        SELECT MAX(id) FROM public."TimePokemon"
    """)
    try:
        result = db_engine.execute(query)
        ultimo_id = result.scalar()
        return ultimo_id
    except Exception as e:
        slow_print(f"Erro ao buscar último ID de time: {e}")
        return None
    
def criar_novo_time(db_engine, new_time_id):
    query = text("""
            INSERT INTO "TimePokemon" ("id") VALUES (:new_id)
        """)
    try:
        db_engine.execute(query, {"new_id": new_time_id})
        db_engine.commit()
    except Exception as e:
        slow_print(f"Erro ao criar novo time: {e}")

# Função para criar um novo treinador no banco de dados
def criar_novo_treinador(db_engine):
    nome_treinador = slow_input("Digite o nome do novo treinador: ")
    qtdPokeball = 5
    qtdGreatBall = 0
    qtdUltraBall = 0
    qtdMasterBall = 0
    timePokemonId = get_ultimo_id_time(db_engine) + 1
    rotaInicial = 1
    
    criar_novo_time(db_engine, timePokemonId)
    
    query = text("""
        INSERT INTO public."Treinador" ("nome", "qtdPokeball", "qtdGreatBall", "qtdUltraBall", "qtdMasterBall", "timePokemonId", "rotaAtualId", "cidadeAtualId") 
        VALUES (:nome_treinador, :qtdPokeball, :qtdGreatBall, :qtdUltraBall, :qtdMasterBall, :timePokemonId, :rotaInicial, NULL)
        RETURNING id;
    """)

    try:
        result = db_engine.execute(query, {
            "nome_treinador": nome_treinador,
            "qtdPokeball": qtdPokeball,
            "qtdGreatBall": qtdGreatBall,
            "qtdUltraBall": qtdUltraBall,
            "qtdMasterBall": qtdMasterBall,
            "timePokemonId": timePokemonId,
            "rotaInicial": rotaInicial
        })

        treinador= result.fetchone()
        db_engine.commit()
        slow_print(f"Treinador {nome_treinador} criado com sucesso!")
        return treinador
    except Exception as e:
        slow_print(f"Erro ao criar treinador: {e}")

# Função para listar treinadores salvos no banco de dados
def listar_treinadores(db_engine):
    query = text("""
        SELECT id, nome, "qtdPokeball", "qtdGreatBall", "qtdUltraBall", "qtdMasterBall", "timePokemonId" 
        FROM public."Treinador"
    """)
    try:
        result = db_engine.execute(query)
        treinadores = result.fetchall()

        if treinadores:
            slow_print("Treinadores salvos:")
            for treinador in treinadores:
                slow_print(f"ID: {treinador.id}, Nome: {treinador.nome}, Pokeballs: {treinador.qtdPokeball}, "
                           f"Great Balls: {treinador.qtdGreatBall}, Ultra Balls: {treinador.qtdUltraBall}, "
                           f"Master Balls: {treinador.qtdMasterBall}, Time Pokemon ID: {treinador.timePokemonId}")
        else:
            slow_print("Nenhum treinador salvo encontrado.")
    except Exception as e:
        slow_print(f"Erro ao listar treinadores: {e}")

# Função para carregar um treinador salvo
def carregar_treinador(db_engine):
    listar_treinadores(db_engine)
    treinador_id = int(slow_input("Digite o ID do treinador para carregar (ou 0 para voltar): "))
    
    if treinador_id == 0:
        return None
    
    query = text("""
        SELECT id, nome, "qtdPokeball", "qtdGreatBall", "qtdUltraBall", "qtdMasterBall", "timePokemonId" 
        FROM public."Treinador" WHERE id = :treinador_id
    """)
    try:
        result = db_engine.execute(query, {"treinador_id": treinador_id})
        treinador = result.fetchone()

        if treinador:
            slow_print(f"Treinador {treinador.nome} carregado com sucesso!")
            return treinador
        else:
            slow_print(f"Treinador com ID {treinador_id} não encontrado.")
            return None
    except Exception as e:
        slow_print(f"Erro ao carregar treinador: {e}")
        return None

        
def navega_rotas(db_engine, player_treinador, destinos):
    andou = False
    if destinos:
        for idx, destino in enumerate(destinos):
            if destino[1] != None:
                cidade = get_cidade(db_engine, destino[1])
                if cidade:
                    slow_print(f"  .{idx+1} - Visitar {cidade[1]}")  
            if destino[0]!= None:
                slow_print(f"  .{idx+2} - Seguir para Rota {destino[0]}")
        escolha = int(slow_input("Escolha um destino: "))
        if escolha in range(1, len(destinos)+2):
            if escolha % 2 == 0:
                # Seguir para rota
                if (escolha>2):
                    set_posicao_treinador_rota(db_engine, player_treinador, destinos[escolha/2][0])
                    slow_print(f"Você seguiu para rota {destinos[escolha/2][0]}")
                else:
                    set_posicao_treinador_rota(db_engine, player_treinador, destinos[0][0])
                    slow_print(f"Você seguiu para rota {destinos[0][0]}")
                andou = True
            else:
                # Visitar cidade
                if (escolha>2):
                    set_posicao_treinador_cidade(db_engine, player_treinador, destinos[escolha/2][1])
                    slow_print(f"Você chegou a cidade de {get_cidade(db_engine, destinos[escolha/2][1])}")
                else:
                    set_posicao_treinador_cidade(db_engine, player_treinador, destinos[0][1])
                    slow_print(f"Você chegou a cidade de {get_cidade(db_engine, destinos[0][1])}")              
    else:
        slow_print("Nenhum destino encontrado.")
        #TODO:fazer retorno
    
    return andou
        
def navega_cidades(db_engine, player_treinador, destinos_cidade):
    try:
        slow_print(f"  .0 - Permanecer na cidade") 
        slow_print(f"  .1 - Seguir para Rota {destinos_cidade}") 
        escolha = int(slow_input("Escolha um destino: "))
        if escolha == 1:
            set_posicao_treinador_rota(db_engine, player_treinador, destinos_cidade)
            slow_print(f"Você seguiu para rota {destinos_cidade}")
            return True
        elif escolha == 0:
            slow_print(f"Você permaneceu na cidade")
            return False
        else:
            slow_print("Opção inválida. Tente novamente.")
            return False
    except Exception as e:
        slow_print(f"Erro ao buscar destinos da cidade {destinos_cidade}: {e}")
        return None
    
def set_posicao_treinador_rota(db_engine, player_treinador, rotaAtual):
    query_rotaAtual = text(f"""
        UPDATE public."Treinador" SET "rotaAtualId" = {rotaAtual} WHERE "id" = {player_treinador}
    """)
    query_reseta_cidadeAtual = text(f"""
            UPDATE public."Treinador" SET "cidadeAtualId" = NULL WHERE "id" = {player_treinador}
        """)
    
    try:
        # Set cidadeAtualId to NULL
        db_engine.execute(query_reseta_cidadeAtual)
        db_engine.commit()
        
        try:
            db_engine.execute(query_rotaAtual)
            db_engine.commit()
        except Exception as e:
            slow_print(f"Erro ao atualizar posição do treinador: {e}")    
    except Exception as e:
        slow_print(f"Erro ao atualizar posição do treinador: {e}")
        
def set_posicao_treinador_cidade(db_engine, player_treinador, cidadeAtual):
    query_cidade = text(f"""
        UPDATE public."Treinador" SET "cidadeAtualId" = {cidadeAtual} WHERE "id" = {player_treinador}
    """)
    query_reseta_rotaAtual = text(f"""
            UPDATE public."Treinador" SET "rotaAtualId" = NULL WHERE "id" = {player_treinador}
        """)
    try:
        # Set rotaAtualId to NULL
        db_engine.execute(query_reseta_rotaAtual)
        db_engine.commit()
        try:
            # Set cidadeAtualId
            db_engine.execute(query_cidade)
            db_engine.commit()
        except Exception as e:
            slow_print(f"Erro ao atualizar posição do treinador: {e}")    
        
    except Exception as e:
        slow_print(f"Erro ao atualizar posição do treinador: {e}")
        
def get_cidade(db_engine, cidadeId):
    query = text(f"""
        SELECT * FROM public."Cidade" WHERE "id" = {cidadeId}
    """)
    try:
        result = db_engine.execute(query)
        cidade = result.fetchone()
        return cidade
    except Exception as e:
        slow_print(f"Erro ao buscar cidade {cidadeId}: {e}")
        return None
    
def get_destinos_rota(db_engine, rotaAtual):    
    query = text(f"""
        SELECT "rotaDestinoId", "cidadeDestinoId" FROM public."Rota" WHERE "id" = {rotaAtual}
    """)
    try:
        result = db_engine.execute(query)
        destinos = result.fetchall()
        return destinos
    except Exception as e:
        slow_print(f"Erro ao buscar destinos da rota {rotaAtual}: {e}")
        return None

def get_destinos_cidade(db_engine, cidadeAtual):
    query = text(f"""
        SELECT "rotaId" FROM public."Cidade" WHERE "id" = {cidadeAtual}
    """)
    try:
        result = db_engine.execute(query)
        destinos = result.fetchone()
        destinos = destinos.rotaId
        return destinos
    except Exception as e:
        slow_print(f"Erro ao buscar destinos da cidade {cidadeAtual}: {e}")
        return None

def is_on_cidade(db_engine, player_treinador):
    query = text(f"""
        SELECT "cidadeAtualId" FROM public."Treinador" WHERE "id" = {player_treinador}
    """)
    try:
        result = db_engine.execute(query)
        cidadeAtual = result.scalar()
        if cidadeAtual:
            return cidadeAtual
        else:
            return None
    except Exception as e:
        slow_print(f"Erro ao buscar cidade atual do treinador: {e}")
        return None

def reduzir_pokeball(db_engine, player_treinador, pokeball):
    if pokeball == 1:
        query = text(f"""
            UPDATE public."Treinador" SET "qtdPokeball" = "qtdPokeball" - 1 WHERE "id" = {player_treinador}
        """)
    elif pokeball == 2:
        query = text(f"""
            UPDATE public."Treinador" SET "qtdGreatBall" = "qtdGreatBall" - 1 WHERE "id" = {player_treinador}
        """)
    elif pokeball == 3:
        query = text(f"""
            UPDATE public."Treinador" SET "qtdUltraBall" = "qtdUltraBall" - 1 WHERE "id" = {player_treinador}
        """)
    elif pokeball == 4:
        query = text(f"""
            UPDATE public."Treinador" SET "qtdMasterBall" = "qtdMasterBall" - 1 WHERE "id" = {player_treinador}
        """)
        
    try:
        db_engine.execute(query)
        db_engine.commit()
    except Exception as e:
        slow_print(f"Erro ao reduzir quantidade de pokeballs: {e}")
        
   
def spawn_pokemon(db_engine, player_treinador):
    query = text(f"""
        SELECT COUNT(*) FROM public."Pokemon"
    """)
    
    try:
        result = db_engine.execute(query)
        total_pokemons = result.scalar()
        
        random_pokemon = random.randint(1, total_pokemons)
        
        query_pokemon = text(f"""
            SELECT * FROM public."Pokemon" WHERE "dex" = {random_pokemon}
        """)
        
        result_pokemon = db_engine.execute(query_pokemon)
        pokemon = result_pokemon.fetchone()
        
        slow_print(f"Um {pokemon.nome} selvagem apareceu!")
        
        while True:
            slow_print("O que você deseja fazer?")
            
            slow_print("1 - Capturar")
            slow_print("2 - Fugir")
        
            escolha = slow_input("Escolha uma opção: ")
            
            if escolha == '1':
                qtd_pokebolas = db_engine.execute(text(f"""
                    SELECT "qtdPokeball", "qtdGreatBall", "qtdUltraBall", "qtdMasterBall" FROM public."Treinador" WHERE "id" = {player_treinador}
                """))
                
                pokebolas = qtd_pokebolas.fetchone()
                
                string_prompt = ""
                options = []
                if pokebolas[0] > 0:
                    string_prompt += "1 - Pokeball ("+str(pokebolas[0])+")\n"
                    options.append("1")
                if pokebolas[1] > 0:
                    string_prompt += "2 - Great Ball ("+str(pokebolas[1])+")\n"
                    options.append("2")
                if pokebolas[2] > 0:
                    string_prompt += "3 - Ultra Ball ("+str(pokebolas[2])+")\n"
                    options.append("3")
                if pokebolas[3] > 0:
                    string_prompt += "4 - Master Ball ("+str(pokebolas[3])+")\n"
                    options.append("4")
                
                print(string_prompt)
                
                pokeball = slow_input("Escolha uma pokeball: ")
                                
                if pokeball in options:
                    pokeball = int(pokeball)
                    reduzir_pokeball(db_engine, player_treinador, pokeball)
                    capturado = capturar_pokemon(db_engine, pokemon, player_treinador, pokeball)
                    if capturado:
                        break
                else:
                    slow_print("Opção inválida. Tente novamente.")
            elif escolha == '2':
                slow_print(f"Você fugiu do {pokemon.nome}!")
            else:
                slow_print("Opção inválida. Tente novamente.")
                
    except Exception as e:
        slow_print(f"Erro ao buscar pokemons: {e}")
        
def capturar_pokemon(db_engine, pokemon_adversario, id_treinador, pokeball):
    
    query_chance_pokeball = text(f"""
        SELECT "chanceCaptura" FROM public."Pokeball" WHERE "id" = {int(pokeball)}
    """)
                   
    print(f"Chance de captura da pokeball: {type(pokeball)}")
    try:
        print(f"Tentando capturar {pokemon_adversario.nome} com a pokeball {pokeball}")
        result = db_engine.execute(query_chance_pokeball)
        multiplicador_bola = result.scalar()
        
        if multiplicador_bola == 100:
            slow_print(f"Parabéns! Você capturou o {pokemon_adversario.nome}!")
            print(f"Tentando adicionar {pokemon_adversario.nome} ao time.")
            return True
            
        else:
        
            chance_captura = random.randint(1, 100)
            chance_captura = chance_captura + multiplicador_bola/10
            
            if chance_captura >= 70 :  
                slow_print(f"Parabéns! Você capturou o {pokemon_adversario.nome}!")
                print(f"Tentando adicionar {pokemon_adversario.nome} ao time.")
                if id_treinador and pokemon_adversario.nome:
                    id_pokemon = criar_instancia_pokemon(pokemon_adversario, id_treinador)
                    if id_pokemon:
                        #adicionar_ao_inventario(id_treinador, "Pokemon", pokemon_adversario['nome'])
                        pass
                    else:
                        print("Erro ao criar instância do Pokémon capturado.")
                else:
                    print(f"Erro: id_treinador ou nome do Pokémon não foi definido corretamente.")
                return True
            elif chance_captura < 10:
                slow_print(f"Você não conseguiu capturar o {pokemon_adversario['nome']}. Ele escapou!")
                return False
    except Exception as e:
        slow_print(f"Erro ao buscar chance de captura da pokeball: {e}")
        return None
    
    return False
    
    
def criar_instancia_pokemon(pokemon, id_treinador):
    query = text("""
        INSERT INTO public."PokemonTreinador" ("id_treinador", "id_pokemon", "nivel", "hp") 
        VALUES (:id_treinador, :id_pokemon, :nivel, :hp)
        RETURNING id;
    """)
    
    try:
        result = db_engine.execute(query, {
            "id_treinador": id_treinador,
            "id_pokemon": pokemon['id'],
            "nivel": pokemon['nivel'],
            "hp": pokemon['hp']
        })
        
        id_pokemon = result.fetchone()
        db_engine.commit()
        return id_pokemon
    except Exception as e:
        slow_print(f"Erro ao criar instância do Pokémon: {e}")
        return None
    
def adicionar_ao_time(id_treinador):
    pass
    
    

def jogar(db_engine, player_treinador):
    while True:
        
        rotaAtual = db_engine.execute(text(f"""
        SELECT "rotaAtualId" FROM public."Treinador" WHERE id = {player_treinador}
    """)).scalar()
    
        slow_print(f"Você está na rota {rotaAtual}.")
        
        clear_terminal()
        slow_print("O que você deseja fazer?")
        slow_print("1 - Explorar a rota")
        slow_print("2 - Ver informações do treinador")
        slow_print("3 - Salvar e sair")
        opcao = slow_input("Escolha uma opção: ")
        
        if opcao == '1':
            cidade = is_on_cidade(db_engine, player_treinador)
            andou = False
            if cidade == None:
                destinos = get_destinos_rota(db_engine, rotaAtual)
                andou = navega_rotas(db_engine, player_treinador, destinos)
            else:
                destinos = get_destinos_cidade(db_engine, cidade)
                andou = navega_cidades(db_engine, player_treinador, destinos)
            if andou:
                spawn_pokemon(db_engine, player_treinador)
            
        elif opcao == '2':
            # Mostra Infos Treinador
            
            query = text(f"""
                SELECT * FROM public."Treinador" WHERE "id" = {player_treinador}
            """)
            
            try:
                result = db_engine.execute(query)
                treinador = result.fetchone()
                slow_print(f"Treinador {treinador[1]}:")
                slow_print(f"Pokeballs: {treinador[2]}, Great Balls: {treinador[3]}, Ultra Balls: {treinador[4]}, Master Balls: {treinador[5]}")
            except Exception as e:
                slow_print(f"Erro ao buscar informações do treinador: {e}")
        elif opcao == '3':
            slow_print("Salvando e saindo...")
            break
        else:
            slow_print("Opção inválida. Tente novamente.")
        
        wait_for_keypress()
        
# Função principal que inicia o jogo
def iniciar_jogo(db_engine):
    while True:
        clear_terminal()
        slow_print("Bem-vindo ao jogo!")
        slow_print("1 - Criar novo treinador")
        slow_print("2 - Carregar treinador salvo")
        slow_print("3 - Sair")
        opcao = slow_input("Escolha uma opção: ")

        if opcao == '1':
            player_treinador = criar_novo_treinador(db_engine)
            break
        elif opcao == '2':
            player_treinador = carregar_treinador(db_engine)
            if player_treinador:
                slow_print(f"Treinador {player_treinador.nome} pronto para jogar!")
            break
        elif opcao == '3':
            slow_print("Saindo do jogo...")
            break
        else:
            slow_print("Opção inválida. Tente novamente.")
        
        wait_for_keypress()
    return player_treinador

if __name__ == "__main__":
    db_engine = get_db_engine().connect()
        
    player_treinador = iniciar_jogo(db_engine).id
    jogar(db_engine, player_treinador)
