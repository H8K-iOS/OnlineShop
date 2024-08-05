import SwiftUI

struct CustomMainButton: View {
    //MARK: - Properties
    let title: String
    let action: () -> Void
    
    //MARK: - Body
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .frame(maxWidth: .infinity)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding()
                .background(.black)
                .clipShape(Capsule())
                .shadow(color: .black, radius: 8, x: 5, y: 8)
        }
    }
}

