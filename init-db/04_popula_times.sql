-- Insert pokemons instances into teams of the npcs
-- Rock type
INSERT INTO "PokemonInstNPC" (
        "pokemonDex",
        "timeNPCId",
        "nivel",
        "hp",
        "ataque",
        "defesa",
        "velocidade",
        "spAtaque",
        "spDefesa"
    )
VALUES (248, 1, 100, 134, 110, 61, 95, 100, 85);
-- Water type
INSERT INTO "PokemonInstNPC" (
        "pokemonDex",
        "timeNPCId",
        "nivel",
        "hp",
        "ataque",
        "defesa",
        "velocidade",
        "spAtaque",
        "spDefesa"
    )
VALUES (382, 2, 100, 100, 90, 90, 150, 140, 100);
-- Fire type
INSERT INTO "PokemonInstNPC" (
        "pokemonDex",
        "timeNPCId",
        "nivel",
        "hp",
        "ataque",
        "defesa",
        "velocidade",
        "spAtaque",
        "spDefesa"
    )
VALUES (257, 3, 100, 100, 100, 100, 100, 100, 100);
-- League NPCs pokemons
-- Legendary 1
INSERT INTO "PokemonInstNPC" (
        "pokemonDex",
        "timeNPCId",
        "nivel",
        "hp",
        "ataque",
        "defesa",
        "velocidade",
        "spAtaque",
        "spDefesa"
    )
VALUES (150, 4, 100, 100, 100, 100, 100, 100, 100);
-- Legendary 2
INSERT INTO "PokemonInstNPC" (
        "pokemonDex",
        "timeNPCId",
        "nivel",
        "hp",
        "ataque",
        "defesa",
        "velocidade",
        "spAtaque",
        "spDefesa"
    )
VALUES (249, 5, 100, 100, 100, 100, 100, 100, 100);
-- Legendary 3
INSERT INTO "PokemonInstNPC" (
        "pokemonDex",
        "timeNPCId",
        "nivel",
        "hp",
        "ataque",
        "defesa",
        "velocidade",
        "spAtaque",
        "spDefesa"
    )
VALUES (384, 6, 100, 100, 100, 100, 100, 100, 100);
-- Insert Default Trainer Pokemon for testing
-- Charizard
INSERT INTO "PokemonInst" (
        "pokemonDex",
        "treinadorId",
        "nivel",
        "hp",
        "ataque",
        "defesa",
        "velocidade",
        "spAtaque",
        "spDefesa",
        "timePokemonId"
    )
VALUES (6, 1, 100, 100, 500, 100, 500, 100, 100, 1);