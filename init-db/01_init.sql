-- CreateEnum
CREATE TYPE "TipoPokemon" AS ENUM (
    'NORMAL',
    'AGUA',
    'FOGO',
    'GRAMA',
    'ELETRICO',
    'LUTADOR',
    'PSIQUICO',
    'VENENOSO',
    'PEDRA',
    'VOADOR',
    'GELO',
    'INSETO',
    'DRAGAO',
    'FANTASMA',
    'SOMBRIO',
    'TERRA',
    'METAL',
    'FADA'
);
-- CreateEnum
CREATE TYPE "PokeballTipo" AS ENUM (
    'POKEBALL',
    'GREATBALL',
    'ULTRABALL',
    'MASTERBALL'
);
-- CreateTable
CREATE TABLE "Treinador" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "qtdPokeball" INTEGER NOT NULL,
    "qtdGreatBall" INTEGER NOT NULL,
    "qtdUltraBall" INTEGER NOT NULL,
    "qtdMasterBall" INTEGER NOT NULL,
    "timePokemonId" INTEGER NOT NULL,
    "rotaAtualId" INTEGER,
    "cidadeAtualId" INTEGER,
    CONSTRAINT "Treinador_pkey" PRIMARY KEY ("id")
);
-- CreateTable Rota com Foreign Keys
CREATE TABLE "Rota" (
    "id" SERIAL NOT NULL,
    "rotaDestinoId" INTEGER,
    "cidadeDestinoId" INTEGER,
    CONSTRAINT "Rota_pkey" PRIMARY KEY ("id")
);
-- CreateTable Cidade com Foreign Key para Rota
CREATE TABLE "Cidade" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "possui_pokemart" BOOLEAN NOT NULL,
    "possui_centro_pokemon" BOOLEAN NOT NULL,
    "possui_ginasio" BOOLEAN NOT NULL,
    "rotaId" INTEGER,
    CONSTRAINT "Cidade_pkey" PRIMARY KEY ("id")
);
-- CreateTable
CREATE TABLE "Lider" (
    "id" SERIAL NOT NULL,
    "ginasioId" INTEGER NOT NULL,
    "biografia" TEXT NOT NULL,
    "timeLiderID" INTEGER NOT NULL,
    CONSTRAINT "Lider_pkey" PRIMARY KEY ("id")
);
-- CreateTable
CREATE TABLE "Insignia" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "liderId" INTEGER NOT NULL,
    "tipoPokemon" "TipoPokemon" NOT NULL,
    CONSTRAINT "Insignia_pkey" PRIMARY KEY ("id")
);
-- CreateTable
CREATE TABLE "EntregaInsignia" (
    "id" SERIAL NOT NULL,
    "insigniaId" INTEGER NOT NULL,
    "treinadorId" INTEGER NOT NULL,
    CONSTRAINT "EntregaInsignia_pkey" PRIMARY KEY ("id")
);
-- CreateTable
CREATE TABLE "Ginasio" (
    "id" SERIAL NOT NULL,
    "cidadeId" INTEGER NOT NULL,
    "liderId" INTEGER NOT NULL,
    "ligaId" INTEGER,
    CONSTRAINT "Ginasio_pkey" PRIMARY KEY ("id")
);
-- CreateTable
CREATE TABLE "Habilidade" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "tipo" "TipoPokemon" NOT NULL,
    "poder" INTEGER NOT NULL,
    "precisao" INTEGER NOT NULL,
    CONSTRAINT "Habilidade_pkey" PRIMARY KEY ("id")
);
-- CreateTable
CREATE TABLE "PokemonInst" (
    "id" SERIAL NOT NULL,
    "pokemonDex" INTEGER NOT NULL,
    "treinadorId" INTEGER NOT NULL,
    "nivel" INTEGER NOT NULL,
    "hp" INTEGER NOT NULL,
    "ataque" INTEGER NOT NULL,
    "defesa" INTEGER NOT NULL,
    "velocidade" INTEGER NOT NULL,
    "spAtaque" INTEGER NOT NULL,
    "spDefesa" INTEGER NOT NULL,
    "timePokemonId" INTEGER,
    "timeNPCId" INTEGER,
    CONSTRAINT "PokemonInst_pkey" PRIMARY KEY ("id")
);
-- CreateTable
CREATE TABLE "Pokemon" (
    "dex" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "tipo" "TipoPokemon" NOT NULL,
    "hp" INTEGER NOT NULL,
    "ataque" INTEGER NOT NULL,
    "defesa" INTEGER NOT NULL,
    "velocidade" INTEGER NOT NULL,
    "spAtaque" INTEGER NOT NULL,
    "spDefesa" INTEGER NOT NULL,
    "evolucaoDex" INTEGER,
    "habilidadeId" INTEGER NOT NULL,
    "rotaId" INTEGER,
    CONSTRAINT "Pokemon_pkey" PRIMARY KEY ("dex")
);
-- CreateTable
CREATE TABLE "Liga" (
    "id" SERIAL NOT NULL,
    "descricao" TEXT NOT NULL,
    "nInsiginias" INTEGER NOT NULL,
    CONSTRAINT "Liga_pkey" PRIMARY KEY ("id")
);
-- CreateTable
CREATE TABLE "NPC" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "TimeNPCId" INTEGER NOT NULL,
    "ligaId" INTEGER,
    CONSTRAINT "NPC_pkey" PRIMARY KEY ("id")
);
-- CreateTable
CREATE TABLE "TimePokemon" (
    "id" SERIAL NOT NULL,
    CONSTRAINT "TimePokemon_pkey" PRIMARY KEY ("id")
);
-- CreateTable
CREATE TABLE "TimeNPC" (
    "id" SERIAL NOT NULL,
    CONSTRAINT "TimeNPC_pkey" PRIMARY KEY ("id")
);
-- CreateTable
CREATE TABLE "Pokeball" (
    "id" SERIAL NOT NULL,
    "tipo" "PokeballTipo" NOT NULL,
    "chanceCaptura" INTEGER NOT NULL,
    CONSTRAINT "Pokeball_pkey" PRIMARY KEY ("id")
);
-- CreateTable
CREATE TABLE "Captura" (
    "id" SERIAL NOT NULL,
    "treinadorId" INTEGER NOT NULL,
    "pokemonId" INTEGER NOT NULL,
    "pokeballId" INTEGER NOT NULL,
    CONSTRAINT "Captura_pkey" PRIMARY KEY ("id")
);
-- CreateTable
CREATE TABLE "Surgimento" (
    "id" SERIAL NOT NULL,
    "pokemonId" INTEGER NOT NULL,
    "rotaId" INTEGER NOT NULL,
    CONSTRAINT "Surgimento_pkey" PRIMARY KEY ("id")
);
-- CreateTable
CREATE TABLE "EncontroPokemon" (
    "id" SERIAL NOT NULL,
    "pokemonId" INTEGER NOT NULL,
    "treinadorId" INTEGER NOT NULL,
    "rotaId" INTEGER NOT NULL,
    "capturado" BOOLEAN NOT NULL,
    "venceu" BOOLEAN NOT NULL,
    "correu" BOOLEAN NOT NULL,
    "perdeu" BOOLEAN NOT NULL,
    CONSTRAINT "EncontroPokemon_pkey" PRIMARY KEY ("id")
);
-- CreateTable
CREATE TABLE "BatalhaLider" (
    "id" SERIAL NOT NULL,
    "ganhou" BOOLEAN NOT NULL,
    "perdeu" BOOLEAN NOT NULL,
    "treinadorId" INTEGER NOT NULL,
    "liderId" INTEGER NOT NULL,
    CONSTRAINT "BatalhaLider_pkey" PRIMARY KEY ("id")
);
-- CreateTable
CREATE TABLE "BatalhaLiga" (
    "id" SERIAL NOT NULL,
    "ganhou" BOOLEAN NOT NULL,
    "perdeu" BOOLEAN NOT NULL,
    "treinadorId" INTEGER NOT NULL,
    "npcId" INTEGER NOT NULL,
    "ligaId" INTEGER NOT NULL,
    CONSTRAINT "BatalhaLiga_pkey" PRIMARY KEY ("id")
);
-- CreateTable
CREATE TABLE "DesafioLiga" (
    "id" SERIAL NOT NULL,
    "treinadorId" INTEGER NOT NULL,
    "ligaId" INTEGER NOT NULL,
    CONSTRAINT "DesafioLiga_pkey" PRIMARY KEY ("id")
);
-- CreateTable
CREATE TABLE "LancamentoBall" (
    "id" SERIAL NOT NULL,
    "treinadorId" INTEGER NOT NULL,
    "encontroId" INTEGER NOT NULL,
    "pokeballId" INTEGER NOT NULL,
    CONSTRAINT "LancamentoBall_pkey" PRIMARY KEY ("id")
);
-- CreateTable
CREATE TABLE "Pokedex" (
    "id" SERIAL NOT NULL,
    "treinadorId" INTEGER NOT NULL,
    "qtdPokemonVistos" INTEGER NOT NULL,
    "qtdPokemonCapturados" INTEGER NOT NULL,
    "qtdPokemonRegistrados" INTEGER NOT NULL,
    "pokemonVistosId" INTEGER [],
    "pokemonRegistradosId" INTEGER [],
    "statusCompletude" BOOLEAN NOT NULL,
    "dexRegistradosId" INTEGER [],
    CONSTRAINT "Pokedex_pkey" PRIMARY KEY ("id")
);
-- CreateIndex
CREATE UNIQUE INDEX "Treinador_timePokemonId_key" ON "Treinador"("timePokemonId");
-- CreateIndex
CREATE UNIQUE INDEX "Lider_ginasioId_key" ON "Lider"("ginasioId");
-- CreateIndex
CREATE UNIQUE INDEX "Lider_timeLiderID_key" ON "Lider"("timeLiderID");
-- CreateIndex
CREATE UNIQUE INDEX "Ginasio_cidadeId_key" ON "Ginasio"("cidadeId");
-- CreateIndex
CREATE UNIQUE INDEX "Ginasio_liderId_key" ON "Ginasio"("liderId");
-- CreateIndex
CREATE UNIQUE INDEX "NPC_TimeNPCId_key" ON "NPC"("TimeNPCId");
-- AddForeignKey
ALTER TABLE "Treinador"
ADD CONSTRAINT "Treinador_timePokemonId_fkey" FOREIGN KEY ("timePokemonId") REFERENCES "TimePokemon"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "Lider"
ADD CONSTRAINT "Lider_timeLiderID_fkey" FOREIGN KEY ("timeLiderID") REFERENCES "TimeNPC"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "Insignia"
ADD CONSTRAINT "Insignia_liderId_fkey" FOREIGN KEY ("liderId") REFERENCES "Lider"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "EntregaInsignia"
ADD CONSTRAINT "EntregaInsignia_insigniaId_fkey" FOREIGN KEY ("insigniaId") REFERENCES "Insignia"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "EntregaInsignia"
ADD CONSTRAINT "EntregaInsignia_treinadorId_fkey" FOREIGN KEY ("treinadorId") REFERENCES "Treinador"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "Ginasio"
ADD CONSTRAINT "Ginasio_cidadeId_fkey" FOREIGN KEY ("cidadeId") REFERENCES "Cidade"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "Ginasio"
ADD CONSTRAINT "Ginasio_liderId_fkey" FOREIGN KEY ("liderId") REFERENCES "Lider"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "Ginasio"
ADD CONSTRAINT "Ginasio_ligaId_fkey" FOREIGN KEY ("ligaId") REFERENCES "Liga"("id") ON DELETE
SET NULL ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "PokemonInst"
ADD CONSTRAINT "PokemonInst_pokemonDex_fkey" FOREIGN KEY ("pokemonDex") REFERENCES "Pokemon"("dex") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "PokemonInst"
ADD CONSTRAINT "PokemonInst_treinadorId_fkey" FOREIGN KEY ("treinadorId") REFERENCES "Treinador"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "PokemonInst"
ADD CONSTRAINT "PokemonInst_timePokemonId_fkey" FOREIGN KEY ("timePokemonId") REFERENCES "TimePokemon"("id") ON DELETE
SET NULL ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "PokemonInst"
ADD CONSTRAINT "PokemonInst_timeNPCId_fkey" FOREIGN KEY ("timeNPCId") REFERENCES "TimeNPC"("id") ON DELETE
SET NULL ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "Pokemon"
ADD CONSTRAINT "Pokemon_habilidadeId_fkey" FOREIGN KEY ("habilidadeId") REFERENCES "Habilidade"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "Pokemon"
ADD CONSTRAINT "Pokemon_evolucaoDex_fkey" FOREIGN KEY ("evolucaoDex") REFERENCES "Pokemon"("dex") ON DELETE
SET NULL ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "Pokemon"
ADD CONSTRAINT "Pokemon_rotaId_fkey" FOREIGN KEY ("rotaId") REFERENCES "Rota"("id") ON DELETE
SET NULL ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "NPC"
ADD CONSTRAINT "NPC_TimeNPCId_fkey" FOREIGN KEY ("TimeNPCId") REFERENCES "TimeNPC"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "NPC"
ADD CONSTRAINT "NPC_ligaId_fkey" FOREIGN KEY ("ligaId") REFERENCES "Liga"("id") ON DELETE
SET NULL ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "Captura"
ADD CONSTRAINT "Captura_treinadorId_fkey" FOREIGN KEY ("treinadorId") REFERENCES "Treinador"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "Captura"
ADD CONSTRAINT "Captura_pokemonId_fkey" FOREIGN KEY ("pokemonId") REFERENCES "Pokemon"("dex") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "Captura"
ADD CONSTRAINT "Captura_pokeballId_fkey" FOREIGN KEY ("pokeballId") REFERENCES "Pokeball"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "Surgimento"
ADD CONSTRAINT "Surgimento_pokemonId_fkey" FOREIGN KEY ("pokemonId") REFERENCES "Pokemon"("dex") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "Surgimento"
ADD CONSTRAINT "Surgimento_rotaId_fkey" FOREIGN KEY ("rotaId") REFERENCES "Rota"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "EncontroPokemon"
ADD CONSTRAINT "EncontroPokemon_pokemonId_fkey" FOREIGN KEY ("pokemonId") REFERENCES "Pokemon"("dex") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "EncontroPokemon"
ADD CONSTRAINT "EncontroPokemon_treinadorId_fkey" FOREIGN KEY ("treinadorId") REFERENCES "Treinador"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "EncontroPokemon"
ADD CONSTRAINT "EncontroPokemon_rotaId_fkey" FOREIGN KEY ("rotaId") REFERENCES "Rota"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "BatalhaLider"
ADD CONSTRAINT "BatalhaLider_treinadorId_fkey" FOREIGN KEY ("treinadorId") REFERENCES "Treinador"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "BatalhaLider"
ADD CONSTRAINT "BatalhaLider_liderId_fkey" FOREIGN KEY ("liderId") REFERENCES "Lider"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "BatalhaLiga"
ADD CONSTRAINT "BatalhaLiga_treinadorId_fkey" FOREIGN KEY ("treinadorId") REFERENCES "Treinador"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "BatalhaLiga"
ADD CONSTRAINT "BatalhaLiga_npcId_fkey" FOREIGN KEY ("npcId") REFERENCES "NPC"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "DesafioLiga"
ADD CONSTRAINT "DesafioLiga_treinadorId_fkey" FOREIGN KEY ("treinadorId") REFERENCES "Treinador"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "DesafioLiga"
ADD CONSTRAINT "DesafioLiga_ligaId_fkey" FOREIGN KEY ("ligaId") REFERENCES "Liga"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "LancamentoBall"
ADD CONSTRAINT "LancamentoBall_treinadorId_fkey" FOREIGN KEY ("treinadorId") REFERENCES "Treinador"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "LancamentoBall"
ADD CONSTRAINT "LancamentoBall_pokeballId_fkey" FOREIGN KEY ("pokeballId") REFERENCES "Pokeball"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "LancamentoBall"
ADD CONSTRAINT "LancamentoBall_encontroId_fkey" FOREIGN KEY ("encontroId") REFERENCES "EncontroPokemon"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE "Pokedex"
ADD CONSTRAINT "Pokedex_treinadorId_fkey" FOREIGN KEY ("treinadorId") REFERENCES "Treinador"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
CREATE OR REPLACE FUNCTION update_pokedex_on_capture_func() RETURNS TRIGGER AS $$ BEGIN
UPDATE "Pokedex"
SET "qtdPokemonCapturados" = "qtdPokemonCapturados" + 1,
    "dexRegistradosId" = array_append("dexRegistradosId", NEW."pokemonId")
WHERE "treinadorId" = NEW."treinadorId";
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER update_pokedex_on_capture
AFTER
INSERT ON "Captura" FOR EACH ROW EXECUTE FUNCTION update_pokedex_on_capture_func();
CREATE OR REPLACE FUNCTION prevent_duplicate_pokemon_in_team_func() RETURNS TRIGGER AS $$ BEGIN IF NEW."timePokemonId" IS NOT NULL THEN IF EXISTS (
        SELECT 1
        FROM "PokemonInst"
        WHERE "timePokemonId" = NEW."timePokemonId"
            AND "pokemonDex" = NEW."pokemonDex"
    ) THEN RAISE EXCEPTION 'Este Pokémon já está no time!';
END IF;
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION check_timepokemon_id() RETURNS TRIGGER AS $$ BEGIN IF NEW."timePokemonId" IS NULL THEN RAISE EXCEPTION 'timePokemonId não pode ser nulo';
END IF;
IF NOT EXISTS (
    SELECT 1
    FROM "TimePokemon"
    WHERE "id" = NEW."timePokemonId"
) THEN RAISE EXCEPTION 'O valor de timePokemonId % não existe na tabela TimePokemon',
NEW."timePokemonId";
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_check_timepokemon_id BEFORE
INSERT ON "Treinador" FOR EACH ROW EXECUTE FUNCTION check_timepokemon_id();
CREATE TRIGGER prevent_duplicate_pokemon_in_team BEFORE
INSERT ON "PokemonInst" FOR EACH ROW EXECUTE FUNCTION prevent_duplicate_pokemon_in_team_func();
CREATE OR REPLACE FUNCTION set_update_date() RETURNS TRIGGER AS $$ BEGIN NEW."dataAtualizacao" := CURRENT_DATE;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER before_update_pokemoninst BEFORE
UPDATE ON "PokemonInst" FOR EACH ROW EXECUTE FUNCTION set_update_date();
CREATE OR REPLACE FUNCTION prevent_important_pokemon_deletion() RETURNS TRIGGER AS $$ BEGIN IF OLD."nivel" > 50 THEN RAISE EXCEPTION 'Não é permitido excluir Pokémons importantes com nível superior a 50: %',
    OLD."nome";
END IF;
RETURN OLD;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER before_delete_pokemon_important BEFORE DELETE ON "PokemonInst" FOR EACH ROW EXECUTE FUNCTION prevent_important_pokemon_deletion();
-- Inserir dados na tabela TimePokemon
INSERT INTO "TimePokemon" ("id")
VALUES (1);
INSERT INTO "Treinador" (
        "nome",
        "qtdPokeball",
        "qtdGreatBall",
        "qtdUltraBall",
        "qtdMasterBall",
        "timePokemonId",
        << << << < HEAD "rotaAtualId",
        "cidadeAtualId"
    )
VALUES ('Ash Ketchum', 5, 0, 0, 0, 1, 1, NULL);
== == == = "rotaAtualId"
)
VALUES ('Ash Ketchum', 5, 0, 0, 0, 1, 1);
>> >> >> > fdb9d4c4d212246fd8cb7dd5c91fc6d37f28393c
INSERT INTO "Rota" (
        "rotaDestinoId",
        "cidadeDestinoId"
    ) << << << < HEAD
VALUES(1, 2),
    (2, 3),
    (3, 1),
    (3, 2),
    (2, 1);
== == == =
VALUES (1, 1),
    (2, 3),
    (3, NULL),
    (4, 3);
INSERT INTO "Rota" DEFAULT
VALUES;
INSERT INTO "Rota" DEFAULT
VALUES;
INSERT INTO "Rota" DEFAULT
VALUES;
-- Inserir dados na tabela Cidade
>> >> >> > fdb9d4c4d212246fd8cb7dd5c91fc6d37f28393c
INSERT INTO "Cidade" (
        "nome",
        "possui_pokemart",
        "possui_centro_pokemon",
        "possui_ginasio"
    )
VALUES ('Cidade A', TRUE, TRUE, TRUE),
    ('Cidade B', FALSE, TRUE, FALSE),
    ('Cidade C', TRUE, FALSE, TRUE);
-- Inserir dados na tabela TimeNPC
INSERT INTO "TimeNPC" ("id")
VALUES (1),
    (2),
    (3);
INSERT INTO "Lider" ("ginasioId", "biografia", "timeLiderID")
VALUES (1, 'Líder experiente de Pokémon.', 1),
    (2, 'Especialista em Pokémon de tipo Fogo.', 2),
    (3, 'Treinador renomado no tipo Água.', 3);
INSERT INTO "Liga" ("descricao", "nInsiginias")
VALUES ('Liga de Kanto', 3);
INSERT INTO "Ginasio" ("cidadeId", "liderId", "ligaId")
VALUES (1, 1, 1),
    (2, 2, 1),
    (3, 3, 1);
-- Habilidades para cada tipo de Pokémon
INSERT INTO "Habilidade" (nome, tipo, poder, precisao)
VALUES ('Ataque Rápido', 'NORMAL', 40, 100);
INSERT INTO "Habilidade" (nome, tipo, poder, precisao)
VALUES ('Jato D’Água', 'AGUA', 40, 100);
INSERT INTO "Habilidade" (nome, tipo, poder, precisao)
VALUES ('Lança-Chamas', 'FOGO', 85, 100);
INSERT INTO "Habilidade" (nome, tipo, poder, precisao)
VALUES ('Chicote de Vinha', 'GRAMA', 45, 100);
INSERT INTO "Habilidade" (nome, tipo, poder, precisao)
VALUES ('Choque do Trovão', 'ELETRICO', 90, 100);
INSERT INTO "Habilidade" (nome, tipo, poder, precisao)
VALUES ('Soco do Meteoro', 'LUTADOR', 100, 85);
INSERT INTO "Habilidade" (nome, tipo, poder, precisao)
VALUES ('Psicocinese', 'PSIQUICO', 90, 100);
INSERT INTO "Habilidade" (nome, tipo, poder, precisao)
VALUES ('Chicote de Veneno', 'VENENOSO', 50, 100);
INSERT INTO "Habilidade" (nome, tipo, poder, precisao)
VALUES ('Pedrada', 'PEDRA', 50, 100);
INSERT INTO "Habilidade" (nome, tipo, poder, precisao)
VALUES ('Asa de Aço', 'VOADOR', 60, 100);
INSERT INTO "Habilidade" (nome, tipo, poder, precisao)
VALUES ('Gelo Seco', 'GELO', 55, 95);
INSERT INTO "Habilidade" (nome, tipo, poder, precisao)
VALUES ('Picada', 'INSETO', 60, 100);
INSERT INTO "Habilidade" (nome, tipo, poder, precisao)
VALUES ('Dragão Claw', 'DRAGAO', 80, 100);
INSERT INTO "Habilidade" (nome, tipo, poder, precisao)
VALUES ('Fantasma', 'FANTASMA', 70, 100);
INSERT INTO "Habilidade" (nome, tipo, poder, precisao)
VALUES ('Garra Sombria', 'SOMBRIO', 80, 100);
INSERT INTO "Habilidade" (nome, tipo, poder, precisao)
VALUES ('Terremoto', 'TERRA', 100, 100);
INSERT INTO "Habilidade" (nome, tipo, poder, precisao)
VALUES ('Ferroada', 'METAL', 60, 100);
INSERT INTO "Habilidade" (nome, tipo, poder, precisao)
VALUES ('Beijo do Amor', 'FADA', 90, 100);
INSERT INTO "Pokeball" (tipo, "chanceCaptura")
VALUES ('POKEBALL', 50);
INSERT INTO "Pokeball" (tipo, "chanceCaptura")
VALUES ('GREATBALL', 75);
INSERT INTO "Pokeball" (tipo, "chanceCaptura")
VALUES ('ULTRABALL', 90);
INSERT INTO "Pokeball" (tipo, "chanceCaptura")
VALUES ('MASTERBALL', 100);