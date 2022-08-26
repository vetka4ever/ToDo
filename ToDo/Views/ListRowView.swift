//
//  ListRowView.swift
//  ToDo
//
//  Created by Daniil on 25.08.2022.
//

import SwiftUI

struct ListRowView: View{
    let title: String
    let isDone: Bool
    
    var body: some View{
        HStack{
            isDone
            ? (Image(systemName: "checkmark.circle")
                .foregroundColor(.green))
            : (Image(systemName: "circle")
                .foregroundColor(.red))
            Text(title)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(title: "Hello", isDone: false)
            .previewLayout(.sizeThatFits)
    }
}
