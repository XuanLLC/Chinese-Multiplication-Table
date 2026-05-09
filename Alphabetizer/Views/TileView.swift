import SwiftUI

struct TileView: View {
    var tile: 字卡

    private let borderWidth = 5.0

    var body: some View {
        VStack {
            if tile.flipped {
                Text(tile.字)
                    .font(Font.system(size: 40))
            } else {
                Text(tile.字)
                    .font(Font.system(size: 40))
            }
        }
        .frame(width: 字卡.边长 - borderWidth * 2, height: 字卡.边长 - borderWidth * 2)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(borderStyle(), lineWidth: borderWidth))
        .background(Color.purple.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .rotation3DEffect(.degrees(tile.flipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        .animation(.default, value: tile.flipped)
    }

    func borderStyle() -> some ShapeStyle {
        return LinearGradient(colors: [
            Color(red: 157.0/255.0, green: 153.0/255.0, blue: 244.0/255.0),
            Color(red: 246.0/255.0, green: 206.0/255.0, blue: 241.0/255.0),
        ], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

#Preview {
    let tile = 字卡(word: "二")
    return TileView(tile: tile)
        .onTapGesture {
            tile.flipped.toggle()
        }
}
