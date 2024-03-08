


import Foundation
import SwiftUI

struct HomeScreen: View {
    @State var cocktailList = [
        Cocktail(
            cocktailName: "Negroni",
            recipe: [Ingredient(ingredinet: "Gin", ammount: 2, measurment: "cl"),
                     Ingredient(ingredinet: "Campari", ammount: 2, measurment: "cl"),
                     Ingredient(ingredinet: "Sweet Vermouth", ammount: 2, measurment: "cl")],
            imageURL: "https://drinkoteket.se/wp-content/uploads/mezcal-negroni.jpg",
            imageScale: 3),
        Cocktail(
            cocktailName: "Gin Gimlet",
            recipe: [Ingredient(ingredinet: "Gin", ammount: 2, measurment: "cl"),
                     Ingredient(ingredinet: "Lemon Juice", ammount: 0.75, measurment: "cl"),
                     Ingredient(ingredinet: "Simple Syrup", ammount: 0.75, measurment: "cl")],
            imageURL: "https://cdn1.foodviva.com/static-content/food-images/classic-cocktails/gimlet-cocktail/gimlet-cocktail.jpg",
            imageScale: 1)]
    
    var body: some View {
        NavigationStack {
        ZStack {
            Color.black
                .ignoresSafeArea()
                ScrollView{
                    ForEach(cocktailList) { cocktail in
                        NavigationLink(destination: CocktailView(cocktail: cocktail)) {
                            VStack {
                                Text(cocktail.cocktailName)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.white)
                                
                                AsyncImage(url: URL(string: cocktail.imageURL), scale: cocktail.imageScale)
                                    
                            }
                        }
                    }
                }
            }
             
        }
    }
}


#Preview {
    HomeScreen()
}
