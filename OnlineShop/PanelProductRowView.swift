import SwiftUI

struct PanelProductRowView: View {
    //MARK: - Properties
    @EnvironmentObject var viewModel: MainViewModel
    let product: Product
    
    //MARK: - Body
    var body: some View {
        VStack(alignment: .trailing, spacing: 25) {
            Button {
                self.viewModel.removeFromCart(product: product)
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundStyle(.primary)
                    .font(.title2)
            }
            .buttonStyle(.plain)
            
            HStack {
                //MARK: - Decrease Button
                Button {
                    self.viewModel.decreaseQuantity(product: product)
                } label: {
                    Image(systemName: "minus.rectangle.fill")
                        .foregroundStyle(.primary)
                        .font(.title)
                }
                .buttonStyle(.plain)
                
                Text("\(product.cuantityInCart ?? 1)")
                
                //MARK: - Increase Button
                Button {
                    self.viewModel.increaseQuantity(product: product)
                } label: {
                    Image(systemName: "plus.rectangle.fill")
                        .foregroundStyle(.primary)
                        .font(.title)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 20)
    }
}

