import SwiftUI

enum DesignTokens {
    
    // Cores
    enum Colors {
        static let primary = Color("Primary") // Adicione ao Assets.xcassets
        static let secondary = Color("Secondary")
        static let background = Color(.systemGroupedBackground)
        static let text = Color.primary
        static let highlight = Color.orange
    }

    // Fontes
    enum Fonts {
        static let title = Font.system(size: 24, weight: .bold)
        static let subtitle = Font.system(size: 18, weight: .semibold)
        static let body = Font.system(size: 16)
        static let caption = Font.system(size: 14)
    }

    // Espaçamento
    enum Spacing {
        static let small: CGFloat = 8
        static let medium: CGFloat = 16
        static let large: CGFloat = 24
    }

    // Borda e canto
    enum Shape {
        static let cornerRadius: CGFloat = 12
        static let borderWidth: CGFloat = 2
    }
}
