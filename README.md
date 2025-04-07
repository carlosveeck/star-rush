# 🌟 Star Rush

**Star Rush** é um jogo que mistura a dinâmica clássica de **jogo da memória** com a adrenalina de uma **corrida contra o tempo**. Desenvolvido com **Godot Engine**, o jogo desafia sua memória, reflexos e estratégia em um tabuleiro colorido cheio de surpresas e armadilhas!

![Star Rush](https://github.com/user-attachments/assets/0b5d4cd6-56b8-4e5e-acb6-7db1e333eaf1)

## História

No reino de Aurora, Sirius e sua irmã Luma eram guardiões das Chamas de Cor, fragmentos mágicos que mantêm o mundo vibrante. 

Porém, o Vazio Cinzento invadiu Aurora e apagou suas cores, separando os irmãos e levando Luma para um lugar distante. 

Agora, Sirius deve embarcar em uma jornada para recuperar as Chaves de Luz que restaurarão as cores do mundo e permitirão que ele reencontre sua irmã. 

Acompanhado por Clari, uma estrela mágica que Luma deixou para ele, Sirius precisa enfrentar desafios enquanto busca por essas chaves e traz de volta a luz à Aurora.

---

## Estrutura do Projeto

```bash
 StarRush.exe               # Executável do jogo (Windows)
 StarRush.pck               # Pacote de recursos do jogo
 project.godot              # Arquivo do projeto Godot
 main.gd, hud.gd, coin.gd   # Scripts principais em GDScript
 *.tscn                     # Cenas do jogo (Godot)
 assets (imagens, músicas)
```

---

## Mecânicas de Jogo

- 🧩 **Memória visual**: Explore e memorize as cores escondidas no tabuleiro.
- 🎯 **Objetivo surpresa**: Uma cor-alvo é revelada, encontre-a com rapidez.
- 💣 **Tiles-bomba**: Erros custam caro! Evite as armadilhas escondidas.
- ⏰ **Corrida contra o tempo**: O tempo diminui a cada rodada.
- 🌟 **Colete estrelas e moedas**: Ganhe mais pontos (e arrisque mais!).

---

## 🕹️ Controles

| Ação            | Tecla           |
|-----------------|-----------------|
| Mover           | Setas / WASD    |
| Selecionar Tile | Espaço / Enter  |
| Pausar/Menu     | ESC             |

---

## 🚀 Como Jogar

1. **Inicie o jogo**: Rode `StarRush.exe` ou abra o projeto no Godot com `project.godot`.
2. **Descubra o Tabuleiro**: Revele cores ao andar sobre os tiles.
3. **Aguarde a cor-alvo**: Memorize o caminho certo!
4. **Escolha com Sabedoria**: Encontre o tile com a cor-alvo.
5. **Evite as Bombas**: Um erro pode acabar com sua rodada!
6. **Colete Recompensas**: Pegue moedas e estrelas para aumentar sua pontuação.

![Star Rush 2](https://github.com/user-attachments/assets/18b33015-45be-4794-823e-730355a62a6f)

---
## 🛠️ Desenvolvimento
Scripts principais incluem:

- `main.gd`: lógica central do jogo
- `global_color.gd`: gerenciamento de cores
- `coin_manager.gd`: lógica de moedas e coleta
- `startgame.tscn`: cena inicial
- `chosen_color.tscn`: cena de escolha da cor

---

## 📥 Como Executar

### Modo Jogador (Windows)
1. Vá até `starrush/`
2. Clique duas vezes em `StarRush.exe`
3. Divirta-se!

### Modo Desenvolvedor (Godot)
1. Abra o Godot Engine
2. Selecione `starrush/project.godot`
3. Execute ou edite como quiser

---

**Prepare-se para desafiar sua memória entre estrelas e explosões! ✨💣**
