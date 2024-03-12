//
//  InteractionBar.swift
//  CocktailConnoisseur
//
//  Created by Jasmin on 2024-03-08.
//

import SwiftUI
import SwiftData

struct InteractionBar: View {
    @Environment(\.modelContext) var context
    @Query(sort: \FavCocktail.cocktailName) var favCocktails: [FavCocktail]
    var cocktail: Cocktail
    var favCocktail: FavCocktail
    @State var isFavorite: Bool = false
    
    var body: some View {
        HStack{
            
            //Favorite currently not working as intended
            //creating SwiftData model in order to get it to work
            //vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
            
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 25, height: 25)
                .onTapGesture {
                    isFavorite.toggle()
                    if favCocktails.contains(favCocktail){
                        context.delete(favCocktail)
                    } else {
                        context.insert(favCocktail)
                    }
                }
            Spacer()
            Image(systemName: "trash")
                .resizable()
                .frame(width: 25, height: 25)
                .onTapGesture {
                    context.delete(favCocktail)
                }
            
            ///\/\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ 
            //
            Spacer()
            Image(systemName: "square.and.pencil")
                .resizable()
                .frame(width: 25, height: 25)
        }
        .padding(.horizontal, 100)
        .foregroundColor(.red)
    }
    
}

//#Preview {
//    @Environment(\.modelContext) var context
//    var fav = FavCocktail(id: UUID(), cocktailName: "gin")
//    InteractionBar(context: _context, favoriteCocktail: fav)
//}
