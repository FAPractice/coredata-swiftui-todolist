//
//  TodoListApp.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 30/03/22.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
