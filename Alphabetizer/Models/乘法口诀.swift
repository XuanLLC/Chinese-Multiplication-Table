import Foundation

@Observable
class 乘法口诀 {
    private var 数字: 数目字
    private var 九宫点选积 = 1
    private var 九宫点选数 = 0
    private var 方阵已选字卡 = [字卡]()
    private var 方阵有效线 = [[字卡]]()

    var 两字卡 = [字卡]()
    var 九字卡 = [字卡]()
    var 方阵字卡 = [字卡]()
    var 积值: Int = 0
    var 积输出: String = ""
    var 积中文输出: String = ""

    init(vocab: 数目字 = .九宫) {
        self.数字 = vocab
        准备九字卡()
        开新局()
    }

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

    func 准备九宫题() {
        开新局(显示积: true, 随机顺序: true)
        重置九宫点选()
    }

    func 点选九宫字卡(_ 所点字卡: 字卡) {
        let 新积 = 九宫点选积 * 所点字卡.数
        if 积值 % 新积 == 0 {
            接受九宫点选(所点字卡, 新积: 新积)
            return
        }

        重置九宫点选()
        if 积值 % 所点字卡.数 == 0 {
            接受九宫点选(所点字卡, 新积: 所点字卡.数)
        }
    }

    func 准备方阵题() {
        let 可用字 = 数目字.十以内.words
        方阵字卡 = (0..<25).map { _ in
            字卡(word: 可用字.randomElement()!)
        }

        let 口诀序列 = 方阵口诀序列().randomElement()!
        let 放置方式 = 方阵可放位置(长度: 口诀序列.count).randomElement()!

        for (offset, 字) in 口诀序列.enumerated() {
            let 行 = 放置方式.行 + 放置方式.行向 * offset
            let 列 = 放置方式.列 + 放置方式.列向 * offset
            let 字卡 = 方阵字卡[方阵索引(行: 行, 列: 列)]
            字卡.字 = 字
            字卡.数 = 数目字.对应数[字] ?? 0
        }

        更新方阵有效线()
        重置方阵点选()
    }

    func 点选方阵字卡(_ 所点字卡: 字卡) {
        if 所点字卡.flipped {
            return
        }

        方阵已选字卡.append(所点字卡)
        if 方阵已选为有效前缀 {
            所点字卡.flipped = true
            if 方阵已选为完整答案 {
                准备方阵题()
            }
            return
        }

        重置方阵点选()
        方阵已选字卡 = [所点字卡]
        if 方阵已选为有效前缀 {
            所点字卡.flipped = true
        } else {
            方阵已选字卡.removeAll()
        }
    }

    // MARK: private implementation

    private func 准备九字卡() {
        九字卡 = 数目字.九宫.words.map { 字卡(word: $0) }
    }

    private func 更新积输出() {
        var 积 = 1
        for tile in 两字卡 {
            积 = 积 * tile.数
        }
        积值 = 积
        积输出 = String(积)
        积中文输出 = 积的中文(积)
    }

    private func 重置九宫点选() {
        九宫点选积 = 1
        九宫点选数 = 0
        for tile in 九字卡 {
            tile.flipped = false
        }
    }

    private func 接受九宫点选(_ 所点字卡: 字卡, 新积: Int) {
        九宫点选积 = 新积
        九宫点选数 += 1
        所点字卡.flipped = true

        if 九宫点选积 == 积值 && 九宫点选数 >= 2 {
            准备九宫题()
        }
    }

    private var 方阵已选为有效前缀: Bool {
        方阵有效线.contains { 线 in
            guard 方阵已选字卡.count <= 线.count else {
                return false
            }
            return Array(线.prefix(方阵已选字卡.count)) == 方阵已选字卡
        }
    }

    private var 方阵已选为完整答案: Bool {
        方阵有效线.contains { 线 in
            线 == 方阵已选字卡
        }
    }

    private func 重置方阵点选() {
        方阵已选字卡.removeAll()
        for tile in 方阵字卡 {
            tile.flipped = false
        }
    }

    private func 更新方阵有效线() {
        let 所有口诀序列 = 方阵口诀序列()
        var 新有效线 = [[字卡]]()

        for 序列 in 所有口诀序列 {
            for 放置方式 in 方阵可放位置(长度: 序列.count) {
                let 线 = (0..<序列.count).map { offset in
                    let 行 = 放置方式.行 + 放置方式.行向 * offset
                    let 列 = 放置方式.列 + 放置方式.列向 * offset
                    return 方阵字卡[方阵索引(行: 行, 列: 列)]
                }
                if zip(线, 序列).allSatisfy({ $0.字 == $1 }) {
                    新有效线.append(线)
                }
            }
        }

        方阵有效线 = 新有效线.shuffled()
    }

    private func 方阵口诀序列() -> [[String]] {
        var 序列 = [[String]]()
        for 甲 in 1...9 {
            for 乙 in 1...9 {
                let 积 = 甲 * 乙
                var 标准序列 = [数目字.对应字[甲]!, 数目字.对应字[乙]!]
                标准序列.append(contentsOf: 方阵积字(积))
                序列.append(标准序列)

                if let 省十序列 = 方阵省十积字(积) {
                    序列.append([数目字.对应字[甲]!, 数目字.对应字[乙]!] + 省十序列)
                }
            }
        }
        return 序列
    }

    private func 方阵积字(_ 积: Int) -> [String] {
        if 积 <= 10 {
            return [数目字.对应字[积]!]
        }

        let 十位值 = 积 / 10
        let 个位值 = 积 % 10
        var 中文 = [String]()
        if 十位值 > 1 {
            中文.append(数目字.对应字[十位值]!)
        }
        中文.append("十")
        if 个位值 > 0 {
            中文.append(数目字.对应字[个位值]!)
        }
        return 中文
    }

    private func 方阵省十积字(_ 积: Int) -> [String]? {
        let 十位值 = 积 / 10
        let 个位值 = 积 % 10
        guard 十位值 >= 2 && 个位值 > 0 else {
            return nil
        }
        return [数目字.对应字[十位值]!, 数目字.对应字[个位值]!]
    }

    private func 方阵可放位置(长度: Int) -> [(行: Int, 列: Int, 行向: Int, 列向: Int)] {
        let 方向 = [
            (-1, -1), (-1, 0), (-1, 1),
            (0, -1),           (0, 1),
            (1, -1),  (1, 0),  (1, 1),
        ]

        var 位置 = [(行: Int, 列: Int, 行向: Int, 列向: Int)]()
        for 行 in 0..<5 {
            for 列 in 0..<5 {
                for (行向, 列向) in 方向 {
                    let 末行 = 行 + 行向 * (长度 - 1)
                    let 末列 = 列 + 列向 * (长度 - 1)
                    if (0..<5).contains(末行), (0..<5).contains(末列) {
                        位置.append((行, 列, 行向, 列向))
                    }
                }
            }
        }
        return 位置
    }

    private func 方阵索引(行: Int, 列: Int) -> Int {
        行 * 5 + 列
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
