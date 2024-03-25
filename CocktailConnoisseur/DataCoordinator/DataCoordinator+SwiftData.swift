//
//  DataCoordinator+SwiftData.swift
//  CocktailConnoisseur
//
//  Created by Jasmin on 2024-03-12.
//

import Foundation
import SwiftData

extension DataCoordinator {
    func getObject(id: Int) -> FavCocktail? {
        
        do {
            let predicate = #Predicate<FavCocktail> { object in
                object.id == id
            }
            var descriptor = FetchDescriptor(predicate: predicate)
            descriptor.fetchLimit = 1
            let object = try persistantContainer.mainContext.fetch(descriptor)
            debugPrint("\(DataCoordinator.identifier) getObject : \(object)")
            return object.first
        } catch {
            debugPrint("\(DataCoordinator.identifier) getObject : \(error)")
            return nil
        }
    }
    
    func doesObjectExist(id: Int) -> Bool{
        return getObject(id: id) != nil
    }
    
    func deleteObject(id: Int) {
        do {
            if let object = getObject(id: id) {
                try persistantContainer.mainContext.delete(object)
                
                try persistantContainer.mainContext.save()
                debugPrint("\(DataCoordinator.identifier) Object deleted successfully")
            } else {
                debugPrint("\(DataCoordinator.identifier) Object with id \(id) does not exist")
            }
        } catch {
            debugPrint("\(DataCoordinator.identifier) Failed to delete object: \(error)")
        }
    }
    
    func addObject(id:Int) {
        do {
            if let object = getObject(id: id) {
                try persistantContainer.mainContext.insert(object)
                
                try persistantContainer.mainContext.save()
                debugPrint("\(DataCoordinator.identifier) Object inserted successfully")
            } else {
                debugPrint("\(DataCoordinator.identifier) Object with id \(id) does not exist")
            }
        } catch {
            debugPrint("\(DataCoordinator.identifier) Failed to insert object: \(error)")
        }
    }
}


