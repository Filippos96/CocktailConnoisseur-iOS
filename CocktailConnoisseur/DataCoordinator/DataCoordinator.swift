//
//  DataCoordinator.swift
//  CocktailConnoisseur
//
//  Created by Jasmin on 2024-03-12.
//

//Created with help from https://www.delasign.com/blog/xcode-swiftdata-get-object/
// and                   https://www.delasign.com/blog/xcode-swiftdata-object-exists/

import Foundation
import SwiftData

@MainActor
class DataCoordinator: NSObject{
    
    static let identifier: String = "[DataCoordinator]"
    static let shared: DataCoordinator = DataCoordinator()
    
    let persistantContainer: ModelContainer = {
        do {
            let container = try ModelContainer(
                for: FavCocktail.self,
                configurations: ModelConfiguration()
            )
            return container
        } catch {
            fatalError("Failed to create container")
        }
    }()
    var favCocktails: [FavCocktail] = []
}
