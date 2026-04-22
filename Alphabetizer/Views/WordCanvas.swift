import SwiftUI

struct WordCanvas: View {
    @Environment(Alphabetizer.self) private var alphabetizer
    
    private var tiles: [Tile] {
        alphabetizer.tiles
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
            .offset(x: Tile.halfSize)
        }
        .onAppear {
            setInitialTilePositions()
        }
        .onChange(of: alphabetizer.message) { oldValue, newValue in
            switch (oldValue, newValue) {
            case (.youWin, .instructions):
                withAnimation {
                    setInitialTilePositions()
                }
            default:
                break
            }
        }
    }
}

#Preview {
    WordCanvas()
        .environment(Alphabetizer())
}

extension WordCanvas {
    private func setInitialTilePositions() {
        // Distribute tiles apart from each other but still centered
        // 0,0 is in the middle of the stack
        tiles.enumerated().forEach { index, tile in
            let midpoint = Double(tiles.count - 1) / 2.0
            let position = Double(index) - midpoint

            tiles[index].position.x = (Tile.边长 + Tile.spacing) * position
            tiles[index].position.y = Tile.halfSize
        }
    }
}

extension Tile {
    static let placeholderSize = 边长 - 20.0
    static let 边长 = 100.0
    static let halfSize = 边长/2
    static let spacing = halfSize

    // Drag from the center of the tile instead of the default top left
    var centeredOffset: CGSize {
        CGSize(width: position.x - Tile.halfSize, height: position.y - Tile.halfSize)
    }
}
