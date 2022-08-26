//
//  ToDoViewModel.swift
//  ToDo
//
//  Created by Daniil on 25.08.2022.
//

import Foundation
class ToDoViewModel: ObservableObject{
    //MARK: - Properties
    @Published private var items: [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    private var itemsKey = "itemsKey"
    
    //MARK: - Initialization
    init(){
        getItems()
    }
    //MARK: - Access to property
    
    var accessToItems: [ItemModel]{
        get{
            return self.items
        }
    }
    
    //MARK: - Methods
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
    
    //MARK: - Private Methods
    private func getItems(){
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let newItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else{return}
        items = newItems
    }
    
    private func saveItems(){
        if let data = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(data, forKey: itemsKey)
        }
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
