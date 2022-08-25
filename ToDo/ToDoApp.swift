//
//  ToDoApp.swift
//  ToDo
//
//  Created by Daniil on 25.08.2022.
//

import SwiftUI

@main
struct ToDoApp: App {
    @StateObject var viewModel: ToDoViewModel = .init()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ToDoView()
            }.environmentObject(viewModel)
        }
    }
}
