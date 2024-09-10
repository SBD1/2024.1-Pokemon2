CREATE VIEW "DetalhesPokemon" AS
SELECT p."dex",
    p."nome",
    p."tipo",
    p."hp",
    p."ataque",
    p."defesa",
    p."velocidade",
    p."spAtaque" AS "AtaqueEspecial",
    p."spDefesa" AS "DefesaEspecial",
    h."nome" AS "Habilidade",
    h."poder",
    h."precisao",
    pi."treinadorId",
    pi."timePokemonId",
    pi."timeNPCId"
FROM "Pokemon" p
    LEFT JOIN "Habilidade" h ON p."habilidadeId" = h."id"
    LEFT JOIN "PokemonInst" pi ON p."dex" = pi."pokemonDex";
CREATE VIEW "PokemonPorRota" AS
SELECT r."id" AS "RotaID",
    p."dex" AS "PokedexID",
    p."nome" AS "NomePokemon",
    p."tipo" AS "TipoPokemon",
    p."hp",
    p."ataque",
    p."defesa",
    p."velocidade",
    p."spAtaque",
    p."spDefesa"
FROM "Rota" r
    JOIN "Surgimento" s ON r."id" = s."rotaId"
    JOIN "Pokemon" p ON s."pokemonId" = p."dex";
CREATE VIEW "CapturasPorTreinador" AS
SELECT t."id" AS "TreinadorID",
    c."pokemonId" AS "PokemonID",
    p."nome" AS "NomePokemon",
    pb."tipo" AS "TipoPokebola"
FROM "Treinador" t
    JOIN "Captura" c ON t."id" = c."treinadorId"
    JOIN "Pokemon" p ON c."pokemonId" = p."dex"
    JOIN "Pokeball" pb ON c."pokeballId" = pb."id";
CREATE VIEW "ViewPokemonTreinador" AS
SELECT t."id" AS "TreinadorID",
    pi."id" AS "PokemonInstID",
    p."nome" AS "NomePokemon",
    p."tipo" AS "TipoPokemon",
    pi."nivel" AS "NivelPokemon",
    pi."hp" AS "HP",
    pi."ataque" AS "Ataque",
    pi."defesa" AS "Defesa",
    pi."velocidade" AS "Velocidade",
    pi."spAtaque" AS "AtaqueEspecial",
    pi."spDefesa" AS "DefesaEspecial"
FROM "Treinador" t
    JOIN "PokemonInst" pi ON pi."treinadorId" = t."id"
    JOIN "Pokemon" p ON p."dex" = pi."pokemonDex";