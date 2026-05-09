import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 15) {
            //ScoreView()
            MessageView()
            Spacer()
            WordCanvas()
            Spacer()
            SubmitButton()
        }
        .padding(.top, 60)
    }
}

#Preview {
    ContentView()
        .environment(乘法口诀())
}
