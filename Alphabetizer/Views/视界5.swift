import SwiftUI

struct 视界5: View {
    @State private var 口诀 = 乘法口诀()

    var body: some View {
        VStack(spacing: 15) {
            方阵视界()
        }
        .padding(.top, 60)
        .environment(口诀)
        .onAppear {
            口诀.准备方阵题()
        }
    }
}

#Preview {
    视界5()
}
