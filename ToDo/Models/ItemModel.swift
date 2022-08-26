//
//  ItemModel.swift
//  ToDo
//
//  Created by Daniil on 25.08.2022.
//

import Foundation
struct ItemModel: Identifiable, Codable{
    let id = UUID().uuidString
    let title: String
    let isDone: Bool
    
    func getReverseItem() -> ItemModel{
        return ItemModel(title: title, isDone: !isDone)
    }
}
