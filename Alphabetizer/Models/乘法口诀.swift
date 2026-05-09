import Foundation

@Observable
class 乘法口诀 {
    private let 字数 = 4
    private var 数字: Vocabulary

    var tiles = [Tile]()
    var score = 0
    var message: String = ""

    init(vocab: Vocabulary = .九宫) {
        self.数字 = vocab
        开新局()
    }
    
    /// Checks if tiles are in alphabetical order
    func 揭晓答案() {
        
        var 积 = 1
        // Flip tiles back to words
        for tile in tiles {
            tile.flipped = false
            //print(tile.数)
            积 = 积 * (tile.数)
            //print("积："+String(积))
        }

        // 恢复指令 Display instructions
        message = String(积)

        开新局()
    }
    // MARK: private implementation

    /// Updates `tiles` with a new set of unalphabetized words
    private func 开新局() {
        let 两数 = 数字.随机选取几个(count: 2)
        if tiles.isEmpty {
            for word in 两数 {
                tiles.append(Tile(word: word))
            }
        } else {
            // Assign new words to existing tiles
            for (tile, word) in zip(tiles, 两数) {
                tile.word = word
                tile.数 = Vocabulary.对应数[word] ?? 0
            }
        }
    }
}
