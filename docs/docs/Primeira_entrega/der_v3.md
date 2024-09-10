

# **Descrição do Artefato DER - Terceira Versão**

## DER:

![Image](der_v3.png)

## Principais Alterações

- Melhor organização do Diagrama e geral
- Substituicao de algumas entidades para melhorar a regra de negocio do jogo.
- Remoção de algumas entidades que nao se adequaram ao contexto (Evento, Regiao, Caminho)
- Organizar e revisar Cardinalidades.

<details>
    <summary><strong>Entidades e Atributos</strong></summary>
    <ul class="relationship-list">
        <li>
            <details>
                <summary><strong>Efetividade</strong></summary>
                <ul class="attribute-list">
                    <li>ID_Efetividade</li>
                    <li>Veneno</li>
                    <li>Terra</li>
                    <li>Normal</li>
                    <li>Voador</li>
                    <li>Fogo</li>
                    <li>Psiquico</li>
                    <li>Agua</li>
                    <li>Inseto</li>
                    <li>Eletrico</li>
                    <li>Pedra</li>
                    <li>Grama</li>
                    <li>Fantasma</li>
                    <li>Gelo</li>
                    <li>Dragao</li>
                    <li>Lutador</li>
                    <li>Fada</li>
                    <li>Aco</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Pokedex</strong></summary>
                <ul class="attribute-list">
                    <li>ID_Pokedex</li>
                    <li>Numero_Pokemons</li>
                    <li>Numero_Pokemons_Vistos</li>
                    <li>Numero_Pokemons_Capturados</li>
                    <li>Status_Completa</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Personagem</strong></summary>
                <ul class="attribute-list">
                    <li>ID_Personagem</li>
                    <li>Nome</li>
                    <li>Pokebolas_Normais</li>
                    <li>Pokebolas_Greats</li>
                    <li>Pokebolas_Ultras</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Rota</strong></summary>
                <ul class="attribute-list">
                    <li>ID_Rota</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Pokebola</strong></summary>
                <ul class="attribute-list">
                    <li>ID_Pokebola</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Pokeball_Normal</strong></summary>
                <ul class="attribute-list">
                    <li>Chance_Captura</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Pokeball_Great</strong></summary>
                <ul class="attribute-list">
                    <li>Chance_Captura</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Pokeball_Ultra</strong></summary>
                <ul class="attribute-list">
                    <li>Chance_Captura</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Batalha</strong></summary>
                <ul class="attribute-list">
                    <li>ID_Batalha</li>
                    <li>Exp</li>
                    <li>Resultado</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Lider</strong></summary>
                <ul class="attribute-list">
                    <li>ID_Lider</li>
                    <li>Nome</li>
                    <li>Biografia</li>
                    <li>Vendido_Por_Personagem</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Ginasio</strong></summary>
                <ul class="attribute-list">
                    <li>ID_Ginasio</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Insignia</strong></summary>
                <ul class="attribute-list">
                    <li>ID_Insignia</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Liga Pokemon</strong></summary>
                <ul class="attribute-list">
                    <li>ID_Liga</li>
                    <li>Descricao</li>
                    <li>Numero_Insignias_Necessarias</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Cidade</strong></summary>
                <ul class="attribute-list">
                    <li>ID_Cidade</li>
                    <li>Possui_Pokecenter</li>
                    <li>Possui_Pokemarket</li>
                    <li>Possui_Ginasio</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Encontro</strong></summary>
                <ul class="attribute-list">
                    <li>ID_Encontro</li>
                    <li>Capturado</li>
                    <li>Derrotado</li>
                    <li>Correu</li>
                    <li>Perdeu</li>
                    <li>Experiencia</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Captura</strong></summary>
                <ul class="attribute-list">
                    <li>ID_Captura</li>
                    <li>Experiencia</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Pokemon</strong></summary>
                <ul class="attribute-list">
                    <li>ID_Pokemon</li>
                    <li>Defesa_Especial</li>
                    <li>Nome</li>
                    <li>Velocidade</li>
                    <li>HP</li>
                    <li>Nivel</li>
                    <li>Experiencia</li>
                    <li>Ataque_Especial</li>
                    <li>Defesa</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Tipo</strong></summary>
                <ul class="attribute-list">
                    <li>ID_Tipo</li>
                    <li>Eficiencia</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Ataque</strong></summary>
                <ul class="attribute-list">
                    <li>ID_Ataque</li>
                    <li>Dano</li>
                </ul>
            </details>
        </li>
    </ul>
</details>

</body>
</html>


<details>
    <summary><strong>Relacionamentos</strong></summary>
    <ul class="relationship-list">
        <li>
            <details>
                <summary><strong>Preenche</strong></summary>
                <p><strong>Descrição:</strong> O relacionamento indica que a Pokedex é preenchida por Pokemons capturados ou vistos pelo Personagem.</p>
                <p><strong>Cardinalidade:</strong></p>
                <ul>
                    <li>Pokedex (1) - Preenche (0..n)</li>
                    <li>Personagem (0..n) - Preenche (1)</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Passa por</strong></summary>
                <p><strong>Descrição:</strong> O relacionamento indica que o Personagem passa por diversas Rotas.</p>
                <p><strong>Cardinalidade:</strong></p>
                <ul>
                    <li>Personagem (1) - Passa por (0..n)</li>
                    <li>Rota (0..n) - Passa por (1)</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Leva A</strong></summary>
                <p><strong>Descrição:</strong> O relacionamento indica que a Rota pode levar a outra Rota.</p>
                <p><strong>Cardinalidade:</strong></p>
                <ul>
                    <li>Rota (0..1) - Leva A (0..n)</li>
                    <li>Rota (0..n) - Leva A (0..1)</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Lança</strong></summary>
                <p><strong>Descrição:</strong> O relacionamento indica que o Personagem lança uma Pokebola para capturar um Pokemon.</p>
                <p><strong>Cardinalidade:</strong></p>
                <ul>
                    <li>Personagem (0..n) - Lança (0..n)</li>
                    <li>Pokebola (0..n) - Lança (0..1)</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Surge</strong></summary>
                <p><strong>Descrição:</strong> O relacionamento indica que um Encontro surge em uma Rota.</p>
                <p><strong>Cardinalidade:</strong></p>
                <ul>
                    <li>Encontro (0..n) - Surge (0..1)</li>
                    <li>Rota (0..n) - Surge  (0..1)</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Encontra</strong></summary>
                <p><strong>Descrição:</strong> O relacionamento indica que o Personagem encontra um Pokemon em um Encontro.</p>
                <p><strong>Cardinalidade:</strong></p>
                <ul>
                    <li>Personagem (0..1) - Encontra (0..n)</li>
                    <li>Encontro (0..n) - Encontra (0..1)</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Captura</strong></summary>
                <p><strong>Descrição:</strong> O relacionamento indica que um Personagem pode capturar um Pokemon durante um Encontro.</p>
                <p><strong>Cardinalidade:</strong></p>
                <ul>
                    <li>Captura (0..n) - Captura (0..1)</li>
                    <li>Encontro (0..1) - Captura (0..n)</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Batalha</strong></summary>
                <p><strong>Descrição:</strong> O relacionamento indica que o Personagem batalha contra o Lider de um Ginasio.</p>
                <p><strong>Cardinalidade:</strong></p>
                <ul>
                    <li>Batalha (0..n) - Batalha (1..1)</li>
                    <li>Lider (1..1) - Batalha (0..n)</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Entrega Insígnia</strong></summary>
                <p><strong>Descrição:</strong> O relacionamento indica que após uma batalha, um Lider pode entregar uma Insignia ao Personagem.</p>
                <p><strong>Cardinalidade:</strong></p>
                <ul>
                    <li>Lider (1..1) - Entrega Insígnia (0..n)</li>
                    <li>Personagem (0..n) - Entrega Insígnia (1..1)</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Lidera</strong></summary>
                <p><strong>Descrição:</strong> O relacionamento indica que um Lider lidera um Ginasio.</p>
                <p><strong>Cardinalidade:</strong></p>
                <ul>
                    <li>Lider (1..1) - Lidera (1..1)</li>
                    <li>Ginasio (1..1) - Lidera (1..1)</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Detém</strong></summary>
                <p><strong>Descrição:</strong> O relacionamento indica que um Ginasio detém uma Insignia.</p>
                <p><strong>Cardinalidade:</strong></p>
                <ul>
                    <li>Ginasio (1..1) - Detém (0..n)</li>
                    <li>Insignia (0..n) - Detém (1..1)</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Pertence</strong></summary>
                <p><strong>Descrição:</strong> O relacionamento indica que um Ginasio pertence a uma Liga Pokemon.</p>
                <p><strong>Cardinalidade:</strong></p>
                <ul>
                    <li>Ginasio (1..1) - Pertence (0..n)</li>
                    <li>Liga Pokemon (1..n) - Pertence (1..1)</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Hospeda</strong></summary>
                <p><strong>Descrição:</strong> O relacionamento indica que uma Cidade hospeda um Ginasio, Pokecenter e Pokemarket.</p>
                <p><strong>Cardinalidade:</strong></p>
                <ul>
                    <li>Cidade (0..1) - Hospeda (0..n)</li>
                    <li>Ginasio (0..1) - Hospeda (0..1)</li>
                    <li>Pokecenter (0..1) - Hospeda (0..1)</li>
                    <li>Pokemarket (0..1) - Hospeda (0..1)</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>É</strong></summary>
                <p><strong>Descrição:</strong> O relacionamento indica que um Pokemon possui um ou mais Tipos.</p>
                <p><strong>Cardinalidade:</strong></p>
                <ul>
                    <li>Pokemon (1..n) - É (1..1)</li>
                    <li>Tipo (1..1) - É (0..n)</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Tem</strong></summary>
                <p><strong>Descrição:</strong> O relacionamento indica que um Pokemon tem um ou mais Ataques.</p>
                <p><strong>Cardinalidade:</strong></p>
                <ul>
                    <li>Pokemon (1..n) - Tem (0..n)</li>
                    <li>Ataque (1..1) - Tem (0..n)</li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><strong>Possui</strong></summary>
                <p><strong>Descrição:</strong> O relacionamento indica que um Tipo possui uma ou mais Efetividades.</p>
                <p><strong>Cardinalidade:</strong></p>
                <ul>
                    <li>Tipo (1..1) - Possui (1..1)</li>
                    <li>Efetividade (1..1) - Possui (0..n)</li>
                </ul>
            </details>
        </li>
    </ul>
</details>

</body>
</html>

### Descrição Geral:

O Diagrama de Entidade-Relacionamento (DER) na sua primeira versão foi desenvolvido para capturar os principais componentes e interações do universo Pokémon. As entidades centrais incluem Pokemon, objetos (como insignia e Pokebola), locais (como Ginásio e Cidade) e personagens. Os personagens são a entidade central do modelo, com vários relacionamentos conectando-os a outras entidades. Eles podem obter insígnias ao desafiar ginásios, possuir e capturar Pokemons usando Pokebolas, e passar por rotas e ginásios ao longo de suas jornadas.

### Histórico de Versões

| Versão | Autor         | Descrição da Alteração                                                                                                                                      | Data       |
|--------|---------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|
| 1.0    | Todos Integrantes  | Criação da segunda versão do modelo DER. | 21/07/2024|
| 1.1    |  Carlos Gabriel  | Descricão do Artefato DER terceira versão  | 21/07/2024|
| 1.1    | Todos Integrantes | Revisão e Pequenas alteracoes no Der v3. | 22/07/2024|
