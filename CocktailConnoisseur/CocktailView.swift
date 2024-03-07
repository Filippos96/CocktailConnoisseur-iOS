//
//  CocktailView.swift
//  CocktailConnoisseur
//
//  Created by Filip on 2024-02-27.
//

import Foundation
import SwiftUI

struct CocktailView: View {

    @Environment(\.dismiss) var dismiss

    var cocktail: Cocktail

    var cocktailName = "Negroni"
    var ingredients = ["Gin", "Sweet Vermouth", "Campari"]
    var measurements = ["cl","cl","cl"]
    var ammount = [2,2,2]
    var image = "https://drinkoteket.se/wp-content/uploads/mezcal-negroni.jpg"

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
                List{
                    ForEach(0..<cocktail.recipe.count, id: \.self) { index in

                        HStack{
                            Text("\(cocktail.recipe[index].ingredinet) ")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            Text("\(formatDouble(cocktail.recipe[index].ammount)) \(cocktail.recipe[index].measurment)")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        .foregroundStyle(Color.red)

                    }
                    .listRowBackground(Color.clear)
                }
                .frame(alignment: .bottom)
                .scrollContentBackground(.hidden)
            }
            .navigationTitle(cocktail.cocktailName)
            .navigationBarTitleDisplayMode(.inline)

        }
    }
    func formatDouble(_ temp: Double) -> String {
        let tempVar = String(format: "%g", temp)
        print(tempVar)
        return tempVar
    }
}

struct CocktailView_Preveiws: PreviewProvider {
    static var previews: some View {
            @Environment(\.dismiss) var dismiss
            @State var cocktail = Cocktail(
                cocktailName: "Negroni",
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
