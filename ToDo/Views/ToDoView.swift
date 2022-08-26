//
//  ContentView.swift
//  ToDo
//
//  Created by Daniil on 25.08.2022.
//

import SwiftUI

struct ToDoView: View {
    
    @EnvironmentObject var viewModel: ToDoViewModel
    
    var body: some View {
        ZStack{
            if viewModel.accessToItems.count > 0{
                List{
                    ForEach(viewModel.accessToItems) { item in
                        ListRowView(title: item.title, isDone: item.isDone)
                            .onTapGesture {
                                
                                    viewModel.changeIsDone(item: item)
                                
                            }
                    }
                    .onDelete(perform: viewModel.deleteItem)
                    .onMove(perform: viewModel.moveItem)
                }
                
                .listStyle(InsetGroupedListStyle())
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: NavigationLink(
                        destination: { AddView().environmentObject(viewModel)},
                        label: {Text("Add")
                                .bold()
                        })
                )
            }
            else{
                NoItemView()
            }
        }
        .navigationTitle("To Do")
    }
    
    
    
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ToDoView()
                .environmentObject(ToDoViewModel())
        }
        
    }
}
