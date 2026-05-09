import SwiftUI

struct ScoreView: View {
    @Environment(乘法口诀.self) private var alphabetizer

    var body: some View {
        Text("Score: \(alphabetizer.score)")
            .font(.largeTitle)
            .foregroundStyle(Color.purple)
            .bold()
    }
}

#Preview {
    ScoreView()
        .environment(乘法口诀())
}
