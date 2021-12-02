//
//  Playmage.swift
//  Drawing
//
//  Created by Gokul Nair on 01/12/21.
//

import SwiftUI

struct Playmage: View {
    
    @State private var amount = 0.0
    
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0, blue: 0))
                    .frame(width: 200*amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 1, blue: 0))
                    .frame(width: 200*amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 0, blue: 1))
                    .frame(width: 200*amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            VStack(alignment: .leading){
                Text("Slide")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
                Slider(value: $amount)

            }.padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .preferredColorScheme(.dark)
    }
}

struct Playmage_Previews: PreviewProvider {
    static var previews: some View {
        Playmage()
    }
}
