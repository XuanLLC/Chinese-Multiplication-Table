import SwiftUI

@main
struct AlphabetizerApp: App {
    @State private var alphabetizer = 乘法口诀()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(alphabetizer)
        }
    }
}
