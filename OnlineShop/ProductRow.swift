import SwiftUI

struct ProductRow: View {
    //MARK: - Properties
    let product: Product
    //MARK: - Body
    var body: some View {
        ZStack(alignment: .trailing) {
            HStack(spacing: 20) {
                //MARK: - Image
                if let url = URL(string: product.image) {
                    CardImageView(url: url, width: 100, height: 100)
                        .scaledToFit()
                }
                
                //MARK: - Info
                VStack(alignment: .leading, spacing: 18) {
                    Text(product.name)
                        .titleFont()
                    if let cuantityInCart = product.cuantityInCart {
                        let sum = cuantityInCart * product.price
                        Text("$\(sum)")
                    }
                    
                }
                Spacer()
            }
            .padding(10)
            .background(.background)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            
            PanelProductRowView(product: product)
                
        }
        .shadow(color: .black.opacity(0.3), radius: 7, x: 5, y: 6)
        .padding(.horizontal, 10)
        .background(.clear)
    }
}

#Preview {
    ProductRow( product: Product(
        image: "https://firebasestorage.googleapis.com/v0/b/onlineshopapp-89bfd.appspot.com/o/Products%2F1.jpg?alt=media&token=a15e4b48-d018-45fd-8b3f-928974280e74",
        name: "Apple Watch",
        description: "Compatible use of Apple Watch and iPhone opens up a whole world of features that improve the performance of each of these devices. You can get directions on your iPhone and get hints by touching your wrist when you need to turn. Or gather friends for a group photo on iPhone, and then use the clock to view the frame and take a picture.",
        price: 100,
        isFavorite: false
        )
    )
}

