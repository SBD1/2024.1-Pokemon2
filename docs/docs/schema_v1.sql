--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Ubuntu 14.13-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.13 (Ubuntu 14.13-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: batalha_batalha; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.batalha_batalha (
    id_batalha integer NOT NULL,
    exp integer,
    resultado integer,
    "fk_lider_ginásio_insignia_personagem_pokedex_equipe_id_lider" integer,
    "fk_lider_ginásio_insignia_personagem_pokedex_equipe_id_ginasio" integer,
    "fk_lider_ginásio_insignia_personagem_pokedex_equipe_id_insigni" integer,
    "fk_lider_ginásio_insignia_personagem_pokedex_equipe_id_persona" integer,
    "fk_lider_ginásio_insignia_personagem_pokedex_equipe_id_pokedex" integer
);


ALTER TABLE public.batalha_batalha OWNER TO postgres;

--
-- Name: caminho; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.caminho (
    id_caminho integer NOT NULL,
    id_rota_origem integer NOT NULL,
    id_rota_destino integer NOT NULL,
    descricao text
);


ALTER TABLE public.caminho OWNER TO postgres;

--
-- Name: caminho_id_caminho_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.caminho_id_caminho_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.caminho_id_caminho_seq OWNER TO postgres;

--
-- Name: caminho_id_caminho_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.caminho_id_caminho_seq OWNED BY public.caminho.id_caminho;


--
-- Name: captura_captura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.captura_captura (
    id_captura integer NOT NULL,
    experiencia integer,
    fk_pokeball_id_pokebola integer,
    fk_pokemondeagua_id integer,
    fk_pokemondeagua_id_pokemon integer,
    fk_pokemoneletrico_id_pokemon integer,
    fk_pokemondefogo_id integer,
    fk_pokemondefogo_id_pokemon integer,
    fk_pokemondegelo_id integer,
    fk_pokemondegelo_id_pokemon integer,
    fk_pokemonvenenoso_id integer,
    fk_pokemonvenenoso_id_pokemon integer,
    fk_pokemonterrestre_id integer,
    fk_pokemonterrestre_id_pokemon integer,
    fk_pokemonvoador_id integer,
    fk_pokemonvoador_id_pokemon integer,
    "fk_pokemonpsíquico_id" integer,
    "fk_pokemonpsíquico_id_pokemon" integer,
    fk_pokemoninseto_id integer,
    fk_pokemoninseto_id_pokemon integer,
    fk_pokemondepedra_id integer,
    fk_pokemondepedra_id_pokemon integer,
    fk_pokemondragao_id_pokemon integer,
    fk_pokemonsombrio_id_pokemon integer,
    fk_pokemonfada_id integer,
    fk_pokemonfada_id_pokemon integer,
    fk_pokemondeplanta_id integer,
    fk_pokemondeplanta_id_pokemon integer,
    fk_pokemonlutador_id_pokemon integer,
    fk_pokemonmetalico_id integer,
    fk_pokemonmetalico_id_pokemon integer
);


ALTER TABLE public.captura_captura OWNER TO postgres;

--
-- Name: centro_pokemon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.centro_pokemon (
    id_centro integer NOT NULL,
    id_cidade integer NOT NULL,
    nome character varying(100) NOT NULL
);


ALTER TABLE public.centro_pokemon OWNER TO postgres;

--
-- Name: centro_pokemon_id_centro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.centro_pokemon_id_centro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.centro_pokemon_id_centro_seq OWNER TO postgres;

--
-- Name: centro_pokemon_id_centro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.centro_pokemon_id_centro_seq OWNED BY public.centro_pokemon.id_centro;


--
-- Name: cidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cidade (
    id_cidade integer NOT NULL,
    nome character varying(255) NOT NULL
);


ALTER TABLE public.cidade OWNER TO postgres;

--
-- Name: cidade_id_cidade_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cidade_id_cidade_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cidade_id_cidade_seq OWNER TO postgres;

--
-- Name: cidade_id_cidade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cidade_id_cidade_seq OWNED BY public.cidade.id_cidade;


--
-- Name: cidade_rota; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cidade_rota (
    id_cidade integer NOT NULL,
    id_rota integer NOT NULL
);


ALTER TABLE public.cidade_rota OWNER TO postgres;

--
-- Name: elite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elite (
    multiplicador_dificuldade integer,
    id_liga integer NOT NULL,
    descricao character varying,
    numero_insignias_necessarias integer,
    "fk_ginásio_id_ginasio" integer
);


ALTER TABLE public.elite OWNER TO postgres;

--
-- Name: encontro_encontra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.encontro_encontra (
    id_encontro integer NOT NULL,
    capturado integer,
    derrotado integer,
    correu integer,
    perdeu integer,
    experiencia integer,
    "fk_lider_ginásio_insignia_personagem_pokedex_equipe_id_lider" integer,
    "fk_lider_ginásio_insignia_personagem_pokedex_equipe_id_ginasio" integer,
    "fk_lider_ginásio_insignia_personagem_pokedex_equipe_id_insigni" integer,
    "fk_lider_ginásio_insignia_personagem_pokedex_equipe_id_persona" character varying,
    "fk_lider_ginásio_insignia_personagem_pokedex_equipe_id_pokedex" integer,
    fk_pokemondeagua_id integer,
    fk_pokemondeagua_id_pokemon integer,
    fk_pokemoneletrico_id_pokemon integer,
    fk_pokemondefogo_id integer,
    fk_pokemondefogo_id_pokemon integer,
    fk_pokemondegelo_id integer,
    fk_pokemondegelo_id_pokemon integer,
    fk_pokemonvenenoso_id integer,
    fk_pokemonvenenoso_id_pokemon integer,
    fk_pokemonterrestre_id integer,
    fk_pokemonterrestre_id_pokemon integer,
    fk_pokemonvoador_id integer,
    fk_pokemonvoador_id_pokemon integer,
    "fk_pokemonpsíquico_id" integer,
    "fk_pokemonpsíquico_id_pokemon" integer,
    fk_pokemoninseto_id integer,
    fk_pokemoninseto_id_pokemon integer,
    fk_pokemondepedra_id integer,
    fk_pokemondepedra_id_pokemon integer,
    fk_pokemondragao_id_pokemon integer,
    fk_pokemonsombrio_id_pokemon integer,
    fk_pokemonfada_id integer,
    fk_pokemonfada_id_pokemon integer,
    fk_pokemondeplanta_id integer,
    fk_pokemondeplanta_id_pokemon integer,
    fk_pokemonlutador_id_pokemon integer,
    fk_pokemonmetalico_id integer,
    fk_pokemonmetalico_id_pokemon integer
);


ALTER TABLE public.encontro_encontra OWNER TO postgres;

--
-- Name: inst_pokemon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inst_pokemon (
    id_pokemon_inst integer NOT NULL,
    probabilidade_surgimento integer
);


ALTER TABLE public.inst_pokemon OWNER TO postgres;

--
-- Name: instancia_pokemon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instancia_pokemon (
    id_pokemon integer NOT NULL,
    nome character varying(100) NOT NULL,
    nivel integer NOT NULL,
    hp integer NOT NULL,
    tipo character varying(50) NOT NULL,
    id_personagem integer NOT NULL
);


ALTER TABLE public.instancia_pokemon OWNER TO postgres;

--
-- Name: instancia_pokemon_id_pokemon_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instancia_pokemon_id_pokemon_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instancia_pokemon_id_pokemon_seq OWNER TO postgres;

--
-- Name: instancia_pokemon_id_pokemon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instancia_pokemon_id_pokemon_seq OWNED BY public.instancia_pokemon.id_pokemon;


--
-- Name: inventario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventario (
    id integer NOT NULL,
    id_personagem integer,
    item_tipo character varying(50),
    item_nome character varying(100),
    quantidade integer DEFAULT 1
);


ALTER TABLE public.inventario OWNER TO postgres;

--
-- Name: inventario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventario_id_seq OWNER TO postgres;

--
-- Name: inventario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventario_id_seq OWNED BY public.inventario.id;


--
-- Name: lança; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."lança" (
    fk_personagem_pokedex_equipe_id_personagem integer,
    fk_personagem_pokedex_equipe_id_pokedex integer,
    fk_pokeball_id_pokebola integer
);


ALTER TABLE public."lança" OWNER TO postgres;

--
-- Name: lider_ginásio_insignia_personagem_pokedex_equipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."lider_ginásio_insignia_personagem_pokedex_equipe" (
    id_lider integer NOT NULL,
    nome character varying,
    biografia character varying,
    id_ginasio integer NOT NULL,
    fk_personagem_pokedex_equipe_id_personagem integer,
    id_insignia integer NOT NULL,
    tipo character varying,
    id_personagem character varying NOT NULL,
    pokebolas_normais integer,
    pokebolas_greats integer,
    pokebolas_ultras integer,
    id_pokedex integer NOT NULL,
    numero_pokemons integer,
    numero_pokemons_vistos integer,
    numero_pokemons_capturados integer,
    status_completa integer,
    fk_inst_pokemon_id_pokemon_inst integer
);


ALTER TABLE public."lider_ginásio_insignia_personagem_pokedex_equipe" OWNER TO postgres;

--
-- Name: passa_por; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passa_por (
    fk_personagem_pokedex_equipe_id_personagem integer,
    fk_personagem_pokedex_equipe_id_pokedex integer,
    fk_rota_id_rota integer
);


ALTER TABLE public.passa_por OWNER TO postgres;

--
-- Name: personagem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personagem (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    pokeballs integer NOT NULL,
    pokebolas integer,
    num_pokebolas integer
);


ALTER TABLE public.personagem OWNER TO postgres;

--
-- Name: personagem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personagem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personagem_id_seq OWNER TO postgres;

--
-- Name: personagem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personagem_id_seq OWNED BY public.personagem.id;


--
-- Name: pokeball; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokeball (
    id_pokebola integer NOT NULL,
    chance_captura integer,
    pokeball_tipo integer
);


ALTER TABLE public.pokeball OWNER TO postgres;

--
-- Name: pokemon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemon (
    id_pokemon integer NOT NULL,
    nome character varying,
    nivel integer,
    experiencia integer,
    defesa_especial integer,
    velocidade integer,
    tipo character varying,
    fk_instpokemon_id_pokemon_inst integer
);


ALTER TABLE public.pokemon OWNER TO postgres;

--
-- Name: pokemondeagua; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemondeagua (
    hydro_pump integer,
    id integer NOT NULL,
    id_pokemon integer NOT NULL,
    nome character varying,
    nivel integer,
    experiencia integer,
    defesa_especial integer,
    velocidade integer,
    tipo character varying,
    fk_instpokemon_id_pokemon_inst integer
);


ALTER TABLE public.pokemondeagua OWNER TO postgres;

--
-- Name: pokemondefogo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemondefogo (
    id integer NOT NULL,
    id_pokemon integer NOT NULL,
    nome character varying,
    nivel integer,
    experiencia integer,
    defesa_especial integer,
    velocidade integer,
    tipo character varying,
    fk_instpokemon_id_pokemon_inst integer
);


ALTER TABLE public.pokemondefogo OWNER TO postgres;

--
-- Name: pokemondegelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemondegelo (
    id integer NOT NULL,
    id_pokemon integer NOT NULL,
    nome character varying,
    nivel integer,
    experiencia integer,
    defesa_especial integer,
    velocidade integer,
    tipo character varying,
    fk_instpokemon_id_pokemon_inst integer
);


ALTER TABLE public.pokemondegelo OWNER TO postgres;

--
-- Name: pokemondepedra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemondepedra (
    id integer NOT NULL,
    id_pokemon integer NOT NULL,
    nome character varying,
    nivel integer,
    experiencia integer,
    defesa_especial integer,
    velocidade integer,
    tipo character varying,
    fk_instpokemon_id_pokemon_inst integer
);


ALTER TABLE public.pokemondepedra OWNER TO postgres;

--
-- Name: pokemondeplanta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemondeplanta (
    id integer NOT NULL,
    id_pokemon integer NOT NULL,
    nome character varying,
    nivel integer,
    experiencia integer,
    defesa_especial integer,
    velocidade integer,
    tipo character varying,
    fk_instpokemon_id_pokemon_inst integer
);


ALTER TABLE public.pokemondeplanta OWNER TO postgres;

--
-- Name: pokemondragao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemondragao (
    id_pokemon integer NOT NULL,
    nome character varying,
    nivel integer,
    experiencia integer,
    defesa_especial integer,
    velocidade integer,
    tipo character varying,
    fk_instpokemon_id_pokemon_inst integer
);


ALTER TABLE public.pokemondragao OWNER TO postgres;

--
-- Name: pokemoneletrico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemoneletrico (
    fire_blast integer,
    id_pokemon integer NOT NULL,
    nome character varying,
    nivel integer,
    experiencia integer,
    defesa_especial integer,
    velocidade integer,
    tipo character varying,
    fk_instpokemon_id_pokemon_inst integer
);


ALTER TABLE public.pokemoneletrico OWNER TO postgres;

--
-- Name: pokemonfada; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemonfada (
    id integer NOT NULL,
    id_pokemon integer NOT NULL,
    nome character varying,
    nivel integer,
    experiencia integer,
    defesa_especial integer,
    velocidade integer,
    tipo character varying,
    fk_instpokemon_id_pokemon_inst integer
);


ALTER TABLE public.pokemonfada OWNER TO postgres;

--
-- Name: pokemonfantasma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemonfantasma (
);


ALTER TABLE public.pokemonfantasma OWNER TO postgres;

--
-- Name: pokemoninseto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemoninseto (
    id integer NOT NULL,
    id_pokemon integer NOT NULL,
    nome character varying,
    nivel integer,
    experiencia integer,
    defesa_especial integer,
    velocidade integer,
    tipo character varying,
    fk_instpokemon_id_pokemon_inst integer
);


ALTER TABLE public.pokemoninseto OWNER TO postgres;

--
-- Name: pokemonlutador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemonlutador (
    focus_blast integer,
    id_pokemon integer NOT NULL,
    nome character varying,
    nivel integer,
    experiencia integer,
    defesa_especial integer,
    velocidade integer,
    tipo character varying,
    fk_instpokemon_id_pokemon_inst integer
);


ALTER TABLE public.pokemonlutador OWNER TO postgres;

--
-- Name: pokemonmetalico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemonmetalico (
    id integer NOT NULL,
    id_pokemon integer NOT NULL,
    nome character varying,
    nivel integer,
    experiencia integer,
    defesa_especial integer,
    velocidade integer,
    tipo character varying,
    fk_instpokemon_id_pokemon_inst integer
);


ALTER TABLE public.pokemonmetalico OWNER TO postgres;

--
-- Name: pokemonpsíquico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."pokemonpsíquico" (
    id integer NOT NULL,
    id_pokemon integer NOT NULL,
    nome character varying,
    nivel integer,
    experiencia integer,
    defesa_especial integer,
    velocidade integer,
    tipo character varying,
    fk_instpokemon_id_pokemon_inst integer
);


ALTER TABLE public."pokemonpsíquico" OWNER TO postgres;

--
-- Name: pokemonsombrio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemonsombrio (
    id_pokemon integer NOT NULL,
    nome character varying,
    nivel integer,
    experiencia integer,
    defesa_especial integer,
    velocidade integer,
    tipo character varying,
    fk_instpokemon_id_pokemon_inst integer
);


ALTER TABLE public.pokemonsombrio OWNER TO postgres;

--
-- Name: pokemonterrestre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemonterrestre (
    id integer NOT NULL,
    id_pokemon integer NOT NULL,
    nome character varying,
    nivel integer,
    experiencia integer,
    defesa_especial integer,
    velocidade integer,
    tipo character varying,
    fk_instpokemon_id_pokemon_inst integer
);


ALTER TABLE public.pokemonterrestre OWNER TO postgres;

--
-- Name: pokemonvenenoso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemonvenenoso (
    id integer NOT NULL,
    id_pokemon integer NOT NULL,
    nome character varying,
    nivel integer,
    experiencia integer,
    defesa_especial integer,
    velocidade integer,
    tipo character varying,
    fk_instpokemon_id_pokemon_inst integer
);


ALTER TABLE public.pokemonvenenoso OWNER TO postgres;

--
-- Name: pokemonvoador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemonvoador (
    id integer NOT NULL,
    id_pokemon integer NOT NULL,
    nome integer,
    nivel integer,
    experiencia integer,
    defesa_especial integer,
    velocidade integer,
    tipo integer,
    fk_instpokemon_id_pokemon_inst integer
);


ALTER TABLE public.pokemonvoador OWNER TO postgres;

--
-- Name: rota; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rota (
    id_rota integer NOT NULL,
    fk_rota_id_rota integer
);


ALTER TABLE public.rota OWNER TO postgres;

--
-- Name: surge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.surge (
    fk_rota_id_rota integer,
    fk_instpokemon_id_pokemon_inst integer
);


ALTER TABLE public.surge OWNER TO postgres;

--
-- Name: caminho id_caminho; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caminho ALTER COLUMN id_caminho SET DEFAULT nextval('public.caminho_id_caminho_seq'::regclass);


--
-- Name: centro_pokemon id_centro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.centro_pokemon ALTER COLUMN id_centro SET DEFAULT nextval('public.centro_pokemon_id_centro_seq'::regclass);


--
-- Name: cidade id_cidade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidade ALTER COLUMN id_cidade SET DEFAULT nextval('public.cidade_id_cidade_seq'::regclass);


--
-- Name: instancia_pokemon id_pokemon; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instancia_pokemon ALTER COLUMN id_pokemon SET DEFAULT nextval('public.instancia_pokemon_id_pokemon_seq'::regclass);


--
-- Name: inventario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario ALTER COLUMN id SET DEFAULT nextval('public.inventario_id_seq'::regclass);


--
-- Name: personagem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personagem ALTER COLUMN id SET DEFAULT nextval('public.personagem_id_seq'::regclass);


--
-- Name: batalha_batalha batalha_batalha_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.batalha_batalha
    ADD CONSTRAINT batalha_batalha_pkey PRIMARY KEY (id_batalha);


--
-- Name: caminho caminho_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caminho
    ADD CONSTRAINT caminho_pkey PRIMARY KEY (id_caminho);


--
-- Name: captura_captura captura_captura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.captura_captura
    ADD CONSTRAINT captura_captura_pkey PRIMARY KEY (id_captura);


--
-- Name: centro_pokemon centro_pokemon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.centro_pokemon
    ADD CONSTRAINT centro_pokemon_pkey PRIMARY KEY (id_centro);


--
-- Name: cidade cidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (id_cidade);


--
-- Name: cidade_rota cidade_rota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidade_rota
    ADD CONSTRAINT cidade_rota_pkey PRIMARY KEY (id_cidade, id_rota);


--
-- Name: elite elite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elite
    ADD CONSTRAINT elite_pkey PRIMARY KEY (id_liga);


--
-- Name: encontro_encontra encontro_encontra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.encontro_encontra
    ADD CONSTRAINT encontro_encontra_pkey PRIMARY KEY (id_encontro);


--
-- Name: inst_pokemon inst_pokemon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inst_pokemon
    ADD CONSTRAINT inst_pokemon_pkey PRIMARY KEY (id_pokemon_inst);


--
-- Name: instancia_pokemon instancia_pokemon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instancia_pokemon
    ADD CONSTRAINT instancia_pokemon_pkey PRIMARY KEY (id_pokemon);


--
-- Name: inventario inventario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (id);


--
-- Name: lider_ginásio_insignia_personagem_pokedex_equipe lider_ginásio_insignia_personagem_pokedex_equipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."lider_ginásio_insignia_personagem_pokedex_equipe"
    ADD CONSTRAINT "lider_ginásio_insignia_personagem_pokedex_equipe_pkey" PRIMARY KEY (id_lider, id_ginasio, id_insignia, id_personagem, id_pokedex);


--
-- Name: personagem personagem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personagem
    ADD CONSTRAINT personagem_pkey PRIMARY KEY (id);


--
-- Name: pokeball pokeball_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokeball
    ADD CONSTRAINT pokeball_pkey PRIMARY KEY (id_pokebola);


--
-- Name: pokemon pokemon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemon
    ADD CONSTRAINT pokemon_pkey PRIMARY KEY (id_pokemon);


--
-- Name: pokemondeagua pokemondeagua_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemondeagua
    ADD CONSTRAINT pokemondeagua_pkey PRIMARY KEY (id, id_pokemon);


--
-- Name: pokemondefogo pokemondefogo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemondefogo
    ADD CONSTRAINT pokemondefogo_pkey PRIMARY KEY (id, id_pokemon);


--
-- Name: pokemondegelo pokemondegelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemondegelo
    ADD CONSTRAINT pokemondegelo_pkey PRIMARY KEY (id, id_pokemon);


--
-- Name: pokemondepedra pokemondepedra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemondepedra
    ADD CONSTRAINT pokemondepedra_pkey PRIMARY KEY (id, id_pokemon);


--
-- Name: pokemondeplanta pokemondeplanta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemondeplanta
    ADD CONSTRAINT pokemondeplanta_pkey PRIMARY KEY (id, id_pokemon);


--
-- Name: pokemondragao pokemondragao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemondragao
    ADD CONSTRAINT pokemondragao_pkey PRIMARY KEY (id_pokemon);


--
-- Name: pokemoneletrico pokemoneletrico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemoneletrico
    ADD CONSTRAINT pokemoneletrico_pkey PRIMARY KEY (id_pokemon);


--
-- Name: pokemonfada pokemonfada_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemonfada
    ADD CONSTRAINT pokemonfada_pkey PRIMARY KEY (id, id_pokemon);


--
-- Name: pokemoninseto pokemoninseto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemoninseto
    ADD CONSTRAINT pokemoninseto_pkey PRIMARY KEY (id, id_pokemon);


--
-- Name: pokemonlutador pokemonlutador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemonlutador
    ADD CONSTRAINT pokemonlutador_pkey PRIMARY KEY (id_pokemon);


--
-- Name: pokemonmetalico pokemonmetalico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemonmetalico
    ADD CONSTRAINT pokemonmetalico_pkey PRIMARY KEY (id, id_pokemon);


--
-- Name: pokemonpsíquico pokemonpsíquico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."pokemonpsíquico"
    ADD CONSTRAINT "pokemonpsíquico_pkey" PRIMARY KEY (id, id_pokemon);


--
-- Name: pokemonsombrio pokemonsombrio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemonsombrio
    ADD CONSTRAINT pokemonsombrio_pkey PRIMARY KEY (id_pokemon);


--
-- Name: pokemonterrestre pokemonterrestre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemonterrestre
    ADD CONSTRAINT pokemonterrestre_pkey PRIMARY KEY (id, id_pokemon);


--
-- Name: pokemonvenenoso pokemonvenenoso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemonvenenoso
    ADD CONSTRAINT pokemonvenenoso_pkey PRIMARY KEY (id, id_pokemon);


--
-- Name: pokemonvoador pokemonvoador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemonvoador
    ADD CONSTRAINT pokemonvoador_pkey PRIMARY KEY (id, id_pokemon);


--
-- Name: rota rota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rota
    ADD CONSTRAINT rota_pkey PRIMARY KEY (id_rota);


--
-- Name: inventario unique_inventario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT unique_inventario UNIQUE (id_personagem, item_tipo, item_nome);


--
-- Name: caminho caminho_id_rota_destino_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caminho
    ADD CONSTRAINT caminho_id_rota_destino_fkey FOREIGN KEY (id_rota_destino) REFERENCES public.rota(id_rota);


--
-- Name: caminho caminho_id_rota_origem_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caminho
    ADD CONSTRAINT caminho_id_rota_origem_fkey FOREIGN KEY (id_rota_origem) REFERENCES public.rota(id_rota);


--
-- Name: centro_pokemon centro_pokemon_id_cidade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.centro_pokemon
    ADD CONSTRAINT centro_pokemon_id_cidade_fkey FOREIGN KEY (id_cidade) REFERENCES public.cidade(id_cidade);


--
-- Name: cidade_rota cidade_rota_id_cidade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidade_rota
    ADD CONSTRAINT cidade_rota_id_cidade_fkey FOREIGN KEY (id_cidade) REFERENCES public.cidade(id_cidade) ON DELETE CASCADE;


--
-- Name: cidade_rota cidade_rota_id_rota_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidade_rota
    ADD CONSTRAINT cidade_rota_id_rota_fkey FOREIGN KEY (id_rota) REFERENCES public.rota(id_rota) ON DELETE CASCADE;


--
-- Name: lança fk_lança_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."lança"
    ADD CONSTRAINT "fk_lança_2" FOREIGN KEY (fk_pokeball_id_pokebola) REFERENCES public.pokeball(id_pokebola) ON DELETE SET NULL;


--
-- Name: rota fk_rota_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rota
    ADD CONSTRAINT fk_rota_2 FOREIGN KEY (fk_rota_id_rota) REFERENCES public.rota(id_rota);


--
-- Name: surge fk_surge_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surge
    ADD CONSTRAINT fk_surge_1 FOREIGN KEY (fk_rota_id_rota) REFERENCES public.rota(id_rota) ON DELETE SET NULL;


--
-- Name: surge fk_surge_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surge
    ADD CONSTRAINT fk_surge_2 FOREIGN KEY (fk_instpokemon_id_pokemon_inst) REFERENCES public.inst_pokemon(id_pokemon_inst) ON DELETE SET NULL;


--
-- Name: instancia_pokemon instancia_pokemon_id_personagem_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instancia_pokemon
    ADD CONSTRAINT instancia_pokemon_id_personagem_fkey FOREIGN KEY (id_personagem) REFERENCES public.personagem(id) ON DELETE CASCADE;


--
-- Name: inventario inventario_id_personagem_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_id_personagem_fkey FOREIGN KEY (id_personagem) REFERENCES public.personagem(id);


--
-- PostgreSQL database dump complete
--
