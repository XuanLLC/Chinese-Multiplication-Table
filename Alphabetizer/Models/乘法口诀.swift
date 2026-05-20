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
        更新积输出()
        开新局()
    }

    func 开新局(显示积: Bool = false, 随机顺序: Bool = false) {
        var 两数 = 数字.随机选取几个(count: 2)
        if 随机顺序 {
            两数.shuffle()
        }
        if 两字卡.isEmpty {
            for word in 两数 {
                两字卡.append(字卡(word: word))
            }
        } else {
            // Assign new words to existing tiles
            for (tile, word) in zip(两字卡, 两数) {
                tile.字 = word
                tile.数 = 数目字.对应数[word] ?? 0
                tile.flipped = false
            }
        }
        if 显示积 {
            更新积输出()
        }
    }

    func 按先小后大点击(_ 字卡: 字卡) {
        if 字卡.flipped {
            return
        }

        let 已点击数 = 两字卡.filter { $0.flipped }.count
        let 正确顺序 = 两字卡.sorted { $0.数 < $1.数 }
        if 正确顺序[已点击数] == 字卡 {
            字卡.flipped = true
            if 两字卡.allSatisfy({ $0.flipped }) {
                开新局(显示积: true, 随机顺序: true)
            }
        } else {
            两字卡.forEach { $0.flipped = false }
        }
    }

    // MARK: private implementation

    private func 更新积输出() {
        var 积 = 1
        for tile in 两字卡 {
            积 = 积 * tile.数
        }
        积值 = 积
        积输出 = String(积)
        积中文输出 = ""

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
    }
}
