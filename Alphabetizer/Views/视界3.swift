//
//  视界3.swift
//  Alphabetizer
//
//  Created by Xuan Wu on 5/17/26.
//

import SwiftUI

struct 视界3: View {
    @State private var 口诀 = 乘法口诀()

    var body: some View {
        VStack(spacing: 15) {
            积视界(中文: true)
            两卡视界 { 字卡 in
                口诀.按先小后大点击(字卡)
            }
        }
        .padding(.top, 60)
        .environment(口诀)
        .onAppear {
            口诀.开新局(显示积: true, 随机顺序: true)
        }
    }
}

#Preview {
    视界3()
}
