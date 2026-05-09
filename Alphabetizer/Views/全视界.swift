import SwiftUI

struct 全视界: View {
    var body: some View {
        VStack(spacing: 15) {
            积视界()
            两卡视界()
            下一个()
        }
        .padding(.top, 60)
    }
}

#Preview {
    全视界()
        .environment(乘法口诀())
}
