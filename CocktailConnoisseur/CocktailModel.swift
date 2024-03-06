//
//  CocktailModel.swift
//  CocktailConnoisseur
//
//  Created by Filip on 2024-03-06.
//

import Foundation

struct CocktailObj: Identifiable{
    var id = UUID()
    var cocktailName: String
    var ingredients: [String]
    var measurements: [String]
    var ammount: [Double]
    var imageURL: String
    var imageScale: CGFloat
}
