import FirebaseFirestore
import Foundation

final class MainViewModel: ObservableObject {
    //MARK: - Properties
    private let dataBase = Firestore.firestore().collection("Shop")
    @Published var cartItems: [Product] = []
    
    var cartItemsCount: Int {
        cartItems.filter { $0.cuantityInCart ?? 0 > 0 }.count
    }
    
    var totalSum: Int {
        cartItems.reduce(0) { $0 + ($1.price * ($1.cuantityInCart ?? 0)) }
    }
    
    init() {
        fetchItems()
    }
    
    //MARK: - Methods
    private func fetchItems() {
        self.dataBase.addSnapshotListener { snap, error in
            guard let document = snap?.documents else { return }
            self.cartItems = document.compactMap { document -> Product? in
                try? document.data(as: Product.self)
            }
        }
    }
    
    func toggleFovorite(product: Product) {
        self.updateItem(product, data: ["isFavorite": !product.isFavorite])
    }
    
    func addToCart(product: Product) {
        self.updateItem(product, data: ["cuantityInCart": 1])
    }
    
    func removeFromCart(product: Product) {
        self.updateItem(product, data: ["cuantityInCart": 0])
    }
    
    
    func increaseQuantity(product: Product) {
        let newQuantity = (product.cuantityInCart ?? 0) + 1
        self.updateItem(product, data: ["cuantityInCart": newQuantity])
    }
    
    func decreaseQuantity(product: Product) {
        let newQuantity = (product.cuantityInCart ?? 0) - 1
        self.updateItem(product, data: ["cuantityInCart": newQuantity])
    }

    //MARK: - Private Methods
    private func updateItem(_ item: Product, data: [String: Any]) {
        guard let id = item.id else { return }
        dataBase.document(id).updateData(data)
    }
}
