//
//  ToDoViewModel.swift
//  ToDo
//
//  Created by Daniil on 25.08.2022.
//

import Foundation
class ToDoViewModel: ObservableObject{
    @Published var items: [ItemModel] = []
    
    init(){
        items = [
            ItemModel(title: "Lol, good luck, boy", isDone: true),
            ItemModel(title: "My first target", isDone: false),
            ItemModel(title: "Just get out of hear", isDone: false)
        ]
        self.sortItems()
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func changeIsDone(item: ItemModel){
        if let index = items.firstIndex(where: { existingItem in return existingItem.id == item.id }) {
            items[index] = item.getReverseItem()
        }
    }
    
    func insertNewItem(title: String){
        items.append(ItemModel(title: title, isDone: false))
        
    }
    
    private func sortItems(){
        items.sort { item1, item2 in
            if item1.isDone{
                return false
            }
            return true
        }
    }
}
