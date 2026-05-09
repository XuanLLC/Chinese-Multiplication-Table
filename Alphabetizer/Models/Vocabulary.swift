import Foundation

struct Vocabulary {
    let words: [String]

    /// - returns: `count` unique, random words from `words`, guaranteed unsorted
    func 随机选取几个(count: Int) -> [String] {
        var newWords = Array(words.shuffled().prefix(count))
        while newWords.sorted() == newWords {
            newWords.shuffle()
        }
        let 先小后大 = newWords.sorted { Vocabulary.对应数[$0] ?? 0 < Vocabulary.对应数[$1] ?? 0 }
        return 先小后大
    }
    
    // Each vocabulary word should have a corresponding emoji
    
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
}

extension Vocabulary {
    static let 九宫 = Vocabulary(words: [
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
    
    static let 正体 = Vocabulary(words: [
        "壹",
        "貮",
        "叁",
        "肆",
    ])
    
    static let 三十五 = Vocabulary(words: [
        "三",
        "十",
        "五",
    ])
}
