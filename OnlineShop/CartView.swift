import SwiftUI
import FirebaseFirestoreSwift

struct CartView: View {
    //MARK: - Properties
    @EnvironmentObject var viewModel: MainViewModel
    @FirestoreQuery(collectionPath: "Shop") private var items: [Product]
    //MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(items.filter {$0.cuantityInCart ?? 0 > 0}) { item in
                        ProductRow(product: item)
                    }
                }
                .padding(.bottom, 15)
                
                Text("Total: \(self.viewModel.totalSum)")
                    .titleFont()
                    .padding(.bottom)
                
                CustomMainButton(title: "Buy") {
                    
                }
                .padding(.horizontal, 30)
            }
            .navigationTitle("Cart")
            .background(.secondary.opacity(0.3))
            .navigationBarBackButtonHidden()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButtonView()
            }
        }
    }
}

#Preview {
    NavigationView {
        CartView()
    }
}
