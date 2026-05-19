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
    
    func 揭晓答案() {
        更新积输出()
        开新局()
    }

    func 准备先小后大题() {
        开新局(先小后大: false)
        更新积输出()
    }

    func 点选字卡(_ 所点字卡: 字卡) {
        let 正序字卡 = 两字卡.sorted { $0.数 < $1.数 }
        guard 正序字卡.count == 2 else {
            return
        }

        if !正序字卡[0].flipped {
            guard 所点字卡 == 正序字卡[0] else {
                return
            }
            所点字卡.flipped = true
            return
        }
        
        guard 所点字卡 == 正序字卡[1] else {
            return
        }
        所点字卡.flipped = true
        准备先小后大题()
    }

    // MARK: private implementation

    private func 更新积输出() {
        for tile in 两字卡 {
            tile.flipped = false
        }

        let 积 = 两字卡.reduce(1) { $0 * $1.数 }
        积值 = 积
        积输出 = String(积)
        积中文输出 = 积的中文(积)
    }

    private func 开新局(先小后大: Bool = true) {
        let 两数 = 数字.随机选取几个(count: 2, 先小后大: 先小后大)
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

    private func 积的中文(_ 积: Int) -> String {
        if 积 < 10 {
            return 数目字.对应字[积]!
        }

        let 个位值 = 积 % 10
        let 十位值 = (积 - 个位值)/10
        var 中文 = ""
        if 十位值 != 0 {
            中文 = 数目字.对应字[十位值]! + "十"
        }
        if 个位值 != 0 {
            中文 += 数目字.对应字[个位值]!
        }
        return 中文
    }
}
