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

    var cocktailObj: CocktailObj

    var cocktailName = "Negroni"
    var ingredients = ["Gin", "Sweet Vermouth", "Campari"]
    var measurements = ["cl","cl","cl"]
    var ammount = [2,2,2]
    var image = "https://drinkoteket.se/wp-content/uploads/mezcal-negroni.jpg"

    var body: some View {

        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                Text(cocktailObj.cocktailName)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(Color.red)


                AsyncImage(url: URL(string: cocktailObj.imageURL), scale: cocktailObj.imageScale)
                List{
                    ForEach(0..<ingredients.count, id: \.self) { index in

                        HStack{
                            Text("\(cocktailObj.ingredients[index]) ")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            Text("\(String(format: "&g", cocktailObj.ammount[index].rounded())) \(cocktailObj.measurements[index])")
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
            .navigationTitle(cocktailObj.cocktailName)
            .navigationBarTitleDisplayMode(.inline)

        }
    }
}
