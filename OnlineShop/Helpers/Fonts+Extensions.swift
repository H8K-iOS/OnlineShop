import SwiftUI

extension Text {
    func titleFont() -> some View {
        self
            .foregroundStyle(.primary)
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .opacity(0.8)
    }
    
    func subtitle() -> some View {
        self
            .foregroundStyle(.primary)
            .font(.system(size: 16, weight: .medium, design: .rounded))
            .opacity(0.8)
    }
}

//MARK: - Preloader
struct FontView: View {
    var body: some View {
        Text("Title")
            .titleFont()
        Text("Subtitle")
            .subtitle()
    }
}

#Preview {
    FontView()
}

