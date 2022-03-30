//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 30/03/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var items: FetchedResults<Item>
    
    @State private var addText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(items) { item in
                        Group {
                            if item.completed {
                                Text(item.unwrappedText)
                                    .strikethrough()
                                    .foregroundColor(.secondary)
                            } else {
                                Text(item.unwrappedText)
                            }
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                            Button {
                                markCompleted(item)
                            } label: {
                                Label("Complete", systemImage: "checkmark.seal.fill")
                            }
                            
                        }
                    }
                    .onDelete(perform: deleteItem)
                }
                HStack {
                    TextField("Enter Task", text: $addText)
                        .onSubmit { addItem() }
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
        let item = Item(context: moc)
        
        item.id = UUID()
        item.text = addText
        item.completed = false
        
        if moc.hasChanges {
            try? moc.save()
        }
        
        addText = ""
    }
    
    func deleteItem(at indicies: IndexSet) {
        for index in indicies {
            let item = items[index]
            moc.delete(item)
        }
        
        try? moc.save()
    }
    
    func markCompleted(_ item: Item) {
        item.completed = !item.completed
        
        try? moc.save()
    }
}
