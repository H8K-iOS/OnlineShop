import SwiftUI

struct DetailView: View {
    //MARK: - Properties
    @EnvironmentObject var viewModel: MainViewModel
    
    let product: Product
    let screen = UIScreen.main.bounds
    
    //MARK: - Body
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            VStack {
                if let url = URL(string: product.image) {
                    CardImageView(url: url, width: self.screen.width, height: self.screen.height/1.7)
                        .ignoresSafeArea()
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 8)
                }

                DetailInfoView(product: product)
            }
            
            .navigationBarBackButtonHidden()
            
            BackButtonView()
                .padding(.leading, 16)
            
        }
        
        .background(.secondary.opacity(0.3))
    }
}

#Preview {
    DetailView(
        product: Product(
            image: "https://firebasestorage.googleapis.com/v0/b/onlineshopapp-89bfd.appspot.com/o/Products%2F1.jpg?alt=media&token=a15e4b48-d018-45fd-8b3f-928974280e74",
            name: "Apple Watch",
            description: "Compatible use of Apple Watch and iPhone opens up a whole world of features that improve the performance of each of these devices. You can get directions on your iPhone and get hints by touching your wrist when you need to turn. Or gather friends for a group photo on iPhone, and then use the clock to view the frame and take a picture.",
            price: 100,
            isFavorite: false
        )
    )
    .environmentObject(MainViewModel())
}

