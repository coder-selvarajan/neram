//
//  CoreDataProvider.swift
//  Neram
//
//  Created by Selvarajan on 15/12/21.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataProvider {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataProvider()
    
    private init() {
        
        persistentContainer = NSPersistentContainer(name: "NeramModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to initialize Core Data \(error)")
            }
        }
        
        let directories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(directories[0])
    }
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
}
