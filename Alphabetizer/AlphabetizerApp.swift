import SwiftUI

@main
struct AlphabetizerApp: App {
    @State private var alphabetizer = 乘法口诀()
    
    var body: some Scene {
        WindowGroup {
            全视界()
                .environment(alphabetizer)
        }
    }
}
