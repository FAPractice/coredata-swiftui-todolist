//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 30/03/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var addText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    
                }
                HStack {
                    TextField("Enter Task", text: $addText)
                    Button { addItem() } label: {
                        Label("Add Task", systemImage: "plus")
                    }.buttonStyle(BorderedProminentButtonStyle())
                }
                .padding()
            }
            .navigationTitle("ToDo List")
            .toolbar {
                EditButton().buttonStyle(BorderedButtonStyle())
            }
        }
    }
    
    func addItem() {
        
    }
}
