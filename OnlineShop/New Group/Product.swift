import Foundation
import FirebaseFirestoreSwift

struct Product: Identifiable, Codable {
    @DocumentID var id: String?
    var image: String
    var name: String
    var description: String
    var price: Int
    var isFavorite: Bool
    var cuantityInCart: Int?
}
