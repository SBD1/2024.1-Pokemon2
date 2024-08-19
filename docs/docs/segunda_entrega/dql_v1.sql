-- Ver detalhes do Pokémon
SELECT tb_pokemon.nome, tb_pokemon.hp, tb_pokemon.nivel, tb_pokemon.experiencia, 
       tb_pokemon.ataque_especial, tb_pokemon.defesa_especial, tb_pokemon.velocidade
FROM tb_pokemon;

-- Ver tipo do Pokémon
SELECT tb_pokemon.nome, tb_tipo.nome AS tipo
FROM tb_pokemon 
INNER JOIN tb_pokemon_tipo ON tb_pokemon.id_pokemon = tb_pokemon_tipo.id_pokemon
INNER JOIN tb_tipo ON tb_tipo.id_tipo = tb_pokemon_tipo.id_tipo;

-- Ver ataques do Pokémon
SELECT tb_pokemon.nome, tb_ataque.nome AS ataque, tb_ataque.dano
FROM tb_pokemon 
INNER JOIN tb_pokemon_ataque ON tb_pokemon.id_pokemon = tb_pokemon_ataque.id_pokemon
INNER JOIN tb_ataque ON tb_ataque.id_ataque = tb_pokemon_ataque.id_ataque;

-- Ver efetividade do ataque do Pokémon
SELECT tb_ataque.nome AS ataque, tb_tipo.nome AS tipo, tb_efetividade.modificador
FROM tb_ataque 
INNER JOIN tb_ataque_tipo ON tb_ataque.id_ataque = tb_ataque_tipo.id_ataque
INNER JOIN tb_tipo ON tb_tipo.id_tipo = tb_ataque_tipo.id_tipo
INNER JOIN tb_efetividade ON tb_tipo.id_tipo = tb_efetividade.id_tipo;

-- Ver Pokémons do Líder de Ginásio
SELECT tb_lider.nome, tb_pokemon.nome AS pokemon
FROM tb_lider
INNER JOIN tb_lider_pokemon ON tb_lider.id_lider = tb_lider_pokemon.id_lider
INNER JOIN tb_pokemon ON tb_pokemon.id_pokemon = tb_lider_pokemon.id_pokemon;

-- Ver Pokémons do Personagem
SELECT tb_personagem.nome, tb_pokemon.nome AS pokemon
FROM tb_personagem
INNER JOIN tb_personagem_pokemon ON tb_personagem.id_personagem = tb_personagem_pokemon.id_personagem
INNER JOIN tb_pokemon ON tb_pokemon.id_pokemon = tb_personagem_pokemon.id_pokemon;

-- Encontrar Pokémon pelo nome
SELECT * FROM tb_pokemon WHERE nome = '${nome_pokemon}';

-- Atualizar experiência do Pokémon
UPDATE tb_pokemon 
SET experiencia = '${nova_experiencia}' 
WHERE id_pokemon = '${id_pokemon}';

-- Encontrar ID de um Pokémon pelo nome
SELECT id_pokemon FROM tb_pokemon WHERE nome = '${nome_pokemon}';

-- Verificar Pokémon com maior nível em cada tipo
   SELECT tb_tipo.nome AS tipo, tb_pokemon.nome AS pokemon, MAX(tb_pokemon.nivel) AS nivel
   FROM tb_pokemon
   INNER JOIN tb_pokemon_tipo ON tb_pokemon.id_pokemon = tb_pokemon_tipo.id_pokemon
   INNER JOIN tb_tipo ON tb_tipo.id_tipo = tb_pokemon_tipo.id_tipo
   GROUP BY tb_tipo.nome;


-- Contar quantidade de Pokémons por tipo
   SELECT tb_tipo.nome AS tipo, COUNT(tb_pokemon.id_pokemon) AS quantidade_pokemons
   FROM tb_pokemon
   INNER JOIN tb_pokemon_tipo ON tb_pokemon.id_pokemon = tb_pokemon_tipo.id_pokemon
   INNER JOIN tb_tipo ON tb_tipo.id_tipo = tb_pokemon_tipo.id_tipo
   GROUP BY tb_tipo.nome;


-- Ver Pokémons capturados por personagem (contando também os não escolhidos)
   SELECT tb_personagem.nome, COUNT(tb_personagem_pokemon.id_pokemon) AS total_pokemons
   FROM tb_personagem
   INNER JOIN tb_personagem_pokemon ON tb_personagem.id_personagem = tb_personagem_pokemon.id_personagem
   GROUP BY tb_personagem.nome;


 -- Ver a taxa de captura dos Pokémons
   SELECT tb_pokemon.nome, tb_pokemon_chance_captura.porcentagem_chance
   FROM tb_pokemon
   INNER JOIN tb_pokemon_chance_captura ON tb_pokemon.id_pokemon = tb_pokemon_chance_captura.id_pokemon;

 -- Ver Pokémons escolhidos por personagens
   SELECT tb_personagem.nome, tb_pokemon.nome AS pokemon
   FROM tb_personagem
   INNER JOIN tb_pokemon ON tb_personagem.id_pokemon_escolhido = tb_pokemon.id_pokemon;


 -- Ver Pokémons escolhidos por líderes de ginásio
   SELECT tb_lider.nome, tb_pokemon.nome AS pokemon
   FROM tb_lider
   INNER JOIN tb_pokemon ON tb_lider.id_pokemon_escolhido = tb_pokemon.id_pokemon;

 -- Verificar os ataques que cada Pokémon possui
   SELECT tb_pokemon.nome AS pokemon, tb_ataque.nome AS ataque, tb_ataque.dano
   FROM tb_pokemon
   INNER JOIN tb_pokemon_ataque ON tb_pokemon.id_pokemon = tb_pokemon_ataque.id_pokemon
   INNER JOIN tb_ataque ON tb_ataque.id_ataque = tb_pokemon_ataque.id_ataque;

. -- Verificar o líder de ginásio que tem mais Pokémons
   SELECT tb_lider.nome, COUNT(tb_lider_pokemon.id_pokemon) AS total_pokemons
   FROM tb_lider
   INNER JOIN tb_lider_pokemon ON tb_lider.id_lider = tb_lider_pokemon.id_lider
   GROUP BY tb_lider.nome
   ORDER BY total_pokemons DESC;


 -- Verificar ataques mais efetivos contra um determinado tipo de Pokémon
   SELECT tb_ataque.nome AS ataque, tb_tipo.nome AS tipo, tb_efetividade.modificador
   FROM tb_ataque
   INNER JOIN tb_ataque_tipo ON tb_ataque.id_ataque = tb_ataque_tipo.id_ataque
   INNER JOIN tb_tipo ON tb_tipo.id_tipo = tb_ataque_tipo.id_tipo
   INNER JOIN tb_efetividade ON tb_tipo.id_tipo = tb_efetividade.id_tipo
   WHERE tb_efetividade.id_tipo_contra = (SELECT id_tipo FROM tb_tipo WHERE nome = '${nome_tipo_contra}');

 -- Ver todos os ataques de um determinado tipo de Pokémon
    SELECT tb_ataque.nome AS ataque, tb_ataque.dano
    FROM tb_ataque
    INNER JOIN tb_ataque_tipo ON tb_ataque.id_ataque = tb_ataque_tipo.id_ataque
    WHERE tb_ataque_tipo.id_tipo = (SELECT id_tipo FROM tb_tipo WHERE nome = '${nome_tipo}');

 -- Verificar Pokémons que podem evoluir em breve (baseado na experiência)
    SELECT tb_pokemon.nome, tb_pokemon.nivel, tb_pokemon.experiencia
    FROM tb_pokemon
    WHERE tb_pokemon.experiencia >= (SELECT experiencia_necessaria FROM tb_nivel WHERE tb_nivel.nivel = tb_pokemon.nivel + 1);


 --Verificar líderes de ginásio com Pokémons de nível acima de 50
    SELECT tb_lider.nome, tb_pokemon.nome AS pokemon, tb_pokemon.nivel
    FROM tb_lider
    INNER JOIN tb_lider_pokemon ON tb_lider.id_lider = tb_lider_pokemon.id_lider
    INNER JOIN tb_pokemon ON tb_pokemon.id_pokemon = tb_lider_pokemon.id_pokemon
    WHERE tb_pokemon.nivel > 50;


