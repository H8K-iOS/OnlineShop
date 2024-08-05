import SwiftUI

struct DetailInfoView: View {
    @EnvironmentObject var viewModel: MainViewModel
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text(product.name)
                    .titleFont()
                Spacer()
                Text("$\(product.price)")
                    .titleFont()
            }
            Text(product.description)
                .subtitle()
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .lineLimit(7)
            
            Spacer()
            
            CustomMainButton(title: "Add to cart") {
                self.viewModel.addToCart(product: product)
            }
        }
        .padding(.horizontal, 30)
    }
}
