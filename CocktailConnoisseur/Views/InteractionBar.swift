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
    var favCocktail: FavCocktail
    @State var isFavorite: Bool = false
    let dataCoordinator = DataCoordinator.shared // Maybe move this somewhere else
    
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
                    if dataCoordinator.doesObjectExist(id: favCocktail.id){
                        
                        dataCoordinator.deleteObject(id: favCocktail.id)
                        print("deleting \(favCocktail.cocktailName)")
                        print(favCocktail.id)
                        
                    } else {
                        context.insert(favCocktail)
                        print("inserting \(favCocktail.cocktailName)")
                        print(favCocktail.id)
                        var favCocktails2 = favCocktails
                        favCocktails2.append(favCocktail)
                        
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
