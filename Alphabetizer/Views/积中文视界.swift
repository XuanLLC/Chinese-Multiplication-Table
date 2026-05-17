//
//  积视界 2.swift
//  Alphabetizer
//
//  Created by Xuan Wu on 5/16/26.
//


import SwiftUI

struct 积中文视界: View {
    @Environment(乘法口诀.self) private var alphabetizer

    var body: some View {
        Text(alphabetizer.积中文输出)
            .font(.largeTitle)
    }
}

#Preview {
    let alphabetizer = 乘法口诀()
    alphabetizer.积输出 = "23"
    return 积视界()
        .environment(alphabetizer)
}
