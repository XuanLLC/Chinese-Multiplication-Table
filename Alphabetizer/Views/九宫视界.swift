import SwiftUI

struct 九宫视界: View {
    @Environment(乘法口诀.self) private var alphabetizer

    private var rows: [[字卡]] {
        stride(from: 0, to: alphabetizer.九字卡.count, by: 3).map { index in
            Array(alphabetizer.九字卡[index..<min(index + 3, alphabetizer.九字卡.count)])
        }
    }

    var body: some View {
        VStack(spacing: 15) {
            ForEach(rows.indices, id: \.self) { rowIndex in
                HStack(spacing: 15) {
                    ForEach(rows[rowIndex]) { tile in
                        字卡视界(tile: tile)
                            .onTapGesture {
                                alphabetizer.点选九宫字卡(tile)
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    九宫视界()
        .environment(乘法口诀())
}
