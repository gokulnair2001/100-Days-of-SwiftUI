//
//  ContentView.swift
//  trial
//
//  Created by Gokul Nair on 29/06/21.
//

import SwiftUI



//MARK:- Creation of Custom View Modifier 
struct waterMark:ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomLeading) {
            content
            Text(text)
                .foregroundColor(.yellow)
                .padding(5)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

extension View {
    func applyWaterMark(with text: String) -> some View {
        self.modifier(waterMark(text: text))
    }
}

//MARK:- Content view
struct ContentView: View {
    var body: some View {
        Color.blue
            .frame(width: 200, height: 200, alignment: .center)
            .applyWaterMark(with: "Gokul Nair")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
