import SwiftUI

struct 积视界: View {
    @Environment(乘法口诀.self) private var alphabetizer
    private var 中文: Bool = false

    init(中文 : Bool) {
        self.中文 = 中文
    }

    var body: some View {
        if self.中文 {
            Text(alphabetizer.积中文输出)
                .font(.largeTitle)
        } else {
            Text(alphabetizer.积输出)
                .font(.largeTitle)
        }
    }
}

#Preview {
    let alphabetizer = 乘法口诀()
    alphabetizer.积输出 = "23"
    return 积视界(中文: false)
        .environment(alphabetizer)
}
