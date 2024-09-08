-- CreateEnum
CREATE TYPE "TipoPokemon" AS ENUM ('AGUA', 'FOGO', 'GRAMA', 'ELETRICO', 'LUTADOR', 'PSIQUICO', 'VENENOSO', 'PEDRA', 'VOADOR', 'GELO', 'INSETO', 'DRAGAO', 'FANTASMA', 'SOMBRIO', 'TERRA', 'METAL', 'FADA');

-- CreateEnum
CREATE TYPE "PokeballTipo" AS ENUM ('POKEBALL', 'GREATBALL', 'ULTRABALL', 'MASTERBALL');

-- CreateTable
CREATE TABLE "Treinador" (
    "id" SERIAL NOT NULL,
    "qtdPokeball" INTEGER NOT NULL,
    "qtdGreatBall" INTEGER NOT NULL,
    "qtdUltraBall" INTEGER NOT NULL,
    "qtdMasterBall" INTEGER NOT NULL,
    "timePokemonId" INTEGER NOT NULL,

    CONSTRAINT "Treinador_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rota" (
    "id" SERIAL NOT NULL,

    CONSTRAINT "Rota_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RotaRota" (
    "id" SERIAL NOT NULL,
    "origemRotaId" INTEGER NOT NULL,
    "destinoRotaId" INTEGER NOT NULL,

    CONSTRAINT "RotaRota_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RotaRotaCidade" (
    "id" SERIAL NOT NULL,
    "origemRotaId" INTEGER NOT NULL,
    "destinoCidadeId" INTEGER NOT NULL,

    CONSTRAINT "RotaRotaCidade_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RotaCidadeRota" (
    "id" SERIAL NOT NULL,
    "origemCidadeId" INTEGER NOT NULL,
    "destinoRotaId" INTEGER NOT NULL,

    CONSTRAINT "RotaCidadeRota_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cidade" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "possui_pokemart" BOOLEAN NOT NULL,
    "possui_centro_pokemon" BOOLEAN NOT NULL,
    "possui_ginasio" BOOLEAN NOT NULL,

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
    "pokemonDex" INTEGER NOT NULL,
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
    "pokemonVistosId" INTEGER[],
    "pokemonRegistradosId" INTEGER[],
    "statusCompletude" BOOLEAN NOT NULL,
    "dexRegistradosId" INTEGER[],

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
ALTER TABLE "Treinador" ADD CONSTRAINT "Treinador_timePokemonId_fkey" FOREIGN KEY ("timePokemonId") REFERENCES "TimePokemon"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RotaRota" ADD CONSTRAINT "RotaRota_origemRotaId_fkey" FOREIGN KEY ("origemRotaId") REFERENCES "Rota"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RotaRota" ADD CONSTRAINT "RotaRota_destinoRotaId_fkey" FOREIGN KEY ("destinoRotaId") REFERENCES "Rota"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RotaRotaCidade" ADD CONSTRAINT "RotaRotaCidade_origemRotaId_fkey" FOREIGN KEY ("origemRotaId") REFERENCES "Rota"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RotaRotaCidade" ADD CONSTRAINT "RotaRotaCidade_destinoCidadeId_fkey" FOREIGN KEY ("destinoCidadeId") REFERENCES "Cidade"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RotaCidadeRota" ADD CONSTRAINT "RotaCidadeRota_origemCidadeId_fkey" FOREIGN KEY ("origemCidadeId") REFERENCES "Cidade"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RotaCidadeRota" ADD CONSTRAINT "RotaCidadeRota_destinoRotaId_fkey" FOREIGN KEY ("destinoRotaId") REFERENCES "Rota"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Lider" ADD CONSTRAINT "Lider_timeLiderID_fkey" FOREIGN KEY ("timeLiderID") REFERENCES "TimeNPC"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Insignia" ADD CONSTRAINT "Insignia_liderId_fkey" FOREIGN KEY ("liderId") REFERENCES "Lider"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EntregaInsignia" ADD CONSTRAINT "EntregaInsignia_insigniaId_fkey" FOREIGN KEY ("insigniaId") REFERENCES "Insignia"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EntregaInsignia" ADD CONSTRAINT "EntregaInsignia_treinadorId_fkey" FOREIGN KEY ("treinadorId") REFERENCES "Treinador"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ginasio" ADD CONSTRAINT "Ginasio_cidadeId_fkey" FOREIGN KEY ("cidadeId") REFERENCES "Cidade"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ginasio" ADD CONSTRAINT "Ginasio_liderId_fkey" FOREIGN KEY ("liderId") REFERENCES "Lider"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ginasio" ADD CONSTRAINT "Ginasio_ligaId_fkey" FOREIGN KEY ("ligaId") REFERENCES "Liga"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PokemonInst" ADD CONSTRAINT "PokemonInst_pokemonDex_fkey" FOREIGN KEY ("pokemonDex") REFERENCES "Pokemon"("dex") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PokemonInst" ADD CONSTRAINT "PokemonInst_treinadorId_fkey" FOREIGN KEY ("treinadorId") REFERENCES "Treinador"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PokemonInst" ADD CONSTRAINT "PokemonInst_timePokemonId_fkey" FOREIGN KEY ("timePokemonId") REFERENCES "TimePokemon"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PokemonInst" ADD CONSTRAINT "PokemonInst_timeNPCId_fkey" FOREIGN KEY ("timeNPCId") REFERENCES "TimeNPC"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pokemon" ADD CONSTRAINT "Pokemon_habilidadeId_fkey" FOREIGN KEY ("habilidadeId") REFERENCES "Habilidade"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pokemon" ADD CONSTRAINT "Pokemon_evolucaoDex_fkey" FOREIGN KEY ("evolucaoDex") REFERENCES "Pokemon"("dex") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pokemon" ADD CONSTRAINT "Pokemon_rotaId_fkey" FOREIGN KEY ("rotaId") REFERENCES "Rota"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NPC" ADD CONSTRAINT "NPC_TimeNPCId_fkey" FOREIGN KEY ("TimeNPCId") REFERENCES "TimeNPC"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NPC" ADD CONSTRAINT "NPC_ligaId_fkey" FOREIGN KEY ("ligaId") REFERENCES "Liga"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Captura" ADD CONSTRAINT "Captura_treinadorId_fkey" FOREIGN KEY ("treinadorId") REFERENCES "Treinador"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Captura" ADD CONSTRAINT "Captura_pokemonId_fkey" FOREIGN KEY ("pokemonId") REFERENCES "Pokemon"("dex") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Captura" ADD CONSTRAINT "Captura_pokeballId_fkey" FOREIGN KEY ("pokeballId") REFERENCES "Pokeball"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Surgimento" ADD CONSTRAINT "Surgimento_pokemonId_fkey" FOREIGN KEY ("pokemonId") REFERENCES "Pokemon"("dex") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Surgimento" ADD CONSTRAINT "Surgimento_rotaId_fkey" FOREIGN KEY ("rotaId") REFERENCES "Rota"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EncontroPokemon" ADD CONSTRAINT "EncontroPokemon_pokemonId_fkey" FOREIGN KEY ("pokemonId") REFERENCES "Pokemon"("dex") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EncontroPokemon" ADD CONSTRAINT "EncontroPokemon_treinadorId_fkey" FOREIGN KEY ("treinadorId") REFERENCES "Treinador"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EncontroPokemon" ADD CONSTRAINT "EncontroPokemon_rotaId_fkey" FOREIGN KEY ("rotaId") REFERENCES "Rota"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BatalhaLider" ADD CONSTRAINT "BatalhaLider_treinadorId_fkey" FOREIGN KEY ("treinadorId") REFERENCES "Treinador"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BatalhaLider" ADD CONSTRAINT "BatalhaLider_liderId_fkey" FOREIGN KEY ("liderId") REFERENCES "Lider"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BatalhaLiga" ADD CONSTRAINT "BatalhaLiga_treinadorId_fkey" FOREIGN KEY ("treinadorId") REFERENCES "Treinador"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BatalhaLiga" ADD CONSTRAINT "BatalhaLiga_npcId_fkey" FOREIGN KEY ("npcId") REFERENCES "NPC"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DesafioLiga" ADD CONSTRAINT "DesafioLiga_treinadorId_fkey" FOREIGN KEY ("treinadorId") REFERENCES "Treinador"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DesafioLiga" ADD CONSTRAINT "DesafioLiga_ligaId_fkey" FOREIGN KEY ("ligaId") REFERENCES "Liga"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LancamentoBall" ADD CONSTRAINT "LancamentoBall_treinadorId_fkey" FOREIGN KEY ("treinadorId") REFERENCES "Treinador"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LancamentoBall" ADD CONSTRAINT "LancamentoBall_pokeballId_fkey" FOREIGN KEY ("pokeballId") REFERENCES "Pokeball"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LancamentoBall" ADD CONSTRAINT "LancamentoBall_encontroId_fkey" FOREIGN KEY ("encontroId") REFERENCES "EncontroPokemon"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pokedex" ADD CONSTRAINT "Pokedex_treinadorId_fkey" FOREIGN KEY ("treinadorId") REFERENCES "Treinador"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
