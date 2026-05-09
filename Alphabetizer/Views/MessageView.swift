import SwiftUI

struct MessageView: View {
    @Environment(乘法口诀.self) private var alphabetizer

    var body: some View {
        Text(alphabetizer.积输出)
            .font(.largeTitle)
    }
}

#Preview {
    let alphabetizer = 乘法口诀()
    alphabetizer.积输出 = "23"
    return MessageView()
        .environment(alphabetizer)
}
