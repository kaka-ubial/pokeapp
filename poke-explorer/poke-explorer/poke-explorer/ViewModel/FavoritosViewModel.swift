import Foundation

class FavoritosViewModel: ObservableObject {
    @Published var favoritos: [Favorito] = []
    
    func carregarFavoritos(usuario: Usuario) {
        favoritos = FavoritoService.shared.buscarFavoritos(usuario: usuario)
    }
}
