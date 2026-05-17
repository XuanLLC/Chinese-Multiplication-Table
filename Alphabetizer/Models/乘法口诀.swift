import Foundation

@Observable
class 乘法口诀 {
    private var 数字: 数目字

    var 两字卡 = [字卡]()
    var 积值: Int = 0
    var 积输出: String = ""
    var 积中文输出: String = ""

    init(vocab: 数目字 = .九宫) {
        self.数字 = vocab
        开新局()
    }
    
    /// Checks if tiles are in alphabetical order
    func 揭晓答案() {
        
        var 积 = 1
        for tile in 两字卡 {
            tile.flipped = false
            //print(tile.数)
            积 = 积 * (tile.数)
            //print("积："+String(积))
        }
        积值 = 积
        积输出 = String(积)

        if 积 < 10 {
            积中文输出 = 数目字.对应字[积]!
        } else {
            let 个位值 = 积值 % 10
            let 十位值 = (积值 - 个位值)/10
            if 十位值 != 0 {
                积中文输出 = 数目字.对应字[十位值]! + "十"
            }
            if 个位值 != 0 {
                积中文输出 += 数目字.对应字[个位值]!
            }
        }
        开新局()
    }
    // MARK: private implementation

    private func 开新局() {
        let 两数 = 数字.随机选取几个(count: 2)
        if 两字卡.isEmpty {
            for word in 两数 {
                两字卡.append(字卡(word: word))
            }
        } else {
            // Assign new words to existing tiles
            for (tile, word) in zip(两字卡, 两数) {
                tile.字 = word
                tile.数 = 数目字.对应数[word] ?? 0
            }
        }
    }
}
