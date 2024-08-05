import SwiftUI

struct BackButtonView: View {
    //MARK: - Properties
    @Environment(\.dismiss) var dismiss
    
    //MARK: - Body
    var body: some View {
        Button {
            self.dismiss()
        } label: {
            ZStack() {
                Circle()
                    .frame(width: 34)
                    .foregroundStyle(.black).opacity(0.3)
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .opacity(0.8)
            }
        }

    }
}

#Preview {
    BackButtonView()
}
