import SwiftUI

struct 视界1: View {
    var body: some View {
        VStack(spacing: 15) {
            积视界(中文: false)
            两卡视界()
            下一个()
        }
        .padding(.top, 60)
    }
}

#Preview {
    视界1()
        .environment(乘法口诀())
}
