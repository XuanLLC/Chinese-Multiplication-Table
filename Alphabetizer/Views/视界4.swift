//
//  视界4.swift
//  Alphabetizer
//
//  Created by Codex on 5/20/26.
//

import SwiftUI

struct 视界4: View {
    @State private var 口诀 = 乘法口诀()

    var body: some View {
        VStack(spacing: 15) {
            积视界(中文: true)
            九宫视界()
        }
        .padding(.top, 60)
        .environment(口诀)
        .onAppear {
            口诀.准备九宫题()
        }
    }
}

#Preview {
    视界4()
}
