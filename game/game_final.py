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
    cidadeAtual = 1
    
    criar_novo_time(db_engine, timePokemonId)
    
    query = text("""
        INSERT INTO public."Treinador" ("nome", "qtdPokeball", "qtdGreatBall", "qtdUltraBall", "qtdMasterBall", "timePokemonId", "rotaAtualId", "cidadeAtualId") 
        VALUES (:nome_treinador, :qtdPokeball, :qtdGreatBall, :qtdUltraBall, :qtdMasterBall, :timePokemonId, :rotaInicial, :cidadeAtualId)
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
            "rotaInicial": rotaInicial,
            "cidadeAtualId": cidadeAtual
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

def get_treinador(db_engine, treinador_id):
    query = text(f"""
        SELECT * FROM public."Treinador" WHERE "id" = {treinador_id}
    """)
    try:
        result = db_engine.execute(query)
        treinador = result.fetchone()
        return treinador
    except Exception as e:
        slow_print(f"Erro ao buscar treinador {treinador_id}: {e}")
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
    if rotaAtual == None:
        rotaAtual = "NULL"
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
    if rotaAtual == None:
        rotaAtual = 1
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
                    if capturado:  # Se o pokemon foi capturado, sair do loop
                        break
                else:
                    slow_print("Opção inválida. Tente novamente.")
            elif escolha == '2':
                slow_print(f"Você fugiu do {pokemon.nome}!")
                break
            else:
                slow_print("Opção inválida. Tente novamente.")
                
    except Exception as e:
        slow_print(f"Erro ao buscar pokemons: {e}")

def criar_instancia_pokemon(pokemon, treinador):
    pokemon = list(pokemon)
    
    if pokemon[9] is None:
        pokemon[9] = 1
    query = text("""
        INSERT INTO public."PokemonInst" ("pokemonDex", "treinadorId", "nivel", "hp", "ataque", "defesa", "velocidade", "spAtaque", "spDefesa", "timePokemonId")
        VALUES (:pokemonDex, :treinadorId, :nivel, :hp, :ataque, :defesa, :velocidade, :spAtaque, :spDefesa, :timePokemonId)
        RETURNING id;
    """)

    print(pokemon)
    try:
        result = db_engine.execute(query, {
            "pokemonDex": pokemon[0],   # 'dex' é o primeiro campo
            "treinadorId": treinador.id,
            "nivel": pokemon[9],        # 'nivel' é o décimo campo
            "hp": pokemon[3],           # 'hp' é o quarto campo
            "ataque": pokemon[4],       # 'ataque' é o quinto campo
            "defesa": pokemon[5],       # 'defesa' é o sexto campo
            "velocidade": pokemon[6],   # 'velocidade' é o sétimo campo
            "spAtaque": pokemon[7],     # 'spAtaque' é o oitavo campo
            "spDefesa": pokemon[8],      # 'spDefesa' é o nono campo
            "timePokemonId": treinador.timePokemonId
        })
        id_pokemon = result.fetchone()
        db_engine.commit()
        return id_pokemon
    except Exception as e:
        slow_print(f"Erro ao criar instância do Pokémon: {e}")
        return None
    
        
def capturar_pokemon(db_engine, pokemon_adversario, id_treinador, pokeball):
    print(f"Capturando {pokemon_adversario.nome} com a pokeball {pokeball}")
    query_chance_pokeball = text(f"""
        SELECT "chanceCaptura" FROM public."Pokeball" WHERE "id" = {int(pokeball)}
    """)
                   

    try:
        print(f"Tentando capturar {pokemon_adversario.nome} com a pokeball {pokeball}")
        result = db_engine.execute(query_chance_pokeball)
        multiplicador_bola = result.scalar()

        print(f"Chance de captura da pokeball: {multiplicador_bola}")

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
                    treinador = get_treinador(db_engine, id_treinador)
                    id_pokemon = criar_instancia_pokemon(pokemon_adversario, treinador)
                    print(f"ID do Pokémon capturado: {id_pokemon[0]}")
                    if id_pokemon[0]:
                        slow_print(f"Parabéns! Você capturou o {pokemon_adversario[2]}!")
                        pass
                    else:
                        print("Erro ao criar instância do Pokémon capturado.")
                else:
                    print(f"Erro: id_treinador ou nome do Pokémon não foi definido corretamente.")
                return True
            elif chance_captura < 10:
                slow_print(f"Você não conseguiu capturar o {pokemon_adversario[2]}. Ele escapou!")
                pass
    except Exception as e:
        slow_print(f"Erro ao buscar chance de captura da pokeball: {e}")
        return None
    
    return False
    
def adicionar_ao_time(id_treinador):
    pass
    
    

def jogar(db_engine, player_treinador):
    while True:
        rotaAtual = db_engine.execute(text("""
            SELECT "rotaAtualId" FROM public."Treinador" WHERE id = :player_treinador
        """), {"player_treinador": player_treinador}).scalar()
    
        slow_print(f"Você está na rota {rotaAtual}.")
        
        clear_terminal()
        slow_print("O que você deseja fazer?")
        slow_print("1 - Explorar a rota")
        slow_print("2 - Ver informações do treinador")
        slow_print("3 - Ver insígnias obtidas")
        slow_print("4 - Ver Pokemons capturados")
        slow_print("5 - Participar da Liga Pokémon")
        slow_print("6 - Salvar e sair")
        print("\n")
        opcao = slow_input("Escolha uma opção: ")
        print("\n")
        if opcao == '1':
            cidade = is_on_cidade(db_engine, player_treinador)
            andou = False
            
            if cidade is None:
                destinos = get_destinos_rota(db_engine, rotaAtual)
                andou = navega_rotas(db_engine, player_treinador, destinos)
            else:
                # Está na cidade, pode haver um ginásio
                clear_terminal()
                slow_print(f"Você está na cidade {cidade}.")
                destinos = get_destinos_cidade(db_engine, cidade)
                print("\n")
                slow_print("Deseja visitar o ginásio? (S/N)")
                visita_ginasio = slow_input("Escolha uma opção: ")
                
                if visita_ginasio == 's':
                    print("Visitar ginásio", cidade)
                    print("\n")
                    ginasio = get_ginasio_cidade(db_engine, cidade)
       
                    if ginasio.possui_ginasio:
                        npc_ginasio = get_ginasio_npc(db_engine, cidade)
                        if npc_ginasio:
                            clear_terminal()
                            slow_print(f"Você encontrou o líder de ginásio {npc_ginasio.nome}! Prepare-se para a batalha.")
                            lutar_npc(db_engine, player_treinador, npc_ginasio, liga=False)
                    else:
                        slow_print("Não há ginásio nesta cidade.")
                
                andou = navega_cidades(db_engine, player_treinador, destinos)
            
            if andou:
                spawn_pokemon(db_engine, player_treinador)
        
        elif opcao == '2':
            query = text("""
                SELECT * FROM public."Treinador" WHERE "id" = :player_treinador
            """)
            
            try:
                result = db_engine.execute(query, {"player_treinador": player_treinador})
                treinador = result.fetchone()
                print(treinador)
                slow_print(f"Treinador {treinador.nome}:")
                slow_print(f"Pokeballs: {treinador.qtdPokeball}, Great Balls: {treinador.qtdGreatBall}, Ultra Balls: {treinador.qtdUltraBall}, Master Balls: {treinador.qtdMasterBall}")
            except Exception as e:
                slow_print(f"Erro ao buscar informações do treinador: {e}")
        elif opcao == '3':
            buscar_insignas(db_engine, player_treinador)
        
        elif opcao == '4':
            mostrar_pokemons(db_engine, player_treinador)

        elif opcao == '5':
            liga_pokemon(db_engine, player_treinador)

        elif opcao == '6':
            slow_print("Salvando e saindo...")
            break
        else:
            slow_print("Opção inválida. Tente novamente.")
        
        wait_for_keypress()

def liga_pokemon(db_engine, player_treinador):

    query = text("""
        SELECT * FROM public."Liga"
    """)

    query_insigna = text("""
        SELECT COUNT(*) FROM public."EntregaInsignia" WHERE "treinadorId" = :player_treinador
    """)

    try:
        result_insigna = db_engine.execute(query_insigna, {"player_treinador": player_treinador})
        insignas = result_insigna.fetchone()
        if insignas[0] <= 2:
            slow_print("Você precisa de pelo menos 3 insígnias para participar da Liga Pokémon.")
            return
        
        result = db_engine.execute(query)
        ligas = result.fetchall()
        slow_print("Escolha a liga que deseja participar:")
        print("\n")
        count = 1
        if ligas:
            for liga in ligas:
                slow_print(f" {count} -- {liga.descricao}")
                count += 1
            escolha = int(slow_input("Escolha uma liga: "))
            if escolha in range(1, len(ligas)+1):
                slow_print(f"Você escolheu a liga {ligas[escolha-1].descricao}")
                participar_liga(db_engine, player_treinador, ligas[escolha-1])
            else:
                slow_print("Opção inválida. Tente novamente.")
        else:
            slow_print("Nenhuma liga encontrada.")
    except Exception as e:
        slow_print(f"Erro ao buscar ligas: {e}")
   
def participar_liga(db_engine, player_treinador, liga):
    insert_desafio = text(""" 
                    INSERT INTO public."DesafioLiga" ("treinadorId", "ligaId")
                    VALUES (:treinadorId, :ligaId)
                        """)
    insert = text("""
                    INSERT INTO public."BatalhaLiga" ("ganhou", "perdeu", "treinadorId", "npcId", "ligaId")
                    VALUES (:ganhou, :perdeu, :treinadorId, :npcId, :ligaId)
                    """)

    query_npc = text("""
        SELECT * FROM public."NPC" WHERE "ligaId" = :liga
    """)

    try:
        db_engine.execute(insert_desafio, {"treinadorId": player_treinador, "ligaId": liga.id})
        result_npc = db_engine.execute(query_npc, {"liga": liga.id})
        npc = result_npc.fetchone()
        if npc:
            slow_print(f"Você encontrou o NPC {npc.nome}! Prepare-se para a batalha.")
            resultado_luta = lutar_npc(db_engine, player_treinador, npc, liga=True)
            if resultado_luta["ganhou"]:
                db_engine.execute(insert, {"ganhou": True, "perdeu": False, "treinadorId": player_treinador, "npcId": npc.id, "ligaId": liga.id})
                db_engine.commit()
                slow_print("Você venceu a Liga!")
                slow_print("Você é um mestre Pokémon!")
                slow_print("Voce ganhou 3 insiginias!")
                insere_pokeballs(db_engine, player_treinador, 5)
                buscar_insere_insignia(db_engine, player_treinador, npc)
                buscar_insere_insignia(db_engine, player_treinador, npc)
                buscar_insere_insignia(db_engine, player_treinador, npc)
            else:
                db_engine.execute(insert, {"ganhou": False, "perdeu": True, "treinadorId": player_treinador, "npcId": npc.id, "ligaId": liga.id})
                db_engine.commit()
                slow_print("Você perdeu a liga!")
            
        else:
            slow_print("NPC não encontrado.")
    except Exception as e:
        slow_print(f"Erro ao buscar NPC da liga: {e}")
        return None
    
def insere_pokeballs(db_engine, player_treinador, qtd):

    update_ultra = text("""
        UPDATE public."Treinador" SET "qtdUltraBall" = :qtd WHERE "id" = :player_treinador
    """)
    update_master = text("""
        UPDATE public."Treinador" SET "qtdMasterBall" = :qtd WHERE "id" = :player_treinador
    """)
    try:
        db_engine.execute(update_ultra, { "qtd": qtd, "player_treinador": player_treinador })
        db_engine.execute(update_master, { "qtd": qtd, "player_treinador": player_treinador })
        db_engine.commit()
        print(f"Você ganhou {qtd} ultra balls!")
        print(f"Você ganhou {qtd} master balls!")
    except Exception as e:
        slow_print(f"Erro ao adicionar pokeballs: {e}")
        return None

def mostrar_pokemons(db_engine, player_treinador):
    query = text("""
        SELECT * FROM public."DetalhesPokemon" WHERE "treinadorId" = :player_treinador
    """)
    
    try:
        result = db_engine.execute(query, {"player_treinador": player_treinador})
        pokemons = result.fetchall()
        
        if pokemons:
            slow_print("Pokémons capturados:")
            for pokemon in pokemons:
                slow_print(f" ----{pokemon.nome} ( -Nível {pokemon.nivel})")
        else:
            slow_print("Nenhum pokémon capturado.")
    except Exception as e:
        slow_print(f"Erro ao buscar pokémons do treinador: {e}")

def batalhar_pokemon(db_engine, player_treinador, npc_ginasio):
    pokemon = escolher_pokemon_batalha(db_engine, player_treinador)
    pokemon_npc = escolher_pokemon_npc(db_engine, npc_ginasio)

    if pokemon:
        slow_print(f"Você escolheu o {pokemon[13]} para a batalha!")
        if pokemon_npc:
            slow_print(f"O líder de ginásio escolheu o {pokemon_npc[13]} para a batalha!")
            resultado = batalhar(db_engine, player_treinador, pokemon, pokemon_npc)
            if resultado:
                slow_print("Você venceu a batalha!")
                buscar_insere_insignia(db_engine, player_treinador, npc_ginasio)
                return True
            else:
                slow_print("Você perdeu a batalha!")
                return False
            
def buscar_insignas(db_engine, player_treinador):
    query = text("""
        SELECT * FROM public."EntregaInsignia" 
        INNER JOIN public."Insignia" ON "EntregaInsignia"."insigniaId" = "Insignia"."id"
            WHERE "treinadorId" = :player_treinador
    """)
    try:
        result = db_engine.execute(query, {"player_treinador": player_treinador})
        insignas = result.fetchall()
        if insignas:
            slow_print("Insignias obtidas:")
            print(insignas)
            for insigna in insignas:
                slow_print(f"Você possui a I{insigna.nome}")
        else:
            slow_print("Nenhuma insígnia obtida.")
    except Exception as e:
        slow_print(f"Erro ao buscar insígnias: {e}")

def buscar_insere_insignia(db_engine, player_treinador, npc_ginasio):    
    query = text("""
        SELECT * FROM public."Insignia" WHERE "liderId" = :npc_ginasio
    """)

    try:
        result = db_engine.execute(query, {"npc_ginasio": npc_ginasio.id})
        insignia = result.fetchone()
        if insignia:
            query_entrega = text("""
                INSERT INTO public."EntregaInsignia" ("insigniaId", "treinadorId")
                VALUES (:insigniaId, :treinadorId)
            """)
            
            try:
                db_engine.execute(query_entrega, {"insigniaId": insignia.id, "treinadorId": player_treinador})
                db_engine.commit()
                slow_print(f"Parabéns! Você recebeu a insígnia {insignia.nome}!")
                return True
            except Exception as e:
                slow_print(f"Erro ao entregar insígnia: {e}")
                return False
        else:
            slow_print("Insignia não encontrada.")
            return False
    except Exception as e:
        slow_print(f"Erro ao buscar insígnia: {e}")
        return False


def batalhar(db_engine, player_treinador, pokemon, pokemon_npc):
    # Calcula dano
    dano = calcular_dano(pokemon, pokemon_npc)
    slow_print(f"O {pokemon.nome} causou {dano} de dano ao {pokemon_npc.nome}!")
    
    # Verifica se o pokemon foi derrotado
    if pokemon_npc.hp - dano <= 0:
        slow_print(f"O {pokemon_npc.nome} foi derrotado!")
        return True
    else:
        slow_print(f"O {pokemon_npc.nome} contra-atacou!")
        dano_npc = calcular_dano(pokemon_npc, pokemon)
        slow_print(f"O {pokemon_npc.nome} causou {dano_npc} de dano ao {pokemon.nome}!")
        
        # Verifica se o pokemon do jogador foi derrotado
        if pokemon.hp - dano_npc <= 0:
            slow_print(f"O {pokemon.nome} foi derrotado!")
            return False
        else:
            slow_print("A batalha continua...")
            batalhar(db_engine, player_treinador, pokemon, pokemon_npc)

def calcular_dano(pokemon_atacante, pokemon_defensor):
    dano = (pokemon_atacante.ataque / pokemon_defensor.defesa) * pokemon_atacante.nivel
    return dano


def escolher_pokemon_npc(db_engine, npc_ginasio):
    query = text("""
        SELECT * FROM public."PokemonInst" r
        INNER JOIN public."Pokemon" p ON r."pokemonDex" = p."dex"
        WHERE r."treinadorId" = :npc_ginasio
    """)

    try:
        result = db_engine.execute(query, {"npc_ginasio": npc_ginasio.id})
        pokemons = result.fetchall()
        
        if pokemons:
            random_pokemon = random.choice(pokemons)
            return random_pokemon
        else:
            slow_print("Nenhum pokemon encontrado. Ande em rotas para encontrar pokemons e captura-los.")
            return None
    except Exception as e:
        slow_print(f"Erro ao buscar pokémons do treinador: {e}")
        return None


def get_ginasio_npc(db_engine, cidade):

    query = text("""
        SELECT "NPC"."nome", "NPC"."id" FROM public."NPC"
        JOIN public."Ginasio" ON "NPC"."id" = "Ginasio"."liderId"
        WHERE "Ginasio"."cidadeId" = :cidade
    """)

    try:
        result = db_engine.execute(query, {"cidade": cidade})
        npc_ginasio = result.fetchone()
        return npc_ginasio
    except Exception as e:
        slow_print(f"Erro ao buscar NPC do ginásio: {e}")
        return None
    
def get_ginasio_cidade(db_engine, cidade):
    query = text("""
                 SELECT * FROM public."Cidade" WHERE "id" = :cidade
                    """)
    try:
        result = db_engine.execute(query, {"cidade": cidade})
        possui_ginasio = result.fetchone()
        print(possui_ginasio)
        return possui_ginasio
    except Exception as e:
        slow_print(f"Erro ao buscar NPC do ginásio: {e}")
        return None
    
def lutar_npc(db_engine, player_treinador, npc_ginasio, liga):

    print(f"Você deseja lutar contra o líder de ginásio {npc_ginasio.nome}? (S/N)")
    escolha = slow_input("Escolha uma opção: ")

    if escolha == 's':
        resultado = batalhar_pokemon(db_engine, player_treinador, npc_ginasio)
        if resultado:
            slow_print(f"Parabéns! Você derrotou o líder de ginásio {npc_ginasio.nome}!")
        else:
            slow_print(f"Você foi derrotado pelo líder de ginásio {npc_ginasio.nome}.")
        query = text("""
            INSERT INTO public."BatalhaLider" ("ganhou", "perdeu", "treinadorId", "liderId")
            VALUES (:ganhou, :perdeu , :treinadorId, :liderId)
        """)
        if resultado:
            ganhou = True
            perdeu = False
        else:
            ganhou = False
            perdeu = True
        try:
            db_engine.execute(query, {"ganhou": ganhou, "perdeu": perdeu, "treinadorId": player_treinador, "liderId": npc_ginasio.id})
            db_engine.commit()
            if liga:
                return { "ganhou": ganhou, "perdeu": perdeu }   
            return True
        except Exception as e:
            slow_print(f"Erro ao iniciar batalha com líder de ginásio: {e}")
        
        
    else:
        slow_print("Você fugiu da batalha contra o líder de ginásio.")
        return False

# Função para escolher o pokemon da batalha
def escolher_pokemon_batalha(db_engine, player_treinador):
    query = text("""
        SELECT * FROM public."PokemonInst" 
        INNER JOIN public."Pokemon" ON "PokemonInst"."pokemonDex" = "Pokemon"."dex"
        WHERE "PokemonInst"."treinadorId" = :player_treinador
    """)
    
    try:
        result = db_engine.execute(query, {"player_treinador": player_treinador})
        pokemons = result.fetchall()
        if pokemons:
            slow_print("Escolha um Pokémon para a batalha:")
            for idx, pokemon in enumerate(pokemons):
                nome = pokemon[13]
                nivel = pokemon[1]
                slow_print(f"{idx+1} - {nome} (Nível {nivel})")
            
            escolha = int(slow_input("Escolha um Pokémon: "))
            if escolha in range(1, len(pokemons)+1):
                return pokemons[escolha-1]
            else:
                slow_print("Opção inválida. Tente novamente.")
                return None
        else:
            slow_print("Nenhum Pokémon disponível para a batalha.")
            slow_input("Capture pokémons em rotas para poder batalhar.")
            return None
    except Exception as e:
        slow_print(f"Erro ao buscar pokémons do treinador: {e}")
        return None

        
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
