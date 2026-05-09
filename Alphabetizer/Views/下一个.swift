import SwiftUI

struct 下一个: View {
    @Environment(乘法口诀.self) private var alphabetizer
    
    var body: some View {
        Button {
            alphabetizer.揭晓答案()
        } label: {
            Image(systemName: "questionmark.circle")
                .font(.system(size: 60))
                .foregroundStyle(Color.white)
                .padding(.horizontal, 80)
                .padding(.vertical, 20)
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(Color.purple)
                )
        }
        .disabled(!isEnabled)
    }
    
    var isEnabled: Bool {
        return true
        //alphabetizer.message == .instructions
    }
}

#Preview {
    下一个()
        .environment(乘法口诀())
}
