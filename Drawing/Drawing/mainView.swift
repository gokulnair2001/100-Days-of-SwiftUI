//
//  mainView.swift
//  Drawing
//
//  Created by Gokul Nair on 01/12/21.
//

import SwiftUI

struct CardModifier: View {
   
    let color: [Color]
    
    let title: String
    
    let imageName: String
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottomLeading) {
                LinearGradient(gradient: Gradient(colors: color), startPoint: .bottom, endPoint: .topTrailing)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .frame(height: 220)
                        
                Text(title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.black.opacity(0.9))
                    .padding()
            }
            
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .foregroundColor(.black)
                .font(Font.title.weight(.semibold))
                .padding()
            
        }.padding()
    }
}

struct mainView: View {
  
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    NavigationLink{
                        ContentView()
                    }label: {
                        CardModifier(color: [.red, .yellow, .blue], title: "Practice", imageName: "gear")
                    }
                    
                    NavigationLink{
                        FlowerUI()
                    }label: {
                        CardModifier(color: [.red, .yellow, .green],  title: "Flower", imageName: "leaf")
                    }
                    
                    NavigationLink{
                        Spectrum()
                    }label: {
                        CardModifier(color: [.red, .yellow, .indigo], title: "Spectrum", imageName: "sun.max")
                    }
                    
                    NavigationLink{
                        Playmage()
                    }label: {
                        CardModifier(color: [.red, .yellow, .white], title: "Playmage", imageName: "rectangle.3.group")
                    }
                    
                    NavigationLink{
                        CheckerBoard()
                    }label: {
                        CardModifier(color: [.red, .yellow, .mint], title: "Checker", imageName: "checkerboard.rectangle")
                    }
                    
                }
            }
            
            .navigationTitle("Menu")
            .preferredColorScheme(.dark)
        }
    }
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}
