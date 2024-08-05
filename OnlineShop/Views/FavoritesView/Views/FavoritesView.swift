import SwiftUI
import FirebaseFirestoreSwift

struct FavoritesView: View {
    //MARK: - Properties
    @FirestoreQuery(collectionPath: "Shop", 
                    predicates: [.isEqualTo("isFavorite", true)]) private var favoritesItems: [Product]
    var columns = Array(repeating: GridItem(), count: 2)
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns) {
                        ForEach(favoritesItems) { item in
                            NavigationLink(destination: DetailView(product: item)) {
                                ProductCardView(product: item)
                            }
                            .buttonStyle(.plain)
                            
                        }
                        
                        
                    }
                }
                .padding(.horizontal, 10)
                .background(.secondary.opacity(0.3))
                .navigationTitle("Favorites")
                .navigationBarBackButtonHidden()
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButtonView()
            }
           
        }
    }
}

#Preview {
    FavoritesView()
}
