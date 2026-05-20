//
//  视界4.swift
//  Alphabetizer
//
//  Created by Codex on 5/20/26.
//

import SwiftUI

struct 视界4: View {
    @Environment(乘法口诀.self) private var alphabetizer

    var body: some View {
        VStack(spacing: 15) {
            积视界(中文: true)
            九宫视界()
        }
        .padding(.top, 60)
        .onAppear {
            alphabetizer.准备九宫题()
        }
    }
}

#Preview {
    视界4()
        .environment(乘法口诀())
}
