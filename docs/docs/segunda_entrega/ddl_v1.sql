-- Tabela Pokedex
CREATE TABLE tb_pokedex (
    id_pokedex SERIAL PRIMARY KEY,
    numero_pokemons INT,
    numero_pokemons_vistos INT,
    numero_pokemons_capturados INT,
    status_completa VARCHAR(3) CHECK (status_completa IN ('Sim', 'Não'))
);

-- Tabela Personagem
CREATE TABLE tb_personagem (
    id_personagem SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    pokebolas_normais INT,
    pokebolas_greats INT,
    pokebolas_ultras INT,
    id_pokemon_escolhido INT REFERENCES tb_pokemon(id_pokemon) 
);

-- Tabela Rota
CREATE TABLE tb_rota (
    id_rota SERIAL PRIMARY KEY
);

-- Tabela Pokebola
CREATE TABLE tb_pokebola (
    id_pokebola SERIAL PRIMARY KEY,
    tipo VARCHAR(50),
    chance_captura_porcentagem DECIMAL(5,2) 
);

-- Tabela Pokeball_Normal
CREATE TABLE tb_pokeball_normal (
    id_pokebola SERIAL PRIMARY KEY REFERENCES tb_pokebola(id_pokebola),
    chance_captura DECIMAL(5,2)
);

-- Tabela Pokeball_Great
CREATE TABLE tb_pokeball_great (
    id_pokebola SERIAL PRIMARY KEY REFERENCES tb_pokebola(id_pokebola),
    chance_captura DECIMAL(5,2)
);

-- Tabela Pokeball_Ultra
CREATE TABLE tb_pokeball_ultra (
    id_pokebola SERIAL PRIMARY KEY REFERENCES tb_pokebola(id_pokebola),
    chance_captura DECIMAL(5,2)
);

-- Tabela Batalha
CREATE TABLE tb_batalha (
    id_batalha SERIAL PRIMARY KEY,
    exp INT,
    resultado VARCHAR(10) CHECK (resultado IN ('Vitória', 'Derrota'))
);

-- Tabela Lider
CREATE TABLE tb_lider (
    id_lider SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    biografia TEXT,
    vendido_por_personagem INT REFERENCES tb_personagem(id_personagem),
    id_pokemon_escolhido INT REFERENCES tb_pokemon(id_pokemon) 
);

-- Tabela Lider_Pokemon 
CREATE TABLE tb_lider_pokemon (
    id_lider INT REFERENCES tb_lider(id_lider),
    id_pokemon INT REFERENCES tb_pokemon(id_pokemon),
    PRIMARY KEY (id_lider, id_pokemon)
);

-- Tabela Ginasio
CREATE TABLE tb_ginasio (
    id_ginasio SERIAL PRIMARY KEY
);

-- Tabela Insignia
CREATE TABLE tb_insignia (
    id_insignia SERIAL PRIMARY KEY
);

-- Tabela Liga Pokemon
CREATE TABLE tb_liga_pokemon (
    id_liga SERIAL PRIMARY KEY,
    descricao TEXT,
    numero_insignias_necessarias INT
);

-- Tabela Cidade
CREATE TABLE tb_cidade (
    id_cidade SERIAL PRIMARY KEY,
    possui_pokecenter VARCHAR(3) CHECK (possui_pokecenter IN ('Sim', 'Não')),
    possui_pokemarket VARCHAR(3) CHECK (possui_pokemarket IN ('Sim', 'Não')),
    possui_ginasio VARCHAR(3) CHECK (possui_ginasio IN ('Sim', 'Não'))
);

-- Tabela Encontro
CREATE TABLE tb_encontro (
    id_encontro SERIAL PRIMARY KEY,
    capturado VARCHAR(3) CHECK (capturado IN ('Sim', 'Não')),
    derrotado VARCHAR(3) CHECK (derrotado IN ('Sim', 'Não')),
    correu VARCHAR(3) CHECK (correu IN ('Sim', 'Não')),
    perdeu VARCHAR(3) CHECK (perdeu IN ('Sim', 'Não')),
    experiencia INT
);

-- Tabela Captura
CREATE TABLE tb_captura (
    id_captura SERIAL PRIMARY KEY,
    experiencia INT
);

-- Tabela Pokemon
CREATE TABLE tb_pokemon (
    id_pokemon SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    defesa_especial INT,
    velocidade INT,
    hp INT,
    nivel INT,
    experiencia INT,
    ataque_especial INT,
    defesa INT
);

-- Tabela de Instâncias de Pokémon
CREATE TABLE tb_pokemon_instancia (
    id_pokemon_instancia SERIAL PRIMARY KEY,  
    id_pokemon INT REFERENCES tb_pokemon(id_pokemon),  
    nome VARCHAR(255) NOT NULL,  
    nivel INT NOT NULL,  
    experiencia INT NOT NULL,  
    hp_atual INT NOT NULL,  
    ataque_especial INT NOT NULL,
    defesa_especial INT NOT NULL,
    velocidade INT NOT NULL,  
    defesa INT NOT NULL  
);


-- Tabela Tipo
CREATE TABLE tb_tipo (
    id_tipo SERIAL PRIMARY KEY
);

-- Tabela Ataque
CREATE TABLE tb_ataque (
    id_ataque SERIAL PRIMARY KEY,
    dano INT
);

-- Tabela Efetividade
CREATE TABLE tb_efetividade (
    id_efetividade SERIAL PRIMARY KEY,
    veneno DECIMAL,
    terra DECIMAL,
    normal DECIMAL,
    voador DECIMAL,
    fogo DECIMAL,
    psiquico DECIMAL,
    agua DECIMAL,
    inseto DECIMAL,
    eletrico DECIMAL,
    pedra DECIMAL,
    grama DECIMAL,
    fantasma DECIMAL,
    gelo DECIMAL,
    dragao DECIMAL,
    lutador DECIMAL,
    fada DECIMAL,
    aco DECIMAL
);
