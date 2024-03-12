//
//  FavoriteCocktailsView.swift
//  CocktailConnoisseur
//
//  Created by Jasmin on 2024-03-08.
//

import SwiftUI
import SwiftData

struct FavoriteCocktailsView: View {
    
    @Environment(\.modelContext) var context
    @Query(sort: \FavCocktail.cocktailName) var favCocktails: [FavCocktail]
    var body: some View {
        List{
            ForEach(favCocktails) {cocktail in
                Text(cocktail.cocktailName)
            }
            .onDelete(perform: { indexSet in
                for index in indexSet{
                    context.delete(favCocktails[index])
                }
            })
        }
        .overlay {
            if favCocktails.isEmpty{
                ContentUnavailableView(label: {
                    Label("No Favorite Cocktail", systemImage: "wineglass")
                }, description: {
                    Text("Browse cocktails to favorite or create your own cocktail")
                })
                // Maybe I can create a navigation link here
                
            }
        }
    }
}

#Preview {
    FavoriteCocktailsView()
}
