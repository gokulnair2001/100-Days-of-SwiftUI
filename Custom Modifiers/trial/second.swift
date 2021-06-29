//
//  second.swift
//  trial
//
//  Created by Gokul Nair on 29/06/21.
//

import SwiftUI
//MARK:- Creation of View Modifier (1)
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding()
            .foregroundColor(.black)
            .background(Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct second: View {
    var body: some View {
       Text("Hello")
        .titleStyle()
    }
}

struct second_Previews: PreviewProvider {
    static var previews: some View {
        second()
    }
}
