CREATE TABLE Liga Pokemon (
    ID_Liga INT PRIMARY KEY,
    Descricao VARCHAR,
    Numero_Insignias_Necessarias INT,
    fk_Ginásio_ID_Ginasio INT
);

CREATE TABLE Rota (
    ID_Rota INT PRIMARY KEY,
    fk_Rota_ID_Rota INT
);

CREATE TABLE Personagem_Pokedex (
    ID_Personagem INT,
    Nome VARCHAR,
    Pokebolas_Normais INT,
    Pokebolas_Greats INT,
    Pokebolas_Ultras INT,
    ID_Pokedex INT,
    Numero_Pokemons INT,
    Numero_Pokemons_Vistos INT,
    Numero_Pokemons_Capturados INT,
    Status_Completa INT,
    PRIMARY KEY (ID_Personagem, ID_Pokedex)
);

CREATE TABLE Pokeball (
    ID_Pokebola INT PRIMARY KEY,
    Chance_Captura INT,
    Pokeball_TIPO INT
);

CREATE TABLE Lider_Ginásio (
    ID_Lider INT,
    Nome VARCHAR,
    Biografia VARCHAR,
    Vencido_Por_Personagem VARCHAR,
    ID_Ginasio INT,
    ID_Insignia INT,
    PRIMARY KEY (ID_Lider, ID_Ginasio, ID_Insignia)
);

CREATE TABLE Ataque (
    ID_Ataque INT PRIMARY KEY,
    Dano INT,
    fk_Pokemon_ID_Pokemon INT
);

CREATE TABLE Tipo_Efetividade (
    ID_Tipo INT,
    ID_Efetividade INT,
    Normal VARCHAR,
    Fogo INT,
    Agua INT,
    Eletrico INT,
    Grama INT,
    Gelo INT,
    Lutador INT,
    Veneno INT,
    Terra INT,
    Voador INT,
    Psiquico INT,
    Inseto INT,
    Pedra INT,
    Fantasma INT,
    Dragao INT,
    Aco INT,
    Fada INT,
    PRIMARY KEY (ID_Tipo, ID_Efetividade)
);

CREATE TABLE Cidade (
    Possui_Pokecenter INT,
    Possui_Pokemarket INT,
    Possui_Ginasio INT,
    fk_Lider_Ginásio_Insignia_ID_Lider INT,
    fk_Lider_Ginásio_Insignia_ID_Ginasio INT,
    fk_Lider_Ginásio_Insignia_ID_Insignia INT,
    fk_Rota_ID_Rota INT
);

CREATE TABLE Batalha (
    ID_Batalha INT PRIMARY KEY,
    Exp VARCHAR,
    Resultado VARCHAR,
    fk_Lider_Ginásio_Insignia_ID_Lider INT,
    fk_Lider_Ginásio_Insignia_ID_Ginasio INT,
    fk_Lider_Ginásio_Insignia_ID_Insignia INT,
    fk_Personagem_Pokedex_ID_Personagem INT,
    fk_Personagem_Pokedex_ID_Pokedex INT
);

CREATE TABLE Captura_Pokemon (
    ID_Captura INT,
    Experiencia VARCHAR,
    ID_Pokemon INT,
    Nome VARCHAR,
    Nivel VARCHAR,
    HP VARCHAR,
    Ataque VARCHAR,
    Ataque_Especial VARCHAR,
    Defesa VARCHAR,
    Defesa_Especial VARCHAR,
    Velocidade INT,
    fk_Pokeball_ID_Pokebola INT,
    PRIMARY KEY (ID_Captura, ID_Pokemon)
);

CREATE TABLE Encontro_Pokemon (
    ID_Encontro INT PRIMARY KEY,
    Capturado BOOLEAN,
    Derrotado BOOLEAN,
    Correu BOOLEAN,
    Perdeu BOOLEAN,
    Experiencia VARCHAR,
    fk_Personagem_Pokedex_ID_Personagem INT,
    fk_Personagem_Pokedex_ID_Pokedex INT,
    fk_Pokemon_ID_Pokemon INT
);

CREATE TABLE Tipo_Ataque (
    fk_Ataque_ID_Ataque INT,
    fk_Tipo_Efetividade_ID_Tipo INT,
    fk_Tipo_Efetividade_ID_Efetividade INT
);

CREATE TABLE Tipo_Pokemon (
    FK_Pokemon_ID_Pokemon INT,
    FK_Tipo_Efetividade_ID_Tipo INT,
    FK_Tipo_Efetividade_ID_Efetividade INT
);

CREATE TABLE Entrega Insignia (
    fk_Personagem_Pokedex_ID_Personagem INT,
    fk_Lider_Ginásio_Insignia_ID_Lider INT,
    fk_Lider_Ginásio_Insignia_ID_Ginasio INT
);

CREATE TABLE Tipo_Ginásio (
    fk_Lider_Ginásio_Insignia_ID_Lider INT,
    fk_Lider_Ginásio_Insignia_ID_Ginasio INT,
    fk_Lider_Ginásio_Insignia_ID_Insignia INT,
    fk_Tipo_Efetividade_ID_Tipo INT,
    fk_Tipo_Efetividade_ID_Efetividade INT
);

CREATE TABLE Passa por (
    fk_Personagem_Pokedex_ID_Personagem INT,
    fk_Personagem_Pokedex_ID_Pokedex INT,
    fk_Rota_ID_Rota INT
);

CREATE TABLE Lança (
    fk_Personagem_Pokedex_ID_Personagem INT,
    fk_Personagem_Pokedex_ID_Pokedex INT,
    fk_Pokeball_ID_Pokebola INT
);

CREATE TABLE Surge (
    fk_Rota_ID_Rota INT,
    fk_Pokemon_ID_Pokemon INT
);
 
ALTER TABLE Liga Pokemon ADD CONSTRAINT FK_Liga Pokemon_2
    FOREIGN KEY (fk_Ginásio_ID_Ginasio)
    REFERENCES ??? (???);
 
ALTER TABLE Rota ADD CONSTRAINT FK_Rota_2
    FOREIGN KEY (fk_Rota_ID_Rota)
    REFERENCES Rota (ID_Rota);
 
ALTER TABLE Ataque ADD CONSTRAINT FK_Ataque_2
    FOREIGN KEY (fk_Pokemon_ID_Pokemon)
    REFERENCES ??? (???);
 
ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_1
    FOREIGN KEY (fk_Lider_Ginásio_Insignia_ID_Lider, fk_Lider_Ginásio_Insignia_ID_Ginasio, fk_Lider_Ginásio_Insignia_ID_Insignia)
    REFERENCES Lider_Ginásio (ID_Lider, ID_Ginasio, ID_Insignia)
    ON DELETE CASCADE;
 
ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_2
    FOREIGN KEY (fk_Rota_ID_Rota)
    REFERENCES Rota (ID_Rota)
    ON DELETE SET NULL;
 
ALTER TABLE Batalha ADD CONSTRAINT FK_Batalha_2
    FOREIGN KEY (fk_Lider_Ginásio_Insignia_ID_Lider, fk_Lider_Ginásio_Insignia_ID_Ginasio, fk_Lider_Ginásio_Insignia_ID_Insignia)
    REFERENCES Lider_Ginásio (ID_Lider, ID_Ginasio, ID_Insignia);
 
ALTER TABLE Batalha ADD CONSTRAINT FK_Batalha_3
    FOREIGN KEY (fk_Personagem_Pokedex_ID_Personagem, fk_Personagem_Pokedex_ID_Pokedex)
    REFERENCES Personagem_Pokedex (ID_Personagem, ID_Pokedex);
 
ALTER TABLE Captura_Pokemon ADD CONSTRAINT FK_Captura_Pokemon_2
    FOREIGN KEY (fk_Pokeball_ID_Pokebola)
    REFERENCES Pokeball (ID_Pokebola);
 
ALTER TABLE Encontro_Pokemon ADD CONSTRAINT FK_Encontro_Pokemon_2
    FOREIGN KEY (fk_Personagem_Pokedex_ID_Personagem, fk_Personagem_Pokedex_ID_Pokedex)
    REFERENCES Personagem_Pokedex (ID_Personagem, ID_Pokedex);
 
ALTER TABLE Encontro_Pokemon ADD CONSTRAINT FK_Encontro_Pokemon_3
    FOREIGN KEY (fk_Pokemon_ID_Pokemon)
    REFERENCES ??? (???);
 
ALTER TABLE Tipo_Ataque ADD CONSTRAINT FK_Tipo_Ataque_1
    FOREIGN KEY (fk_Ataque_ID_Ataque)
    REFERENCES Ataque (ID_Ataque)
    ON DELETE RESTRICT;
 
ALTER TABLE Tipo_Ataque ADD CONSTRAINT FK_Tipo_Ataque_2
    FOREIGN KEY (fk_Tipo_Efetividade_ID_Tipo, fk_Tipo_Efetividade_ID_Efetividade)
    REFERENCES Tipo_Efetividade (ID_Tipo, ID_Efetividade)
    ON DELETE SET NULL;
 
ALTER TABLE Tipo_Pokemon ADD CONSTRAINT FK_Tipo_Pokemon_1
    FOREIGN KEY (FK_Pokemon_ID_Pokemon)
    REFERENCES ??? (???);
 
ALTER TABLE Tipo_Pokemon ADD CONSTRAINT FK_Tipo_Pokemon_2
    FOREIGN KEY (FK_Tipo_Efetividade_ID_Tipo, FK_Tipo_Efetividade_ID_Efetividade)
    REFERENCES Tipo_Efetividade (ID_Tipo, ID_Efetividade)
    ON DELETE SET NULL;
 
ALTER TABLE Entrega Insignia ADD CONSTRAINT FK_Entrega Insignia_1
    FOREIGN KEY (fk_Personagem_Pokedex_ID_Personagem, ???)
    REFERENCES Personagem_Pokedex (ID_Personagem, ???)
    ON DELETE RESTRICT;
 
ALTER TABLE Entrega Insignia ADD CONSTRAINT FK_Entrega Insignia_2
    FOREIGN KEY (fk_Lider_Ginásio_Insignia_ID_Lider, fk_Lider_Ginásio_Insignia_ID_Ginasio, ???)
    REFERENCES Lider_Ginásio (ID_Lider, ID_Ginasio, ???)
    ON DELETE SET NULL;
 
ALTER TABLE Tipo_Ginásio ADD CONSTRAINT FK_Tipo_Ginásio_1
    FOREIGN KEY (fk_Lider_Ginásio_Insignia_ID_Lider, fk_Lider_Ginásio_Insignia_ID_Ginasio, fk_Lider_Ginásio_Insignia_ID_Insignia)
    REFERENCES Lider_Ginásio (ID_Lider, ID_Ginasio, ID_Insignia)
    ON DELETE SET NULL;
 
ALTER TABLE Tipo_Ginásio ADD CONSTRAINT FK_Tipo_Ginásio_2
    FOREIGN KEY (fk_Tipo_Efetividade_ID_Tipo, fk_Tipo_Efetividade_ID_Efetividade)
    REFERENCES Tipo_Efetividade (ID_Tipo, ID_Efetividade)
    ON DELETE SET NULL;
 
ALTER TABLE Passa por ADD CONSTRAINT FK_Passa por_1
    FOREIGN KEY (fk_Personagem_Pokedex_ID_Personagem, fk_Personagem_Pokedex_ID_Pokedex)
    REFERENCES Personagem_Pokedex (ID_Personagem, ID_Pokedex)
    ON DELETE SET NULL;
 
ALTER TABLE Passa por ADD CONSTRAINT FK_Passa por_2
    FOREIGN KEY (fk_Rota_ID_Rota)
    REFERENCES Rota (ID_Rota)
    ON DELETE SET NULL;
 
ALTER TABLE Lança ADD CONSTRAINT FK_Lança_1
    FOREIGN KEY (fk_Personagem_Pokedex_ID_Personagem, fk_Personagem_Pokedex_ID_Pokedex)
    REFERENCES Personagem_Pokedex (ID_Personagem, ID_Pokedex)
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
    FOREIGN KEY (fk_Pokemon_ID_Pokemon)
    REFERENCES ??? (???);