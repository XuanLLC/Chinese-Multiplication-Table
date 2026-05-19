//
//  视界3.swift
//  Alphabetizer
//
//  Created by Xuan Wu on 5/17/26.
//

import SwiftUI

struct 视界3: View {
    @Environment(乘法口诀.self) private var alphabetizer

    var body: some View {
        VStack(spacing: 15) {
            积视界(中文: true)
            两卡视界(按序点选: true)
        }
        .padding(.top, 60)
        .onAppear {
            alphabetizer.准备先小后大题()
        }
    }
}

#Preview {
    视界3()
        .environment(乘法口诀())
}
