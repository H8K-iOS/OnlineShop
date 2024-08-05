import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct MainView: View {
    //MARK: Properties
    @EnvironmentObject var viewModel: MainViewModel
    @FirestoreQuery(collectionPath: "Shop") var items: [Product]
    private var colums =  Array(repeating: GridItem(), count: 2)
    
    //MARK: - Body
    var body: some View {
        VStack {
            NavigationStack {
                //MARK: - Main View
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: colums) {
                        ForEach(items) { item in
                            NavigationLink(destination: DetailView(product: item)) {
                                ProductCardView(product: item)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(.horizontal, 10)
                .background(.secondary.opacity(0.3))
                .shadow(color: .black.opacity(0.2), radius: 4, x: 4, y: 8)
                //MARK: - Navigation Bar
                .navigationTitle("Products")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationLink(destination: FavoritesView()) {
                            Image(systemName: "heart.fill")
                                .font(.title2)
                        }
                        .buttonStyle(.plain)
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: CartView()) {
                            CartButton(numberOfProductsInCart: self.viewModel.cartItemsCount )
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            
        }
    }
}

#Preview {
    MainView().environmentObject(MainViewModel())
}
