import Foundation

struct Vocabulary {
    let words: [String]

    /// - returns: `count` unique, random words from `words`, guaranteed unsorted
    func 随机选取几个(count: Int) -> [String] {
        var newWords = Array(words.shuffled().prefix(count))
        while newWords.sorted() == newWords {
            newWords.shuffle()
        }
        return newWords
    }
    
    // Each vocabulary word should have a corresponding emoji
    static let icons: [String: String] = [
        "Bear": "🐻",
        "Crab": "🦀",
        "Duck": "🦆",
        "Frog": "🐸",
        "Fox": "🦊",
        "Goose": "🪿",
        "Horse": "🐴",
        "Jellyfish": "🪼",
        "Lizard": "🦎",
        "Octopus": "🐙",
        "Panda": "🐼",
        "Rabbit": "🐰",
        "Sheep": "🐑",
        "Whale": "🐳",
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
