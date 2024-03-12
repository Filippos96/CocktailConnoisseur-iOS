//
//  CocktailConnoisseurApp.swift
//  CocktailConnoisseur
//
//  Created by Filip on 2024-03-06.
//

import SwiftUI
import SwiftData

@main
    
struct CocktailConnoisseurApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [FavCocktail.self])
    }
}
