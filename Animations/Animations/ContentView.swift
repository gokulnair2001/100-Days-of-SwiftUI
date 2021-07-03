//
//  ContentView.swift
//  Animations
//
//  Created by Gokul Nair on 03/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationStatus = false
    
    var body: some View {
        Button("Tap me"){
            self.animationStatus.toggle()
        }
        .padding(50)
        .frame(width: 200, height: 300, alignment: .center)
        .background(animationStatus ? Color.blue : Color.green)
        .animation(.default)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: animationStatus ? 120 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
