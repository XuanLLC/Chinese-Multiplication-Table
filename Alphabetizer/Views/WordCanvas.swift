import SwiftUI

struct WordCanvas: View {
    @Environment(乘法口诀.self) private var alphabetizer
    
    private var tiles: [字卡] {
        alphabetizer.两字卡
    }

    var body: some View {
        ZStack {/*
            HStack(spacing: Tile.spacing) {
                ForEach(tiles) { _ in
                    Rectangle()
                        .fill(Color.purple.opacity(0.2))
                        .offset(y: -(Tile.size + Tile.halfSize))
                        .frame(width: Tile.placeholderSize, height: Tile.placeholderSize)
                }
            }*/
            ForEach(tiles) { tile in
                TileView(tile: tile)
                    .offset(tile.centeredOffset)
                    .onTapGesture {
                        tile.flipped.toggle()
                    }
            }
            .offset(x: 字卡.halfSize)
        }
        .onAppear {
            setInitialTilePositions()
        }/*
        .onChange(of: alphabetizer.message) { oldValue, newValue in
            switch (oldValue, newValue) {
            case (.youWin, .instructions):
                withAnimation {
                    setInitialTilePositions()
                }
            default:
                break
            }
        }*/
    }
}

#Preview {
    WordCanvas()
        .environment(乘法口诀())
}

extension WordCanvas {
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
