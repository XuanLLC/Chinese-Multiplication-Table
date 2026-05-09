import Foundation

@Observable
class Alphabetizer {
    private let 字数 = 4
    private var 数字: Vocabulary

    var tiles = [Tile]()
    var score = 0
    var message: String = ""

    init(vocab: Vocabulary = .正体) {
        self.数字 = vocab
        开新局()
    }
    
    /// Checks if tiles are in alphabetical order
    func 揭晓答案() {
        // Check if the tiles are alphabetized
        let userSortedTiles = tiles.sorted {
            $0.position.x < $1.position.x
        }
        let alphabeticallySortedTiles = tiles.sorted {
            $0.word.lexicographicallyPrecedes($1.word)
        }
        let isAlphabetized = userSortedTiles == alphabeticallySortedTiles

        // If alphabetized, increment the score
        if isAlphabetized {
            score += 1
        }
        
        // Update the message to win or lose
        message = "333"
        
        // Flip over correct tiles
        for (tile, correctTile) in zip(userSortedTiles, alphabeticallySortedTiles) {
            let tileIsAlphabetized = tile == correctTile
            tile.flipped = tileIsAlphabetized
        }
        
        Task { @MainActor in
            // Delay 2 seconds
            try await Task.sleep(for: .seconds(2))
            
            // If alphabetized, generate new tiles
            var 积 = 1
            if isAlphabetized {
                积 = 开新局()
            }

            // Flip tiles back to words
            for tile in tiles {
                tile.flipped = false
            }

            // 恢复指令 Display instructions
            message = String(积)
        }
        
    }
    // MARK: private implementation

    /// Updates `tiles` with a new set of unalphabetized words
    private func 开新局() -> Int {
        let 两数 = 数字.随机选取几个(count: 2)
        if tiles.isEmpty {
            var 积 = 1
            for word in 两数 {
                var 简体 = "一"
                var 数 = 1
                if word == "貮" {
                    简体 = "二"
                    数 = 2
                } else if word == "叁" {
                    简体 = "三"
                    数 = 3
                } else if word == "肆" {
                    简体 = "四"
                    数 = 4
                }
                tiles.append(Tile(word: word, 简体: 简体, 数: 数))
                积 = 积 * 数
            }
            return 积
        } else {
            // Assign new words to existing tiles
            var 积 = 1
            for (tile, word) in zip(tiles, 两数) {
                tile.word = word
                积 = 积 * tile.数
            }
            return 积
        }
    }
}
