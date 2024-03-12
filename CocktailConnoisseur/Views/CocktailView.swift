//
//  CocktailView.swift
//  CocktailConnoisseur
//
//  Created by Filip on 2024-02-27.
//

import Foundation
import SwiftUI
import SwiftData

struct CocktailView: View {

    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    var cocktail: Cocktail
    

    var body: some View {

        ZStack{
            Color(.black)
                
                .ignoresSafeArea(.all)
            VStack{
                Text(cocktail.cocktailName)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(Color.red)

                AsyncImage(url: URL(string: cocktail.imageURL), scale: cocktail.imageScale)
                Spacer()
                InteractionBar(cocktail: cocktail, favCocktail: FavCocktail(id: cocktail.id, cocktailName: cocktail.cocktailName))
                List{
                    ForEach(0..<cocktail.recipe.count, id: \.self) { index in
                        IngredientView(recipe: cocktail.recipe[index])
                    }
                    .listRowBackground(Color.clear)
                }
                .scrollContentBackground(.hidden)
            }
            //.navigationTitle(cocktail.cocktailName)
            //.navigationBarTitleDisplayMode(.inline)

        }
    }
    
}

struct IngredientView: View {
    var recipe: Ingredient
    var body: some View {
        HStack{
            Text("\(recipe.ingredinet) ")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
            
            Text("\(formatDouble(recipe.ammount)) \(recipe.measurment)")
                .font(.title2)
                .fontWeight(.bold)
        }
        .foregroundStyle(Color.red)
    }
}

func formatDouble(_ temp: Double) -> String {
    let tempVar = String(format: "%g", temp)
    print(tempVar)
    return tempVar
}

struct CocktailView_Preveiws: PreviewProvider {
    static var previews: some View {
            @Environment(\.dismiss) var dismiss
            @State var cocktail = Cocktail(
                id: 1, cocktailName: "Negroni",
                recipe: [Ingredient(ingredinet: "Gin", ammount: 2, measurment: "cl"),
                         Ingredient(ingredinet: "Campari", ammount: 2, measurment: "cl"),
                         Ingredient(ingredinet: "Sweet Vermouth", ammount: 2, measurment: "cl")],
                imageURL: "https://drinkoteket.se/wp-content/uploads/mezcal-negroni.jpg",
                imageScale: 3)
        NavigationView{
            CocktailView(cocktail: cocktail)
        }
        
    }
}
