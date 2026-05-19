//
//  视界3.swift
//  Alphabetizer
//
//  Created by Xuan Wu on 5/17/26.
//

import SwiftUI

struct 视界3: View {
    var body: some View {
        VStack(spacing: 15) {
            积视界()
            两卡视界() // 待做：需按先小后大点击后通过
        }
        .padding(.top, 60)
    }
}

#Preview {
    视界1()
        .environment(乘法口诀())
}
