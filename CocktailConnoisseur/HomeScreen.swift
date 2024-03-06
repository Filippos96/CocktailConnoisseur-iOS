


import Foundation
import SwiftUI

struct HomeScreen: View {
    @State var cocktailList = [
        CocktailObj(
            cocktailName: "Negroni",
            ingredients: ["Gin", "Sweet Vermouth", "Campari"],
            measurements: ["cl","cl","cl"],
            ammount: [2.0,2,2],
            imageURL: "https://drinkoteket.se/wp-content/uploads/mezcal-negroni.jpg",
            imageScale: 3),
        CocktailObj(
            cocktailName: "Gin gimlet",
            ingredients: ["Gin", "Lemon Juice", "Simple Syrup"],
            measurements: ["cl","cl","cl"],
            ammount: [2,0.75,0.75],
            imageURL: "https://cdn1.foodviva.com/static-content/food-images/classic-cocktails/gimlet-cocktail/gimlet-cocktail.jpg",
            imageScale: 1)]
    
    var body: some View {
        NavigationStack {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            
                
                ScrollView{
                    ForEach(cocktailList) { cocktail in
                        NavigationLink(destination: CocktailView(cocktailObj: cocktail)) {
                            VStack {
                                Text(cocktail.cocktailName)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.white)
                                
                                AsyncImage(url: URL(string: cocktail.imageURL), scale: cocktail.imageScale)
                                    
                            }
                            .background(Color.black) // Set the background color here
                        }//.scrollContentBackground(.hidden)
                    }//.scrollContentBackground(.hidden)
                }
            }
             
        }
    }
}


#Preview {
    HomeScreen()
}
