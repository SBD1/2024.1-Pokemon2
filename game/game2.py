import random
from sqlalchemy import create_engine, text
import os
import time

# Funções utilitárias
def clear_terminal():
    os.system('cls' if os.name == 'nt' else 'clear')

def slow_print(text, delay=0.05):
    for char in text:
        print(char, end='', flush=True)
        time.sleep(delay)
    print()

def slow_input(prompt, delay=0.05):
    slow_print(prompt, delay)
    return input()

def wait_for_keypress():
    slow_print("Pressione qualquer tecla para continuar...")
    input()

# Funções relacionadas ao banco de dados
def get_db_engine():
    return create_engine('postgresql://postgres:postgres@localhost:5432/pokemon')

def buscar_treinador(nome_treinador):
    db_engine = get_db_engine().connect()
    try:
        query = text("""
            SELECT id, qtdPokeball, qtdGreatBall, qtdUltraBall, qtdMasterBall, timePokemonId 
            FROM public."Treinador" WHERE nome = :nome_treinador
        """)
        print(f"Buscando treinador {nome_treinador}...")
        result = db_engine.execute(query, {"nome_treinador": nome_treinador})
        treinador = result.fetchone()
        if treinador:
            print(f"Treinador {nome_treinador} encontrado com ID {treinador.id}.")
        else:
            print(f"Treinador {nome_treinador} não encontrado.")
        return treinador
    except Exception as e:
        print(f"Erro ao buscar treinador: {e}")
        return None
    finally:
        db_engine.close()

def inserir_treinador(nome_treinador):
    db_engine = get_db_engine().connect()
    transacao = db_engine.begin()
    try:
        insert = text("""
            INSERT INTO "Treinador" ("nome", "qtdPokeball", "qtdGreatBall", "qtdUltraBall", "qtdMasterBall", "timePokemonId") 
            VALUES ('Ash Ketchum', 10, 5, 3, 1, 1);
        """)
        result = db_engine.execute(insert, {"nome_treinador": nome_treinador})
        id_treinador = result.scalar()
        if id_treinador:
            print(f"Treinador {nome_treinador} inserido com sucesso com ID {id_treinador}.")
            transacao.commit()
        else:
            print(f"Erro ao inserir treinador: {nome_treinador}. ID não retornado.")
            transacao.rollback()
        return id_treinador
    except Exception as e:
        print(f"Erro ao inserir treinador: {e}")
        transacao.rollback()
        return None
    finally:
        db_engine.close()

def criar_instancia_pokemon(pokemon, id_treinador):
    db_engine = get_db_engine().connect()
    try:
        insert_pokemon = text("""
            INSERT INTO Instancia_Pokemon (nome, nivel, hp, tipo, id_treinador)
            VALUES (:nome, :nivel, :hp, :tipo, :id_treinador)
            RETURNING id_pokemon
        """)
        result = db_engine.execute(insert_pokemon.params(
            nome=pokemon['nome'], 
            nivel=pokemon['nivel'], 
            hp=pokemon['hp'], 
            tipo=pokemon['tipo'], 
            id_treinador=id_treinador
        ))
        id_pokemon = result.scalar()
        db_engine.close()
        return id_pokemon
    except Exception as e:
        print(f"Erro ao criar instância de Pokémon: {e}")
        db_engine.close()
        return None

def adicionar_ao_inventario(id_treinador, item_tipo, item_nome, quantidade=1):
    db_engine = get_db_engine().connect()
    transacao = db_engine.begin()
    try:
        if not id_treinador or not item_tipo or not item_nome:
            raise ValueError("Os parâmetros id_treinador, item_tipo e item_nome são obrigatórios.")
        
        print(f"Tentando adicionar ao inventário: id_treinador={id_treinador}, item_tipo={item_tipo}, item_nome={item_nome}, quantidade={quantidade}")

        query = text(f"""
            INSERT INTO Inventario (id_treinador, item_tipo, item_nome, quantidade)
            VALUES (:id_treinador, :item_tipo, :item_nome, :quantidade)
            ON CONFLICT (id_treinador, item_tipo, item_nome)
            DO UPDATE SET quantidade = Inventario.quantidade + :quantidade
        """)
        db_engine.execute(query.params(id_treinador=id_treinador, item_tipo=item_tipo, item_nome=item_nome, quantidade=quantidade))

        transacao.commit()  # Commit após a inserção

        check_query = text(f"""
            SELECT * FROM Inventario 
            WHERE id_treinador = :id_treinador AND item_tipo = :item_tipo AND item_nome = :item_nome
        """)
        result = db_engine.execute(check_query.params(id_treinador=id_treinador, item_tipo=item_tipo, item_nome=item_nome)).fetchall()
        
        print(f"Dados inseridos/verificados: {result}")
        
        if result:
            print(f"O item {item_nome} foi adicionado ao inventário com sucesso.")
        else:
            print(f"Falha ao adicionar o item {item_nome} ao inventário. Nenhum resultado encontrado.")
    
    except Exception as e:
        transacao.rollback()  # Rollback em caso de erro
        print(f"Ocorreu um erro ao adicionar ao inventário: {e}")
    
    finally:
        db_engine.close()

def visualizar_inventario(id_treinador):
    db_engine = get_db_engine().connect()
    try:
        print(f"Consultando inventário para id_treinador={id_treinador}")
        query = text("""
            SELECT item_tipo, item_nome, quantidade 
            FROM Inventario 
            WHERE id_treinador = :id_treinador
        """)
        result = db_engine.execute(query.params(id_treinador=id_treinador))
        inventario = result.fetchall()
        print(f"Resultados encontrados: {inventario}")
        
        if not inventario:
            slow_print("O inventário está vazio.")
        else:
            slow_print("Seu inventário:")
            for item_tipo, item_nome, quantidade in inventario:
                slow_print(f"- {item_nome} ({item_tipo}): {quantidade}")
    except Exception as e:
        print(f"Erro ao consultar o inventário: {e}")
    finally:
        db_engine.close()
    wait_for_keypress()

def capturar_pokemon(pokemon_adversario, id_treinador):
    chance_captura = random.randint(1, 100)
    if chance_captura <= 50:  
        slow_print(f"Parabéns! Você capturou o {pokemon_adversario['nome']}!")
        print(f"Tentando adicionar {pokemon_adversario['nome']} ao inventário.")
        if id_treinador and pokemon_adversario['nome']:
            id_pokemon = criar_instancia_pokemon(pokemon_adversario, id_treinador)
            if id_pokemon:
                adicionar_ao_inventario(id_treinador, "Pokemon", pokemon_adversario['nome'])
            else:
                print("Erro ao criar instância do Pokémon capturado.")
        else:
            print(f"Erro: id_treinador ou nome do Pokémon não foi definido corretamente.")
        return True
    else:
        slow_print(f"Você não conseguiu capturar o {pokemon_adversario['nome']}. Ele escapou!")
        return False

def escolher_pokemon_inicial():
    pokemons_iniciais = [
        {"nome": "Pikachu", "nivel": 5, "hp": 35, "tipo": "Elétrico"},
        {"nome": "Bulbasauro", "nivel": 5, "hp": 45, "tipo": "Grama"},
        {"nome": "Squirtle", "nivel": 5, "hp": 44, "tipo": "Água"},
        {"nome": "Charmander", "nivel": 5, "hp": 39, "tipo": "Fogo"}
    ]

    print("\nEscolha o seu Pokémon inicial:")
    for i, pokemon in enumerate(pokemons_iniciais):
        print(f"{i + 1}. {pokemon['nome']} (Tipo: {pokemon['tipo']}, HP: {pokemon['hp']})")

    escolha = input("\nDigite o número do Pokémon que deseja escolher: ")

    while not escolha.isdigit() or not (1 <= int(escolha) <= len(pokemons_iniciais)):
        print("Escolha inválida. Tente novamente.")
        escolha = input("\nDigite o número do Pokémon que deseja escolher: ")

    return pokemons_iniciais[int(escolha) - 1]

def iniciar_jogo():
    clear_terminal()

    slow_print("Bem-vindo ao mundo Pokémon!", delay=0.08)
    nome_treinador = slow_input("Qual é o seu nome, treinador? ")

    treinador = buscar_treinador(nome_treinador)

    if not treinador:
        id_treinador = inserir_treinador(nome_treinador)
    else:
        id_treinador = treinador['id']

    if id_treinador:
        pokemon_inicial = escolher_pokemon_inicial()
        slow_print(f"\nVocê começou com um {pokemon_inicial['nome']}!")
        adicionar_ao_inventario(id_treinador, "Pokémon", pokemon_inicial['nome'])
        visualizar_inventario(id_treinador)
    else:
        slow_print("Houve um problema ao inicializar o treinador. Encerrando o jogo.")



if __name__ == "__main__":
    iniciar_jogo()
