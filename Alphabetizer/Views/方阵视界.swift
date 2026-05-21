import SwiftUI

struct 方阵视界: View {
    @Environment(乘法口诀.self) private var alphabetizer

    private var rows: [[字卡]] {
        stride(from: 0, to: alphabetizer.方阵字卡.count, by: 5).map { index in
            Array(alphabetizer.方阵字卡[index..<min(index + 5, alphabetizer.方阵字卡.count)])
        }
    }

    var body: some View {
        VStack(spacing: 8) {
            ForEach(rows.indices, id: \.self) { rowIndex in
                HStack(spacing: 8) {
                    ForEach(rows[rowIndex]) { tile in
                        字卡视界(tile: tile, 边长: 58, 字号: 26)
                            .onTapGesture {
                                alphabetizer.点选方阵字卡(tile)
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    let alphabetizer = 乘法口诀()
    alphabetizer.准备方阵题()
    return 方阵视界()
        .environment(alphabetizer)
}
