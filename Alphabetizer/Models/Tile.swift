import Foundation

@Observable
class Tile: Identifiable {
    let id = UUID()

    var word: String
    var 简体: String
    var 数: Int
    var position: CGPoint = .zero
    // When flipped, show a checkmark instead of the word and icon
    var flipped = false

    init(word: String, 简体: String, 数: Int) {
        self.word = word
        self.简体 = 简体
        self.数 = 数
    }

    var icon: String {
        Vocabulary.icons[word] ?? "🤷"
    }
}

extension Tile: Equatable {
    static func == (lhs: Tile, rhs: Tile) -> Bool {
        lhs.id == rhs.id
    }
}
