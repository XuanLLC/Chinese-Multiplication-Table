import SwiftUI

struct 字卡视界: View {
    var tile: 字卡
    var 边长 = 字卡.边长
    var 字号 = 40.0

    private let borderWidth = 5.0

    var body: some View {
        VStack {
            if tile.flipped {
                Text(tile.字)
                    .font(Font.system(size: 字号))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            } else {
                Text(tile.字)
                    .font(Font.system(size: 字号))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
        }
        .frame(width: 边长 - borderWidth * 2, height: 边长 - borderWidth * 2)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(borderStyle(), lineWidth: borderWidth))
        .background(tile.flipped ? Color.green.opacity(0.45) : Color.purple.opacity(0.5))
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
    return 字卡视界(tile: tile)
        .onTapGesture {
            tile.flipped.toggle()
        }
}
