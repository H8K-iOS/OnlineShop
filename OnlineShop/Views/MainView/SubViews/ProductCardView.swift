import SwiftUI

struct ProductCardView: View {
    //MARK: - Properties
    @EnvironmentObject var viewModel: MainViewModel
    let product: Product
    
    //MARK: - Body
    var body: some View {
        GeometryReader { geo in
            let size = geo.size
            ZStack(alignment: .bottom) {
                ZStack(alignment: .topTrailing) {
                    if let url = URL(string: product.image) {
                        CardImageView(url: url, width: size.width, height: size.height)
                        
                        Button {
                            self.viewModel.toggleFovorite(product: product)
                        } label: {
                        Image(systemName: "heart.fill")
                                .padding(10)
                                .foregroundColor(product.isFavorite ? .red : .white)
                                .background(.black)
                                .opacity(product.isFavorite ? 0.8 : 0.5)
                                .clipShape(.circle)
                                .padding(9)
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .titleFont()
                        .lineLimit(1)
                    Text("$ \(product.price)")
                        .subtitle()
                }
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(10)
            }
        }
        .frame(height: UIScreen.main.bounds.width * 0.7)
    }
}

#Preview {
    MainView()
        .environmentObject(MainViewModel())
    
//    ProductCardView(
//        product: Product(
//            image: "https://firebasestorage.googleapis.com/v0/b/onlineshopapp-89bfd.appspot.com/o/Products%2F6.jpg?alt=media&token=2738ed26-9e1d-4a63-b1c2-5bb5a2272696",
//            name: "Dyson",
//            description: "",
//            price: 100,
//            isFavorite: false
//        )
//    )
}
