CREATE TABLE Rota (
    ID_Rota INT PRIMARY KEY,
    fk_Rota_ID_Rota INT
);

CREATE TABLE Pokeball (
    ID_Pokebola INT PRIMARY KEY,
    Chance_captura INT
);

CREATE TABLE Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe (
    ID_Lider INT,
    Nome VARCHAR,
    Biografia VARCHAR,
    ID_Ginasio INT,
    fk_Personagem_Pokedex_Equipe_ID_Personagem INT,
    ID_Insignia INT,
    Tipo VARCHAR,
    ID_Personagem VARCHAR,
    Pokebolas_Normais INT,
    Pokebolas_Greats INT,
    Pokebolas_Ultras INT,
    ID_Pokedex INT,
    Numero_Pokemons INT,
    Numero_Pokemons_Vistos INT,
    Numero_Pokemons_Capturados INT,
    Status_Completa INT,
    fk_Inst_pokemon_Id_Pokemon_Inst INT,
    PRIMARY KEY (ID_Lider, ID_Ginasio, ID_Insignia, ID_Personagem, ID_Pokedex)
);

CREATE TABLE Cidade (
    Possui_Pokecenter INT,
    Possui_Pokemarket INT,
    Possui_Ginasio INT,
    fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Lider INT,
    fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Ginasio INT,
    fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Insignia INT,
    fk_Rota_ID_Rota INT
);

CREATE TABLE Batalha_Batalha (
    ID_Batalha INT PRIMARY KEY,
    Exp INT,
    Resultado INT,
    fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Lider INT,
    fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Ginasio INT,
    fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Insignia INT,
    fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Personagem INT,
    fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Pokedex INT
);

CREATE TABLE Captura_Captura (
    ID_Captura INT PRIMARY KEY,
    Experiencia INT,
    fk_Pokeball_ID_Pokebola INT,
    fk_PokemonDeAgua_id INT,
    fk_PokemonDeAgua_ID_Pokemon INT,
    fk_PokemonEletrico_ID_Pokemon INT,
    fk_PokemonDeFogo_id INT,
    fk_PokemonDeFogo_ID_Pokemon INT,
    fk_PokemonDeGelo_id INT,
    fk_PokemonDeGelo_ID_Pokemon INT,
    fk_PokemonVenenoso_id INT,
    fk_PokemonVenenoso_ID_Pokemon INT,
    fk_PokemonTerrestre_id INT,
    fk_PokemonTerrestre_ID_Pokemon INT,
    fk_PokemonVoador_id INT,
    fk_PokemonVoador_ID_Pokemon INT,
    fk_PokemonPsíquico_id INT,
    fk_PokemonPsíquico_ID_Pokemon INT,
    fk_PokemonInseto_id INT,
    fk_PokemonInseto_ID_Pokemon INT,
    fk_PokemonDePedra_id INT,
    fk_PokemonDePedra_ID_Pokemon INT,
    fk_PokemonDragao_ID_Pokemon INT,
    fk_PokemonSombrio_ID_Pokemon INT,
    fk_PokemonFada_id INT,
    fk_PokemonFada_ID_Pokemon INT,
    fk_PokemonDePlanta_id INT,
    fk_PokemonDePlanta_ID_Pokemon INT,
    fk_PokemonLutador_ID_Pokemon INT,
    fk_PokemonMetalico_id INT,
    fk_PokemonMetalico_ID_Pokemon INT
);

CREATE TABLE Encontro_Encontra (
    ID_Encontro INT PRIMARY KEY,
    Capturado INT,
    Derrotado INT,
    Correu INT,
    Perdeu INT,
    Experiencia INT,
    fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Lider INT,
    fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Ginasio INT,
    fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Insignia INT,
    fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Personagem VARCHAR,
    fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Pokedex INT,
    fk_PokemonDeAgua_id INT,
    fk_PokemonDeAgua_ID_Pokemon INT,
    fk_PokemonEletrico_ID_Pokemon INT,
    fk_PokemonDeFogo_id INT,
    fk_PokemonDeFogo_ID_Pokemon INT,
    fk_PokemonDeGelo_id INT,
    fk_PokemonDeGelo_ID_Pokemon INT,
    fk_PokemonVenenoso_id INT,
    fk_PokemonVenenoso_ID_Pokemon INT,
    fk_PokemonTerrestre_id INT,
    fk_PokemonTerrestre_ID_Pokemon INT,
    fk_PokemonVoador_id INT,
    fk_PokemonVoador_ID_Pokemon INT,
    fk_PokemonPsíquico_id INT,
    fk_PokemonPsíquico_ID_Pokemon INT,
    fk_PokemonInseto_id INT,
    fk_PokemonInseto_ID_Pokemon INT,
    fk_PokemonDePedra_id INT,
    fk_PokemonDePedra_ID_Pokemon INT,
    fk_PokemonDragao_ID_Pokemon INT,
    fk_PokemonSombrio_ID_Pokemon INT,
    fk_PokemonFada_id INT,
    fk_PokemonFada_ID_Pokemon INT,
    fk_PokemonDePlanta_id INT,
    fk_PokemonDePlanta_ID_Pokemon INT,
    fk_PokemonLutador_ID_Pokemon INT,
    fk_PokemonMetalico_id INT,
    fk_PokemonMetalico_ID_Pokemon INT
);

CREATE TABLE PokemonDeAgua (
    hydro_pump INT,
    id INT,
    ID_Pokemon INT,
    Nome VARCHAR,
    Nivel INT,
    Experiencia INT,
    Defesa_Especial INT,
    Velocidade INT,
    Tipo VARCHAR,
    fk_InstPokemon_Id_Pokemon_Inst INT,
    PRIMARY KEY (id, ID_Pokemon)
);

CREATE TABLE PokemonEletrico  (
    fire_blast INT,
    ID_Pokemon INT PRIMARY KEY,
    Nome VARCHAR,
    Nivel INT,
    Experiencia INT,
    Defesa_Especial INT,
    Velocidade INT,
    Tipo VARCHAR,
    fk_InstPokemon_Id_Pokemon_Inst INT
);

CREATE TABLE PokemonDeFogo (
    id INT,
    ID_Pokemon INT,
    Nome VARCHAR,
    Nivel INT,
    Experiencia INT,
    Defesa_Especial INT,
    Velocidade INT,
    Tipo VARCHAR,
    fk_InstPokemon_Id_Pokemon_Inst INT,
    PRIMARY KEY (id, ID_Pokemon)
);

CREATE TABLE PokemonDePlanta (
    id INT,
    ID_Pokemon INT,
    Nome VARCHAR,
    Nivel INT,
    Experiencia INT,
    Defesa_Especial INT,
    Velocidade INT,
    Tipo VARCHAR,
    fk_InstPokemon_Id_Pokemon_Inst INT,
    PRIMARY KEY (id, ID_Pokemon)
);

CREATE TABLE PokemonDeGelo (
    id INT,
    ID_Pokemon INT,
    Nome VARCHAR,
    Nivel INT,
    Experiencia INT,
    Defesa_Especial INT,
    Velocidade INT,
    Tipo VARCHAR,
    fk_InstPokemon_Id_Pokemon_Inst INT,
    PRIMARY KEY (id, ID_Pokemon)
);

CREATE TABLE PokemonLutador (
    focus_blast INT,
    ID_Pokemon INT PRIMARY KEY,
    Nome VARCHAR,
    Nivel INT,
    Experiencia INT,
    Defesa_Especial INT,
    Velocidade INT,
    Tipo VARCHAR,
    fk_InstPokemon_Id_Pokemon_Inst INT
);

CREATE TABLE PokemonVenenoso (
    id INT,
    ID_Pokemon INT,
    Nome VARCHAR,
    Nivel INT,
    Experiencia INT,
    Defesa_Especial INT,
    Velocidade INT,
    Tipo VARCHAR,
    fk_InstPokemon_Id_Pokemon_Inst INT,
    PRIMARY KEY (id, ID_Pokemon)
);

CREATE TABLE PokemonTerrestre (
    id INT,
    ID_Pokemon INT,
    Nome VARCHAR,
    Nivel INT,
    Experiencia INT,
    Defesa_Especial INT,
    Velocidade INT,
    Tipo VARCHAR,
    fk_InstPokemon_Id_Pokemon_Inst INT,
    PRIMARY KEY (id, ID_Pokemon)
);

CREATE TABLE PokemonVoador (
    id INT,
    ID_Pokemon INT,
    Nome INT,
    Nivel INT,
    Experiencia INT,
    Defesa_Especial INT,
    Velocidade INT,
    Tipo INT,
    fk_InstPokemon_Id_Pokemon_Inst INT,
    PRIMARY KEY (id, ID_Pokemon)
);

CREATE TABLE PokemonPsíquico (
    id INT,
    ID_Pokemon INT,
    Nome VARCHAR,
    Nivel INT,
    Experiencia INT,
    Defesa_Especial INT,
    Velocidade INT,
    Tipo VARCHAR,
    fk_InstPokemon_Id_Pokemon_Inst INT,
    PRIMARY KEY (id, ID_Pokemon)
);

CREATE TABLE PokemonInseto (
    id INT,
    ID_Pokemon INT,
    Nome VARCHAR,
    Nivel INT,
    Experiencia INT,
    Defesa_Especial INT,
    Velocidade INT,
    Tipo VARCHAR,
    fk_InstPokemon_Id_Pokemon_Inst INT,
    PRIMARY KEY (id, ID_Pokemon)
);

CREATE TABLE PokemonDePedra (
    id INT,
    ID_Pokemon INT,
    Nome VARCHAR,
    Nivel INT,
    Experiencia INT,
    Defesa_Especial INT,
    Velocidade INT,
    Tipo VARCHAR,
    fk_InstPokemon_Id_Pokemon_Inst INT,
    PRIMARY KEY (id, ID_Pokemon)
);

CREATE TABLE PokemonFantasma (
);

CREATE TABLE PokemonDragao (
    ID_Pokemon INT PRIMARY KEY,
    Nome VARCHAR,
    Nivel INT,
    Experiencia INT,
    Defesa_Especial INT,
    Velocidade INT,
    Tipo VARCHAR,
    fk_InstPokemon_Id_Pokemon_Inst INT
);

CREATE TABLE PokemonSombrio (
    ID_Pokemon INT PRIMARY KEY,
    Nome VARCHAR,
    Nivel INT,
    Experiencia INT,
    Defesa_Especial INT,
    Velocidade INT,
    Tipo VARCHAR,
    fk_InstPokemon_Id_Pokemon_Inst INT
);

CREATE TABLE PokemonMetalico (
    id INT,
    ID_Pokemon INT,
    Nome VARCHAR,
    Nivel INT,
    Experiencia INT,
    Defesa_Especial INT,
    Velocidade INT,
    Tipo VARCHAR,
    fk_InstPokemon_Id_Pokemon_Inst INT,
    PRIMARY KEY (id, ID_Pokemon)
);

CREATE TABLE PokemonFada (
    id INT,
    ID_Pokemon INT,
    Nome VARCHAR,
    Nivel INT,
    Experiencia INT,
    Defesa_Especial INT,
    Velocidade INT,
    Tipo VARCHAR,
    fk_InstPokemon_Id_Pokemon_Inst INT,
    PRIMARY KEY (id, ID_Pokemon)
);

CREATE TABLE Inst_pokemon (
    Id_Pokemon_Inst INT PRIMARY KEY,
    Probabilidade_Surgimento INT
);

CREATE TABLE Elite (
    Multiplicador_Dificuldade INT,
    ID_Liga INT PRIMARY KEY,
    Descricao VARCHAR,
    Numero_Insignias_Necessarias INT,
    fk_Ginásio_ID_Ginasio INT
);

CREATE TABLE Passa_por (
    fk_Personagem_Pokedex_Equipe_ID_Personagem INT,
    fk_Personagem_Pokedex_Equipe_ID_Pokedex INT,
    fk_Rota_ID_Rota INT
);

CREATE TABLE Lança (
    fk_Personagem_Pokedex_Equipe_ID_Personagem INT,
    fk_Personagem_Pokedex_Equipe_ID_Pokedex INT,
    fk_Pokeball_ID_Pokebola INT
);

CREATE TABLE Surge (
    fk_Rota_ID_Rota INT,
    fk_InstPokemon_Id_Pokemon_Inst INT
);
 
ALTER TABLE Rota ADD CONSTRAINT FK_Rota_2
    FOREIGN KEY (fk_Rota_ID_Rota)
    REFERENCES Rota (ID_Rota);

 

ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_2
    FOREIGN KEY (fk_Rota_ID_Rota)
    REFERENCES Rota (ID_Rota)
    ON DELETE SET NULL;
 
ALTER TABLE Lança ADD CONSTRAINT FK_Lança_2
    FOREIGN KEY (fk_Pokeball_ID_Pokebola)
    REFERENCES Pokeball (ID_Pokebola)
    ON DELETE SET NULL;
 
ALTER TABLE Surge ADD CONSTRAINT FK_Surge_1
    FOREIGN KEY (fk_Rota_ID_Rota)
    REFERENCES Rota (ID_Rota)
    ON DELETE SET NULL;
 
ALTER TABLE Surge ADD CONSTRAINT FK_Surge_2
    FOREIGN KEY (fk_InstPokemon_Id_Pokemon_Inst)
    REFERENCES Inst_pokemon (Id_Pokemon_Inst)
    ON DELETE SET NULL;

INSERT INTO Rota (ID_Rota, fk_Rota_ID_Rota) VALUES (1, NULL);
INSERT INTO Rota (ID_Rota, fk_Rota_ID_Rota) VALUES (2, 1);
INSERT INTO Rota (ID_Rota, fk_Rota_ID_Rota) VALUES (3, 2);

INSERT INTO Pokeball (ID_Pokebola, Chance_captura) VALUES (1, 30);
INSERT INTO Pokeball (ID_Pokebola, Chance_captura) VALUES (2, 50);
INSERT INTO Pokeball (ID_Pokebola, Chance_captura) VALUES (3, 70);

INSERT INTO Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe (ID_Lider, Nome, Biografia, ID_Ginasio, fk_Personagem_Pokedex_Equipe_ID_Personagem, ID_Insignia, Tipo, ID_Personagem, Pokebolas_Normais, Pokebolas_Greats, Pokebolas_Ultras, ID_Pokedex, Numero_Pokemons, Numero_Pokemons_Vistos, Numero_Pokemons_Capturados, Status_Completa, fk_Inst_pokemon_Id_Pokemon_Inst) 
VALUES (1, 'Brock', 'Líder do Ginásio de Pewter', 1, 1, 1, 'Pedra', 'Ash', 3, 2, 1, 1, 3, 20, 15, 1, 1);

INSERT INTO Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe (ID_Lider, Nome, Biografia, ID_Ginasio, fk_Personagem_Pokedex_Equipe_ID_Personagem, ID_Insignia, Tipo, ID_Personagem, Pokebolas_Normais, Pokebolas_Greats, Pokebolas_Ultras, ID_Pokedex, Numero_Pokemons, Numero_Pokemons_Vistos, Numero_Pokemons_Capturados, Status_Completa, fk_Inst_pokemon_Id_Pokemon_Inst) 
VALUES (2, 'Misty', 'Líder do Ginásio de Cerulean', 2, 2, 2, 'Água', 'Misty', 5, 1, 0, 2, 2, 25, 20, 1, 2);

INSERT INTO Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe (ID_Lider, Nome, Biografia, ID_Ginasio, fk_Personagem_Pokedex_Equipe_ID_Personagem, ID_Insignia, Tipo, ID_Personagem, Pokebolas_Normais, Pokebolas_Greats, Pokebolas_Ultras, ID_Pokedex, Numero_Pokemons, Numero_Pokemons_Vistos, Numero_Pokemons_Capturados, Status_Completa, fk_Inst_pokemon_Id_Pokemon_Inst) 
VALUES (3, 'Lt. Surge', 'Líder do Ginásio de Vermilion', 3, 3, 3, 'Elétrico', 'Surge', 2, 3, 2, 3, 4, 30, 25, 1, 3);

INSERT INTO Cidade (Possui_Pokecenter, Possui_Pokemarket, Possui_Ginasio, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Lider, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Ginasio, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Insignia, fk_Rota_ID_Rota) 
VALUES (1, 1, 1, 1, 1, 1, 1);

INSERT INTO Cidade (Possui_Pokecenter, Possui_Pokemarket, Possui_Ginasio, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Lider, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Ginasio, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Insignia, fk_Rota_ID_Rota) 
VALUES (1, 1, 0, NULL, NULL, NULL, 2);

INSERT INTO Cidade (Possui_Pokecenter, Possui_Pokemarket, Possui_Ginasio, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Lider, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Ginasio, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Insignia, fk_Rota_ID_Rota) 
VALUES (0, 1, 1, 3, 3, 3, 3);

INSERT INTO Batalha_Batalha (ID_Batalha, Exp, Resultado, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Lider, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Ginasio, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Insignia, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Personagem, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Pokedex) 
VALUES (1, 300, 1, 1, 1, 1, 1, 1);

INSERT INTO Batalha_Batalha (ID_Batalha, Exp, Resultado, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Lider, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Ginasio, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Insignia, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Personagem, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Pokedex) 
VALUES (2, 250, 0, 2, 2, 2, 2, 2);

INSERT INTO Batalha_Batalha (ID_Batalha, Exp, Resultado, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Lider, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Ginasio, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Insignia, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Personagem, fk_Lider_Ginásio_Insignia_Personagem_Pokedex_Equipe_ID_Pokedex) 
VALUES (3, 400, 1, 3, 3, 3, 3, 3);

INSERT INTO PokemonDeAgua (
    hydro_pump, id, ID_Pokemon, Nome, Nivel, Experiencia, Defesa_Especial, Velocidade, Tipo, fk_InstPokemon_Id_Pokemon_Inst
) VALUES
(100, 1, 1, 'Squirtle', 5, 20, 50, 43, 'Água', 1),
(100, 2, 2, 'Tentacool', 10, 50, 60, 50, 'Água', 2);

INSERT INTO PokemonEletrico (
    fire_blast, ID_Pokemon, Nome, Nivel, Experiencia, Defesa_Especial, Velocidade, Tipo, fk_InstPokemon_Id_Pokemon_Inst
) VALUES
(120, 1, 'Pikachu', 5, 25, 40, 60, 'Elétrico', 1),
(120, 2, 'Magnemite', 10, 50, 60, 40, 'Elétrico', 2);

INSERT INTO PokemonInseto (
    id, ID_Pokemon, Nome, Nivel, Experiencia, Defesa_Especial, Velocidade, Tipo, fk_InstPokemon_Id_Pokemon_Inst
) VALUES
(1, 1, 'Caterpie', 5, 25, 35, 45, 'Inseto', 1),
(1, 2, 'Weedle', 10, 30, 40, 50, 'Inseto', 2);

INSERT INTO Inst_pokemon (
    Id_Pokemon_Inst, Probabilidade_Surgimento
) VALUES
(1, 50),
(2, 30);

INSERT INTO Elite (
    Multiplicador_Dificuldade, ID_Liga, Descricao, Numero_Insignias_Necessarias, fk_Ginásio_ID_Ginasio
) VALUES
(2, 1, 'Elite 4', 8, 1),
(3, 2, 'Champion', 8, 2);

INSERT INTO Passa_por (
    fk_Personagem_Pokedex_Equipe_ID_Personagem, fk_Personagem_Pokedex_Equipe_ID_Pokedex, fk_Rota_ID_Rota
) VALUES
(1, 1, 1),
(2, 2, 2);

INSERT INTO Lança (
    fk_Personagem_Pokedex_Equipe_ID_Personagem, fk_Personagem_Pokedex_Equipe_ID_Pokedex, fk_Pokeball_ID_Pokebola
) VALUES
(1, 1, 1),
(2, 2, 2);

INSERT INTO Surge (
    fk_Rota_ID_Rota, fk_InstPokemon_Id_Pokemon_Inst
) VALUES
(1, 1),
(2, 2);

