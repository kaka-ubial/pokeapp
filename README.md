# 🧭 Poke Explorer

O **Poke Explorer** é um aplicativo iOS criado com **SwiftUI** que permite ao usuário explorar Pokémons através da [PokeAPI](https://pokeapi.co), visualizar detalhes individuais e favoritar seus preferidos. Os dados dos favoritos são armazenados localmente usando **Core Data** com autenticação básica por usuário.

---

## Desenvolvedoras

- Karen Ubial
- Helena Carvalho

---

## Vídeo de Apresentação

https://youtu.be/N3pwmJlltOw

## 📱 Descrição Geral do Aplicativo

- Listagem dos Pokémons obtidos da PokeAPI.
- Visualização de detalhes de cada Pokémon.
- Funcionalidade de favoritar/desfavoritar Pokémons.
- Armazenamento dos favoritos por usuário com Core Data.
- Interface amigável, minimalista e com animações sutis ao favoritar/desfavoritar.

---

## 🌐 Escolha da API

### API Utilizada

[PokeAPI](https://pokeapi.co)

### Justificativa

- Gratuita, pública e sem autenticação.
- Ricamente documentada.
- Retorna dados relevantes: nome, ID, sprites (imagens), tipos, etc.

### Como foi usada

- `https://pokeapi.co/api/v2/pokemon?limit=50`: lista básica.
- `https://pokeapi.co/api/v2/pokemon/{nome}`: detalhes do Pokémon.

### Dados utilizados

- Nome
- ID
- Imagem (`sprites.front_default`)
- Tipos
- Altura, peso e outros atributos (em tela de detalhes)

---

## 🧱 Arquitetura do Aplicativo

O aplicativo segue a arquitetura **MVVM (Model - View - ViewModel)**:

```plaintext
+-------------------+      +---------------------------+      +----------------------------+
|      View         | ---> |        ViewModel          | ---> |           Model           |
| SwiftUI Screens   |      | Lógica de negócio e dados |      | API, CoreData, DTOs       |
+-------------------+      +---------------------------+      +----------------------------+
