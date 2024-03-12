//
//  CocktailModel.swift
//  CocktailConnoisseur
//
//  Created by Filip on 2024-03-06.
//

import Foundation
import SwiftData

struct Cocktail: Identifiable{
    var id: Int
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

@Model
class FavCocktail{
    @Attribute(.unique) var id: Int
    var cocktailName: String
    
    init(id: Int, cocktailName: String) {
        self.id = id
        self.cocktailName = cocktailName
    }
}
