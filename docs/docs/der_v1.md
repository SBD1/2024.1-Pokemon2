# **Descrição do Artefato DER - Primeira Versão**

## DER:

![Image](der_v1.png)

### Entidades:

#### **Pokemon**
   - Representa os diferentes Pokémon disponíveis no jogo. Cada Pokémon tem atributos específicos como nome, tipo, habilidades, etc.

#### **Porção**
   - Representa itens de cura e melhoria de status que os jogadores podem usar para recuperar a saúde dos Pokémon ou melhorar suas estatísticas temporariamente.

#### **Insignia**
   - Representa as insígnias que os personagens podem obter ao derrotar líderes de ginásios. Essas insígnias são um símbolo de progresso e habilidade.

#### **Personagem**
   - Representa os personagens dentro do jogo, incluindo treinadores (Players) e personagens não jogáveis (NPCs). Os personagens têm atributos como nome, idade, e podem possuir Pokémon, capturar Pokémon e obter insígnias.

#### **NPC**
   - Subconjunto de Personagem, NPCs são personagens não jogáveis que interagem com o jogador e podem fornecer informações, desafios ou recompensas.

#### **Player**
   - Subconjunto de Personagem, os jogadores são personagens controlados pelos usuários que podem capturar Pokémon, obter insígnias e interagir com o mundo do jogo.

#### **Caminhos**
   - Representa os diferentes caminhos que os personagens podem percorrer no jogo. Esses caminhos conectam diferentes áreas como cidades, ginásios e centros Pokémon.

#### **Ginásio**
   - Representa os ginásios Pokémon onde os personagens podem desafiar líderes de ginásio para ganhar insígnias.

#### **Centro Pokemon**
   - Representa os centros Pokémon onde os jogadores podem curar seus Pokémon e obter assistência.

#### **Pokeball**
    - Representa as pokébolas usadas pelos personagens para capturar Pokémon. Existem diferentes tipos de Pokébolas com diferentes taxas de captura.

#### Entidades e Atributos

**Pokemon**

- ID_Pokemon
- Nome
- Nível
- Experiência
- HP
- Ataque
- Defesa
- Velocidade
- Habilidade

**Item**

- ID_Item
- Nome
- Descrição
- Efeito
- Tipo de Item (Consumível, Equipamento, Evolutivo, Aprendizado, Medicinais, Pokebolas, batalha, valiosos, Apriorísticos (Mega Evolução), decoração, eventos)
- Preço
- Raridade (Comum, Raro, Lendário)
- Peso
- Usos por Item (número de vezes que pode ser usado)
- Categoria (Medicinal, Batalha, Aprimoramento, etc.)
- Data de Introdução (quando foi adicionado ao jogo)
- ID_Pokemon_Compatível (FK) (especificar se é compatível com Pokémon específicos)
- Vendas Totais (quantidade vendida)
- Localização de Compra (onde pode ser adquirido: PokeMart, Centro Pokémon, etc.)
- Nível Mínimo Requerido (nível do jogador ou Pokémon necessário para uso)
- Efeito Secundário (qualquer efeito adicional)
- Durabilidade (se aplicável, por exemplo, para equipamentos)
- Quantidade no Estoque
- Data de Expiração (se aplicável)
- Versões de Jogo Disponíveis (se o item está disponível em várias versões do jogo)
- Descontos Aplicáveis
- Imagem/Ícone
- Requisitos Especiais (condições necessárias para usar o item)
- ID_Evento (FK) (se o item está relacionado a algum evento específico)
- Usável em Batalha (sim/não)
- Multiplicador de Efeito (se aumenta algum atributo, qual é o multiplicador)
- Interações Especiais (como o item interage com outros itens ou habilidades)


**Personagem**

- ID_Personagem
- Nome
- Função (Treinador, Líder de Ginásio, Membro da Equipe Rocket, etc.)

**NPC**

- ID_NPC
- Nome
- Localização

**Player**

- ID_Player
- Nome
- ID_Personagem (FK)
- ID_Pokedex (FK)

**Caminho**

- ID_Caminho
- Nome
- Descrição


**Centro Pokémon**
- ID_Centro
- Nome
- Localização (Região/Cidade)
- Horário de Funcionamento
- Capacidade de Atendimento (número de Pokémon que podem ser atendidos ao mesmo tempo)
- Número de Enfermeiros
- Serviços Oferecidos (Curar Pokémon, PC Box, Troca de Pokémon)
- Data de Inauguração
- Número de Máquinas de Cura
- Número de Salas de Tratamento
- Número de PCs Disponíveis
- Área de Descanso para Treinadores
- Loja de Itens (sim/não)
- Segurança (nível de segurança baixo, mpedio, alto)
- Popularidade (classificação em número de estrelas)
- ID_Região (FK)
- Tipo de Instalação (Grande, Pequeno, Móvel)
- Eventos Realizados (torneios, competições)
- Wi-Fi Disponível (sim/não)
- Acessibilidade (recursos para deficientes)
- Estacionamento (sim/não)
- Sala de Espera
- Banheiros
- Sistema de Senhas (sim/não)
- Tempo Médio de Espera
- Contato (telefone, e-mail)
- Página Web
- Responsável pelo Centro
- Avaliações dos Treinadores (comentários e notas)
- Serviços de Emergência (sim/não)


**Tipo**

- ID_Tipo
- Nome
- Descrição

**Habilidade**

- ID_Habilidade
- Nome
- Descrição

**Região**

- ID_Região
- Nome
- Descrição

**Natureza**

- ID_Natureza
- Nome
- Efeito

**Evolução**

- ID_Evolução
- Pokemon_Inicial (FK)
- Pokemon_Final (FK)
- Nível

**Mega Evolução**

- ID_MegaEvolução
- Pokemon_Inicial (FK)
- Pokemon_Mega (FK)
- Item_Necessário (FK)

**Espécie**

- ID_Espécie
- Nome
- Descrição

**Geração**

- ID_Geração
- Número
- Descrição

**Evento**

- ID_Evento
- Nome
- Descrição
- Data

**Ginásio**

- ID_Ginásio
- Nome
- Localização
- ID_Líder (FK)


**Líder de Ginásio**

- ID_Líder
- Nome
- ID_Personagem (FK)
- ID_Ginásio (FK)
- Tipo de Pokémon Especialidade (Fogo, Água, Planta, ...)
- Nível de Dificuldade (Iniciante, Intermediário, Avançado)
- Número de Insígnias Concedidas
- Biografia
- Estratégia de Batalha
- Número de Pokémon na Equipe
- Número de Vitórias
- Número de Derrotas
- Data de Início como Líder
- Insígnia Oferecida
- Premiação em Dinheiro
- Número de Desafios por Semana
- Horário de Funcionamento do Ginásio
- Experiência em Treinamento (anos)
- Habilidades Especiais
- Equipe Atual de Pokémon
- Região de Origem
- Itens Usados nas Batalhas
- Faixa Etária de Treinadores Permitidos


**Competição**

- ID_Competição
- Nome
- Descrição
- Data de Início
- Data de Término
- Localização
- Tipo de Competição (Torneio, Campeonato, Desafio)
- Regras Especiais
- Número de Participantes
- Inscrição Necessária (sim/não)
- Taxa de Inscrição
- Prêmio para o Vencedor
- Status (Ativa, Encerrada, Planejada)
- Nível de Dificuldade (Iniciante, Intermediário, Avançado)
- Pokémon Permitidos (Especificar tipos ou restrições)
- Formato da Competição (Eliminatória, Pontuação)
- Público Alvo (Jovens, Adultos, Todos)
- Organizadores
- Patrocinadores
- Lista de Juízes
- Histórico de Vencedores
- Número de Rodadas
- Critérios de Desempate
- Regras de Fair Play
- Tempo Máximo por Batalha
- Limite de Inscrições
- Data da Última Atualização


**Pokedex**
- ID_Pokedex
- Nome
- ID_Player (FK)
- Data de Criação
- Número de Pokémon Registrados
- Número de Pokémon Vistos
- Número de Pokémon Capturados
- Região de Cobertura (por exemplo, Kanto, Johto, etc.)
- Versão (diferentes versões podem ter diferentes layouts ou funcionalidades)
- Status de Completo (sim/não)
- Porcentagem de Completo
- Data da Última Atualização
- Tipo de Pokedex (Regional/Nacional)
- Funções Extras (Análise de Habilidades, Localização dos Pokémon)
- Nível de Detalhe (Básico, Médio, Avançado,)


**Equipe Rocket**

- ID_Membro
- Nome
- ID_Personagem (FK)

**Torneio**

- ID_Torneio
- Nome
- Descrição

**PokeMart**

- ID_PokeMart
- Nome
- Localização

**Fossil**

- ID_Fossil
- Nome
- Descrição


**Liga Pokémon**
- ID_Liga
- Nome
- Localização
- ID_Região (FK)
- Número de Insígnias Necessárias
- Data de Fundação
- Descrição
- Nome do Campeão Atual
- Recompensa em Dinheiro
- Quantidade de Experiência Ganho
- Quantidade de Insígnias Oferecidas
- Regras Especiais
- Tipo de Batalha (Single, Double, tripple, rotation, multi, battle royale, inverse battle, sky battle)
- Número de Partidas
- Dificuldade
- Status (Ativa/Inativa)
- ID_Ginásio (FK) (Referência ao ginásio associado, se tiver)
- Histórico de Campeões


**Insígnia**

- ID_Insígnia
- Nome
- Descrição

### Relacionamentos:

#### **Personagem obtém Insignia**
   - Este relacionamento indica que os personagens podem obter insígnias ao derrotar líderes de ginásio. Cada personagem pode obter várias insígnias.

####  **Personagem possui Pokemon**
   - Indica que os personagens podem possuir vários Pokémon. Um Pokémon pertence a apenas um personagem.

#### **Pokemon é capturado por Pokeball**
   - Este relacionamento representa o fato de que Pokémon são capturados usando Pokébolas. Cada Pokémon é capturado por uma Pokébola específica.

#### **Personagem Passa por Caminhos**
   - Indica que os personagens podem percorrer diferentes caminhos no mundo do jogo. Cada caminho pode ser percorrido por vários personagens.

#### **Personagem Passa por Ginásio**
   - Este relacionamento indica que os personagens podem visitar e desafiar ginásios Pokémon. Cada ginásio pode ser visitado por vários personagens.

#### **Personagem Passa por Centro Pokemon**
   - Indica que os personagens podem visitar centros Pokémon para curar seus Pokémon e obter assistência. Cada centro Pokémon pode ser visitado por vários personagens.

### Descrição Geral:

O Diagrama de Entidade-Relacionamento (DER) na sua primeira versão foi desenvolvido para capturar os principais componentes e interações do universo Pokémon. As entidades centrais incluem Pokémon, itens (como Porção e Pokébola), locais (como Ginásio e Centro Pokémon) e personagens (incluindo jogadores e NPCs). Os personagens são a entidade central do modelo, com vários relacionamentos conectando-os a outras entidades. Eles podem obter insígnias ao desafiar ginásios, possuir e capturar Pokémon usando Pokébolas, e passar por caminhos, ginásios e centros Pokémon ao longo de suas jornadas.


### Histórico de Versões

| Versão | Autor         | Descrição da Alteração                                                                                                                                      | Data       |
|--------|---------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|
| 1.0    | Todos Integrantes  | Criação da primeira versão do modelo DER. | 08/04/2024|
| 1.1    |  Arthur José  | Descricão do Artefato DER primeira versao  | 15/07/2024|
| 1.2    |  Carlos Gabriel  | Adição dos atributos das entidades  | 16/07/2024|
