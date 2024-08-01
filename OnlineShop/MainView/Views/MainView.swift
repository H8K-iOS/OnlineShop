import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct MainView: View {
    //MARK: Properties
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
                            ProductCardView(product: item)
                        }
                    }
                }
                .padding(.horizontal, 10)
                .background(.secondary.opacity(0.4))
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
                            Image(systemName: "cart.fill")
                                .font(.title2)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            
        }
    }
}

#Preview {
    MainView()
}
