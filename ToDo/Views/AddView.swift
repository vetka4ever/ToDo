//
//  AddView.swift
//  ToDo
//
//  Created by Daniil on 25.08.2022.
//

import SwiftUI

struct AddView: View {
    @Environment (\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: ToDoViewModel
    
    @State var newTarget: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Input new target", text: $newTarget)
                
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
                    .cornerRadius(14)
                
                Button(action: buttonAction) {
                    Text("Save".uppercased())
                        .padding(.vertical)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(14)
                }
                
            }
            .padding(.horizontal)
            .navigationTitle("Add target")
            
        }
        
    }
    
    func buttonAction(){
        viewModel.insertNewItem(title: newTarget)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        
    }
}
