import Foundation

struct 数目字 {
    let words: [String]

    /// - returns: `count` unique, random words from `words`, guaranteed unsorted
    func 随机选取几个(count: Int) -> [String] {
        var newWords = Array(words.shuffled().prefix(count))
        while newWords.sorted() == newWords {
            newWords.shuffle()
        }
        let 先小后大 = newWords.sorted { 数目字.对应数[$0] ?? 0 < 数目字.对应数[$1] ?? 0 }
        return 先小后大
    }
    
    static let 对应数: [String: Int] = [
        "一": 1,
        "二": 2,
        "三": 3,
        "四": 4,
        "五": 5,
        "六": 6,
        "七": 7,
        "八": 8,
        "九": 9,
    ]

    static let 对应字: [Int: String] = [
        1: "一",
        2: "二",
        3: "三",
        4: "四",
        5: "五",
        6: "六",
        7: "七",
        8: "八",
        9: "九",
    ]
}

extension 数目字 {
    static let 九宫 = 数目字(words: [
        "一",
        "二",
        "三",
        "四",
        "五",
        "六",
        "七",
        "八",
        "九",
    ])
    
    static let 正体 = 数目字(words: [
        "壹",
        "貮",
        "叁",
        "肆",
    ])
    
    static let 三十五 = 数目字(words: [
        "三",
        "十",
        "五",
    ])
}
