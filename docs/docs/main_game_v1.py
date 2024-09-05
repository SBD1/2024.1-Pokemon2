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
    return create_engine('postgresql://postgres:postgres@localhost:5432/db')

def encontrar_pokemon(rota):
    rotas_pokemon = {
        "Rota 1": [
            {"nome": "Pikachu", "nivel": random.randint(3, 5), "tipo": "Elétrico"},
            {"nome": "Rattata", "nivel": random.randint(2, 4), "tipo": "Normal"},
            {"nome": "Pidgey", "nivel": random.randint(2, 4), "tipo": "Voador"}
        ],
        "Rota 2": [
            {"nome": "Bulbasauro", "nivel": random.randint(4, 6), "tipo": "Grama"},
            {"nome": "Caterpie", "nivel": random.randint(2, 4), "tipo": "Inseto"},
            {"nome": "Pidgey", "nivel": random.randint(3, 5), "tipo": "Voador"}
        ],
        "Rota 3": [
            {"nome": "Squirtle", "nivel": random.randint(5, 7), "tipo": "Água"},
            {"nome": "Pidgeotto", "nivel": random.randint(4, 6), "tipo": "Voador"},
            {"nome": "Rattata", "nivel": random.randint(3, 5), "tipo": "Normal"}
        ],
        "Rota 4": [
            {"nome": "Charmander", "nivel": random.randint(6, 8), "tipo": "Fogo"},
            {"nome": "Growlithe", "nivel": random.randint(5, 7), "tipo": "Fogo"},
            {"nome": "Pidgeotto", "nivel": random.randint(4, 6), "tipo": "Voador"}
        ]
    }
    pokemon_disponiveis = rotas_pokemon.get(rota, [])
    if pokemon_disponiveis:
        return random.choice(pokemon_disponiveis)
    return None

# Função para inserir personagem e pokeballs na base de dados
def insert_personagem(nome_treinador, pokeballs):
    db_engine = get_db_engine().connect()
    transacao = db_engine.begin()
    try:
        insert = text("""
            INSERT INTO Personagem (nome, pokeballs) 
            VALUES (:nome_treinador, :pokeballs)
            RETURNING id
        """)
        result = db_engine.execute(insert, {"nome_treinador": nome_treinador, "pokeballs": pokeballs})
        id_personagem = result.scalar()
        if id_personagem:
            print(f"Personagem {nome_treinador} inserido com sucesso com ID {id_personagem}.")
            transacao.commit()
        else:
            print(f"Erro ao inserir personagem: {nome_treinador}. ID não retornado.")
            transacao.rollback()
        return id_personagem
    except Exception as e:
        print(f"Erro ao inserir personagem: {e}")
        transacao.rollback()
        return None
    finally:
        db_engine.close()

# Função para criar uma instância de Pokémon no banco de dados
def criar_instancia_pokemon(pokemon, id_personagem):
    db_engine = get_db_engine().connect()
    try:
        insert_pokemon = text("""
            INSERT INTO Instancia_Pokemon (nome, nivel, hp, tipo, id_personagem)
            VALUES (:nome, :nivel, :hp, :tipo, :id_personagem)
            RETURNING id_pokemon
        """)
        result = db_engine.execute(insert_pokemon.params(
            nome=pokemon.nome, 
            nivel=pokemon.nivel, 
            hp=pokemon.hp, 
            tipo=pokemon.tipo, 
            id_personagem=id_personagem
        ))
        id_pokemon = result.scalar()
        db_engine.close()
        return id_pokemon
    except Exception as e:
        print(f"Erro ao criar instância de Pokémon: {e}")
        db_engine.close()
        return None

# Função para adicionar um item ao inventário
def adicionar_ao_inventario(id_personagem, item_tipo, item_nome, quantidade=1):
    db_engine = get_db_engine().connect()
    transacao = db_engine.begin()
    try:
        if not id_personagem or not item_tipo or not item_nome:
            raise ValueError("Os parâmetros id_personagem, item_tipo e item_nome são obrigatórios.")
        
        print(f"Tentando adicionar ao inventário: id_personagem={id_personagem}, item_tipo={item_tipo}, item_nome={item_nome}, quantidade={quantidade}")

        query = text(f"""
            INSERT INTO Inventario (id_personagem, item_tipo, item_nome, quantidade)
            VALUES (:id_personagem, :item_tipo, :item_nome, :quantidade)
            ON CONFLICT (id_personagem, item_tipo, item_nome)
            DO UPDATE SET quantidade = Inventario.quantidade + :quantidade
        """)
        db_engine.execute(query.params(id_personagem=id_personagem, item_tipo=item_tipo, item_nome=item_nome, quantidade=quantidade))

        transacao.commit()  # Commit após a inserção

        check_query = text(f"""
            SELECT * FROM Inventario 
            WHERE id_personagem = :id_personagem AND item_tipo = :item_tipo AND item_nome = :item_nome
        """)
        result = db_engine.execute(check_query.params(id_personagem=id_personagem, item_tipo=item_tipo, item_nome=item_nome)).fetchall()
        
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


def visualizar_inventario(id_personagem):
    db_engine = get_db_engine().connect()
    try:
        print(f"Consultando inventário para id_personagem={id_personagem}")
        query = text("""
            SELECT item_tipo, item_nome, quantidade 
            FROM Inventario 
            WHERE id_personagem = :id_personagem
        """)
        result = db_engine.execute(query.params(id_personagem=id_personagem))
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




# Função para capturar o Pokémon e adicioná-lo ao inventário
def capturar_pokemon(pokemon_adversario, id_personagem):
    chance_captura = random.randint(1, 100)
    if chance_captura <= 50:  # Por exemplo, 50% de chance de captura
        slow_print(f"Parabéns! Você capturou o {pokemon_adversario.nome}!")
        print(f"Tentando adicionar {pokemon_adversario.nome} ao inventário.")
        if id_personagem and pokemon_adversario.nome:
            id_pokemon = criar_instancia_pokemon(pokemon_adversario, id_personagem)
            if id_pokemon:
                adicionar_ao_inventario(id_personagem, "Pokemon", pokemon_adversario.nome)
            else:
                print("Erro ao criar instância do Pokémon capturado.")
        else:
            print(f"Erro: id_personagem ou nome do Pokémon não foi definido corretamente.")
        return True
    else:
        slow_print(f"Você não conseguiu capturar o {pokemon_adversario.nome}. Ele escapou!")
        return False

# Função para escolher o Pokémon inicial
def escolher_pokemon_inicial():
    pikachu = Pokemon("Pikachu", 5, 35, "Elétrico", [
        Ataque("Choque do Trovão", 40, "Elétrico"), Ataque("Investida", 35, "Normal")
    ])
    bulbasauro = Pokemon("Bulbasauro", 5, 45, "Grama", [
        Ataque("Chicote de Vinha", 45, "Grama"), Ataque("Investida", 35, "Normal")
    ])
    squirtle = Pokemon("Squirtle", 5, 44, "Água", [
        Ataque("Jato de Água", 40, "Água"), Ataque("Investida", 35, "Normal")
    ])
    charmander = Pokemon("Charmander", 5, 39, "Fogo", [
        Ataque("Brasas", 40, "Fogo"), Ataque("Investida", 35, "Normal")
    ])

    pokemons_iniciais = [pikachu, bulbasauro, squirtle, charmander]

    print("\nEscolha o seu Pokémon inicial:")
    for i, pokemon in enumerate(pokemons_iniciais, 1):
        print(f"{i}. {pokemon.nome} (Nível {pokemon.nivel}, HP: {pokemon.hp})")
    escolha = int(input("Digite o número do Pokémon: "))

    return pokemons_iniciais[escolha - 1]

# Função para obter o ID do personagem
def obter_id_personagem(nome_treinador):
    print(f"Buscando ID para o treinador: {nome_treinador}")
    db_engine = get_db_engine().connect()
    query = text(f"SELECT id FROM Personagem WHERE nome = :nome_treinador")
    result = db_engine.execute(query.params(nome_treinador=nome_treinador))
    id_personagem = result.scalar()
    db_engine.close()
    
    if id_personagem:
        print(f"ID encontrado: {id_personagem}")
    else:
        print("Nenhum ID foi encontrado para o treinador.")
    
    return id_personagem

# Função para iniciar o jogo
def iniciar_jogo():
    clear_terminal()
    slow_print("Bem-vindo ao Mundo Pokémon!\n")
    nome_treinador = slow_input("Qual é o seu nome, treinador?\n")
    pokemon_jogador = escolher_pokemon_inicial()

    slow_print(f"\nMuito bem, {nome_treinador}! Agora você é o orgulhoso treinador de um {pokemon_jogador.nome}.\n")
    
    id_personagem = insert_personagem(nome_treinador, random.randint(1, 5))
    
    if not id_personagem:
        print(f"Erro ao inserir personagem: {nome_treinador}. ID não encontrado.")
    else:
        print(f"ID do personagem inserido: {id_personagem}")
        adicionar_ao_inventario(id_personagem, "Pokemon", pokemon_jogador.nome)
    
    localizacao_atual = "Rota 1"
    
    while True:
        exibir_mapa(localizacao_atual)
        
        if random.random() < 0.8:  # 80% de chance de encontrar um Pokémon
            encontro = encontrar_pokemon(localizacao_atual)
            if encontro:
                pokemon_adversario = Pokemon(encontro["nome"], encontro["nivel"], random.randint(20, 40), 
                                             encontro["tipo"], [Ataque("Investida", 35, "Normal")])
                slow_print(f"\nUm {pokemon_adversario.nome} selvagem apareceu!")
                if batalha_pokemon(pokemon_jogador, pokemon_adversario, id_personagem):
                    slow_print("Você ganhou a batalha!")
                else:
                    slow_print("Você perdeu a batalha...")
                    break

        escolha = slow_input("\nDeseja visualizar seu inventário? (Sim/Não)\n").lower()
        if escolha == 'sim':
            visualizar_inventario(id_personagem)

        direcao = slow_input("\nPara qual direção você deseja seguir? (Norte, Sul, Leste, Oeste)\n")
        localizacao_atual = mover_para_rota(localizacao_atual, direcao.capitalize())
        wait_for_keypress()

# Classe para representar um Ataque
class Ataque:
    def __init__(self, nome, poder, tipo):
        self.nome = nome
        self.poder = poder
        self.tipo = tipo

# Classe para representar um Pokémon
class Pokemon:
    def __init__(self, nome, nivel, hp, tipo, ataques):
        self.nome = nome
        self.nivel = nivel
        self.hp = hp
        self.tipo = tipo
        self.ataques = ataques

    def escolher_ataque(self):
        print(f"\nEscolha o ataque para {self.nome}:")
        for i, ataque in enumerate(self.ataques, 1):
            print(f"{i}. {ataque.nome} (Poder: {ataque.poder}, Tipo: {ataque.tipo})")
        escolha = int(input("Digite o número do ataque: "))
        return self.ataques[escolha - 1]

    def receber_dano(self, dano):
        self.hp -= dano
        if self.hp < 0:
            self.hp = 0

    def esta_vivo(self):
        return self.hp > 0

# Função para calcular o multiplicador de dano baseado em tipos
def calcular_multiplicador(tipo_ataque, tipo_defensor):
    vantagens = {
        "Fogo": ["Grama"],
        "Água": ["Fogo"],
        "Grama": ["Água"],
        "Elétrico": ["Água"],
        "Voador": ["Grama"],
        "Normal": []
    }
    if tipo_defensor in vantagens.get(tipo_ataque, []):
        return 2.0
    elif tipo_ataque in vantagens.get(tipo_defensor, []):
        return 0.5
    return 1.0

# Função para calcular o dano de um ataque
def calcular_dano(ataque, atacante, defensor):
    multiplicador = calcular_multiplicador(ataque.tipo, defensor.tipo)
    dano_base = (2 * atacante.nivel / 5 + 2) * ataque.poder * (atacante.nivel / defensor.nivel) / 50 + 2
    dano_final = dano_base * multiplicador
    return round(dano_final)

# Função para a batalha Pokémon
def batalha_pokemon(pokemon_jogador, pokemon_adversario, id_personagem):
    slow_print(f"\nBatalha entre {pokemon_jogador.nome} (Nível {pokemon_jogador.nivel}, HP: {pokemon_jogador.hp}) "
               f"e {pokemon_adversario.nome} (Nível {pokemon_adversario.nivel}, HP: {pokemon_adversario.hp})\n")

    while pokemon_jogador.esta_vivo() and pokemon_adversario.esta_vivo():
        ataque_jogador = pokemon_jogador.escolher_ataque()
        dano_ao_adversario = calcular_dano(ataque_jogador, pokemon_jogador, pokemon_adversario)
        pokemon_adversario.receber_dano(dano_ao_adversario)
        slow_print(f"{pokemon_jogador.nome} usou {ataque_jogador.nome} e causou {dano_ao_adversario} de dano!")

        if pokemon_adversario.esta_vivo():
            if pokemon_adversario.hp < 20:
                escolha = slow_input("O HP do Pokémon adversário está baixo! Deseja tentar capturá-lo? (Sim/Não)\n").lower()
                if escolha == 'sim':
                    if capturar_pokemon(pokemon_adversario, id_personagem):
                        return True
                slow_print(f"{pokemon_adversario.nome} escapou da captura e continua a batalha!")
            
            ataque_adversario = random.choice(pokemon_adversario.ataques)
            dano_ao_jogador = calcular_dano(ataque_adversario, pokemon_adversario, pokemon_jogador)
            pokemon_jogador.receber_dano(dano_ao_jogador)
            slow_print(f"{pokemon_adversario.nome} usou {ataque_adversario.nome} e causou {dano_ao_jogador} de dano!")

        slow_print(f"\n{pokemon_jogador.nome} HP: {pokemon_jogador.hp}")
        slow_print(f"{pokemon_adversario.nome} HP: {pokemon_adversario.hp}\n")
        wait_for_keypress()

    return pokemon_jogador.esta_vivo()

def mover_para_rota(localizacao_atual, direcao):
    nova_rota = mapa[localizacao_atual].get(direcao)
    if nova_rota:
        return nova_rota
    else:
        slow_print("Não há caminho nesta direção.")
        return localizacao_atual

# Estrutura do mapa com descrições e locais importantes
mapa = {
    "Rota 1": {
        "descricao": "Uma rota tranquila com árvores altas e grama verde. Você pode ver algumas flores ao longo do caminho.",
        "Norte": "Rota 2",
        "Sul": None,
        "Leste": "Rota 3",
        "Oeste": None,
        "centro": False,
        "ginásio": False
    },
    "Rota 2": {
        "descricao": "Uma rota exuberante com muitas plantas e pequenos rios correndo ao lado do caminho. A paisagem é muito vibrante.",
        "Norte": None,
        "Sul": "Rota 1",
        "Leste": "Rota 4",
        "Oeste": None,
        "centro": True,
        "ginásio": False
    },
    "Rota 3": {
        "descricao": "Uma rota mais árida, com menos vegetação. O solo é mais seco e há algumas pedras espalhadas pelo caminho.",
        "Norte": "Rota 4",
        "Sul": None,
        "Leste": None,
        "Oeste": "Rota 1",
        "centro": False,
        "ginásio": True
    },
    "Rota 4": {
        "descricao": "Uma rota montanhosa com colinas e algumas cavernas pequenas. É uma área que parece prometer muitas aventuras.",
        "Norte": None,
        "Sul": "Rota 3",
        "Leste": None,
        "Oeste": "Rota 2",
        "centro": False,
        "ginásio": False
    }
}

def exibir_mapa(localizacao_atual):
    clear_terminal()
    rota = mapa[localizacao_atual]
    slow_print(f"Você está em {localizacao_atual}.")
    slow_print(f"\nDescrição da Rota: {rota['descricao']}")
    slow_print("\nRotas disponíveis:")
    for direcao, rota_destino in rota.items():
        if direcao in ["Norte", "Sul", "Leste", "Oeste"] and rota_destino:
            slow_print(f"- {direcao}: {rota_destino}")
    if rota["centro"]:
        slow_print("\nVocê encontrou um Centro Pokémon!")
    if rota["ginásio"]:
        slow_print("\nVocê encontrou um Ginásio!")

if __name__ == "__main__":
    iniciar_jogo()
