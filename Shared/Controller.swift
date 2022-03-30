//
//  Controller.swift
//  TodoList
//
//  Created by Harsh Chaturvedi on 30/03/22.
//

import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Model")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("CoreData Load Error: \(error.localizedDescription)")
            }
        }
    }
}
