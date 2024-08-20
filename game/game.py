import time
import sys
import select
import os
import platform
from sqlalchemy import create_engine, text
from faker import Faker

## Initialize Game

def get_db_engine():
    return create_engine('postgresql://postgres:postgres@localhost:5432/pokemon')

# Game Functions


# Rotas 

def inserir_cidade(db_engine, possui_pokecenter, possui_pokemarket, possui_ginasio, lider_id, ginasio_id, insignia_id, rota_id):
    insert_cidade = f"""
        INSERT INTO Cidade (Possui_Pokecenter, Possui_Pokemarket, Possui_Ginasio, 
                            fk_Lider_Ginasio_Insignia_ID_Lider, fk_Lider_Ginasio_Insignia_ID_Ginasio, 
                            fk_Lider_Ginasio_Insignia_ID_Insignia, fk_Rota_ID_Rota) 
        VALUES ({possui_pokecenter}, {possui_pokemarket}, {possui_ginasio}, 
                {lider_id}, {ginasio_id}, {insignia_id}, {rota_id})
    """
    db_engine.execute(text(insert_cidade).execution_options(autocommit=True))

# Função para inserir rotas
def inserir_rota(db_engine, id_rota, rota_id_conectada):
    insert_rota = f"""
        INSERT INTO Rota (ID_Rota, fk_Rota_ID_Rota) 
        VALUES ({id_rota}, {rota_id_conectada})
    """
    db_engine.execute(text(insert_rota).execution_options(autocommit=True))

def inicializar_caminhos():
    # Inserindo algumas cidades
    inserir_cidade(db_engine, 1, 1, 0, 0, 0, 0, 1)  # Pallet Town
    inserir_cidade(db_engine, 1, 1, 1, 1, 1, 1, 2)           # Viridian City
    inserir_cidade(db_engine, 1, 1, 1, 2, 2, 2, 3)           # Pewter City
    inserir_cidade(db_engine, 1, 1, 1, 3, 3, 3, 4)           # Cerulean City

    # Inserindo algumas rotas
    inserir_rota(db_engine, 1, 1)  # Rota 1 (Pallet Town -> Viridian City)
    inserir_rota(db_engine, 2, 1)     # Rota 2 (Pallet Town -> Pewter City)
    inserir_rota(db_engine, 3, 2)     # Rota 3 (Pallet Town  -> Cerulean City)

def exibir_menu_rotas():
    clear_terminal()
    slow_print("Escolha uma rota para seguir:")
    print("\n")
    print("1: Pallet Town -> Viridian City")
    print("2: Pallet Town  -> Pewter City")
    print("3: Pallet Town  -> Cerulean City")
    print("\n")
    escolha = slow_input("Digite o número da rota que deseja seguir: ")
    
    if escolha in ['1', '2', '3']:
        id_rota = int(escolha)
        print("\n")
        print(f"Você escolheu seguir a Rota {id_rota}.")
        print("\n")
    else:
        print("Opção inválida. Por favor, tente novamente.")
        print("\n")
    wait_for_keypress()

def slow_print(text, delay=1):
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


def slow_input(prompt, delay=1):
    slow_print(prompt, delay)
    return input() 

def clear_terminal():
    system_name = platform.system()
    if system_name == 'Windows':
        os.system('cls')
    else:
        os.system('clear')

def wait_for_keypress():
    input("Pressione Enter para continuar...")

def insert_five_great_pokeballs():
    for i in range(5):
        Chance_Captura = 50
        Pokeball_TIPO = 2
        ID_Pokebola = faker.random_int(min=0, max=10000)
        insert = f"INSERT INTO Pokeball (ID_Pokebola,Chance_Captura,Pokeball_TIPO) VALUES ({ID_Pokebola},{Chance_Captura}, {Pokeball_TIPO})"
        db_engine.execute(text(insert).execution_options(autocommit=True))

def insert_personagem(nome, pokebolas):
    id_personagem = faker.random_int(min=0, max=10000)
    pokebolas_normais = 0
    pokebolas_greats = 0
    pokebolas_ultras = 0
    id_pokedex = faker.random_int(min=0, max=10000)
    numero_pokemons = 0
    numero_pokemons_vistos = 0
    numero_pokemons_capturados = 0
    status_completa = 0
    insert_personagem = f"""
INSERT INTO Personagem_Pokedex (
    ID_Personagem, 
    Nome, 
    Pokebolas_Normais, 
    Pokebolas_Greats, 
    Pokebolas_Ultras, 
    ID_Pokedex, 
    Numero_Pokemons, 
    Numero_Pokemons_Vistos, 
    Numero_Pokemons_Capturados, 
    Status_Completa
) VALUES (
    {id_personagem}, 
    '{nome}', 
    {pokebolas_normais}, 
    {pokebolas_greats}, 
    {pokebolas_ultras}, 
    {id_pokedex}, 
    {numero_pokemons}, 
    {numero_pokemons_vistos}, 
    {numero_pokemons_capturados}, 
    {status_completa}
);
"""
    db_engine.execute(text(insert_personagem).execution_options(autocommit=True))

def main_menu():
    clear_terminal()

    slow_print("Bem-vindo ao mundo Pokémon!")
    print("\n")
    slow_print("Eu sou o Professor Samuel Oak da Cidade de Pallet.")
    print("\n")
    slow_print("Antes de começarmos, preciso saber mais sobre você.")
    print("\n")
    
    # Solicitando o nome do treinador
    nome_treinador = input("Qual é o seu nome, Treinador? ")

    clear_terminal()
    
    slow_print(f"\nPrazer em conhecê-lo, {nome_treinador}!")
    print("\n")
    
    slow_print("Aqui estão 5 Pokébolas para você começar a sua jornada.")

    insert_five_great_pokeballs()
    insert_personagem(nome_treinador, 5)

    print("\n")
    
    # Menu para escolher o Pokémon inicial
    slow_print("\nAgora, você deve escolher o seu Pokémon inicial:")
    print("\n")
    print("1. Pikachu")
    print("2. Bulbasauro")
    print("3. Squirtle")
    print("4. Charmander")
    print("\n")
    escolha = slow_input("Digite o número do Pokémon que você deseja escolher: ")
    
    if escolha == "1":
        pokemon_inicial = "Pikachu"
    elif escolha == "2":
        pokemon_inicial = "Bulbasauro"
    elif escolha == "3":
        pokemon_inicial = "Squirtle"
    elif escolha == "4":
        pokemon_inicial = "Charmander"
    else:
        print("\n")
        print("Querendo me enganar? Só por isso vou lhe dar o Pokémon mais teimoso!")
        pokemon_inicial = "Pikachu"
    
    print("\n")
    slow_print(f"\nParabéns, {nome_treinador}! Você escolheu {pokemon_inicial} como seu Pokémon inicial.")
    print("\n")
    slow_print("Agora sua jornada Pokémon começa. Vá e capture todos!")
    print("\n")

    wait_for_keypress()

    exibir_menu_rotas()
    
    clear_terminal()

# Executando o menu principal
if __name__ == "__main__":
    while True:
        try:
            db_engine = get_db_engine().connect()
            if(db_engine):
                break
        except Exception as e:
            print(e)

    faker = Faker('en_US')
    inicializar_caminhos()
    main_menu()
    db_engine.close()