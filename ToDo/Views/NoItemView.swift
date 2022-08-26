//
//  NoItemView.swift
//  ToDo
//
//  Created by Daniil on 26.08.2022.
//

import SwiftUI

struct NoItemView: View {
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                    
                    
                Text("Hey dude. I'm sure you're productive person & think you should add new target for improve your live😉")
                    .padding(.bottom, 20)
                    
                NavigationLink(destination: AddView()) {
                    Text("Add target")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(animate ? Color.accentColor : Color("SecondaryColor"))
                        .cornerRadius(20)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .shadow(color: animate ? Color.accentColor : Color("SecondaryColor"),
                        radius: 12,
                        x: 0,
                        y: 0)
                .offset(y: animate ? 0 : -7)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            
        }
        .onAppear(perform: animatePerform)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func animatePerform(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(
                Animation
                    .easeInOut(duration: 1.2)
                    .repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemView()
        }
        
    }
}
