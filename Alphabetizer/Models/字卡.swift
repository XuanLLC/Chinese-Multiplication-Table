import Foundation

@Observable
class 字卡: Identifiable {
    let id = UUID()

    var 字: String
    var 数: Int
    var position: CGPoint = .zero
    // When flipped, show a checkmark instead of the word and icon
    var flipped = false

    init(word: String) {
        self.字 = word
        self.数 = 数目字.对应数[word] ?? 0
    }
}

extension 字卡: Equatable {
    static func == (lhs: 字卡, rhs: 字卡) -> Bool {
        lhs.id == rhs.id
    }
}
