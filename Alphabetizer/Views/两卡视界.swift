import SwiftUI

struct 两卡视界: View {
    @Environment(乘法口诀.self) private var alphabetizer
    
    private var tiles: [字卡] {
        alphabetizer.两字卡
    }

    var body: some View {
        ZStack {
            ForEach(tiles) { tile in
                字卡视界(tile: tile)
                    .offset(tile.centeredOffset)
                    .onTapGesture {
                        tile.flipped.toggle()
                    }
            }
            .offset(x: 字卡.halfSize)
        }
        .onAppear {
            setInitialTilePositions()
        }
        .onChange(of: alphabetizer.积输出) {
            withAnimation {
                setInitialTilePositions()
            }
        }
    }
}

#Preview {
    两卡视界()
        .environment(乘法口诀())
}

extension 两卡视界 {
    private func setInitialTilePositions() {
        // Distribute tiles apart from each other but still centered
        // 0,0 is in the middle of the stack
        tiles.enumerated().forEach { index, tile in
            let midpoint = Double(tiles.count - 1) / 2.0
            let position = Double(index) - midpoint

            tiles[index].position.x = (字卡.边长 + 字卡.spacing) * position
            tiles[index].position.y = 字卡.halfSize
        }
    }
}

extension 字卡 {
    static let placeholderSize = 边长 - 20.0
    static let 边长 = 100.0
    static let halfSize = 边长/2
    static let spacing = halfSize

    // Drag from the center of the tile instead of the default top left
    var centeredOffset: CGSize {
        CGSize(width: position.x - 字卡.halfSize, height: position.y - 字卡.halfSize)
    }
}
