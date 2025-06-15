# Poke Explorer

Poke Explorer é um aplicativo iOS desenvolvido com SwiftUI que permite explorar Pokémons, visualizar detalhes e favoritar seus preferidos. O app também armazena os Pokémons favoritos localmente utilizando Core Data.

## Desenvolvedoras
- Karen Ubial
- Helena Carvalho

## Vídeo de Apresentação

https://youtu.be/N3pwmJlltOw 

## Tecnologias Utilizadas

- **Swift**
- **SwiftUI**
- **Combine**
- **Core Data**
- **PokeAPI** – [https://pokeapi.co](https://pokeapi.co)

## Funcionalidades

- 🔍 Lista de Pokémons com imagens.
- 📄 Tela de detalhes com mais informações do Pokémon.
- ⭐ Favoritar e **desfavoritar** Pokémons com animação.
- 💾 Armazenamento local dos favoritos com Core Data.
- 👤 Associação de favoritos por usuário (relacionamento entre entidades no Core Data).

## Arquitetura

O app segue o padrão MVVM (Model-View-ViewModel), com os seguintes componentes principais:

- `PokemonAPIService.swift`: Responsável pelas chamadas HTTP para a PokeAPI.
- `DetalhesPokemonViewModel.swift`: Gerencia o estado da tela de detalhes.
- `FavoritosViewModel.swift`: Gerencia os dados da tela de favoritos.
- `FavoritoService.swift`: Gerencia a persistência de dados com Core Data.
- `Usuario`: Entidade que representa o usuário no Core Data.
- `Favorito`: Entidade que representa os Pokémons favoritados.


