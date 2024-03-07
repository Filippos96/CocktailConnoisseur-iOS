//
//  CocktailModel.swift
//  CocktailConnoisseur
//
//  Created by Filip on 2024-03-06.
//

import Foundation

struct Cocktail: Identifiable{
    var id = UUID()
    var cocktailName: String
    var recipe: [Ingredient]
    var imageURL: String
    var imageScale: CGFloat
}
struct Ingredient{
    var ingredinet: String
    var ammount: Double
    var measurment: String
}
