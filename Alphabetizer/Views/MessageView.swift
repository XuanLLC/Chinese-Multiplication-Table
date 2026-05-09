import SwiftUI

struct MessageView: View {
    @Environment(Alphabetizer.self) private var alphabetizer

    var body: some View {
        Text(alphabetizer.message)
            .font(.largeTitle)
    }
}

#Preview {
    let alphabetizer = Alphabetizer()
    alphabetizer.message = "23"
    return MessageView()
        .environment(alphabetizer)
}
