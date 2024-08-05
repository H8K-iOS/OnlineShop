import SwiftUI

struct CartButton: View {
    //MARK: - Properties
    var numberOfProductsInCart: Int
    //MARK: - Body
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart.fill")
                .font(.title2)
                .padding(.top, 5)
            if numberOfProductsInCart > 0 {
                Text("\(numberOfProductsInCart)")
                    .font(.caption).bold()
                    .backgroundStyle(.white)
                    .frame(width: 17, height: 17)
                    .background(.red)
                    .clipShape(Circle())
            }
            
        }
    }
}

#Preview {
    CartButton(numberOfProductsInCart: 3)
}
