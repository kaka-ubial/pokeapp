import SwiftUI

struct ContentView: View {
    @State private var usuarioLogado: Usuario?

    var body: some View {
        NavigationStack {
            if usuarioLogado != nil {
                TabBarView(usuarioLogado: $usuarioLogado)
            } else {
                LoginView(usuarioLogado: $usuarioLogado)
            }
        }
    }
}
