//
//  first.swift
//  trial
//
//  Created by Gokul Nair on 29/06/21.
//

import SwiftUI
//MARK:- Custom Modifier creation 
struct CapsuleText: View {
    var text:String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

struct first: View {
    var body: some View {
        CapsuleText(text: "Hello")
    }
}

struct first_Previews: PreviewProvider {
    static var previews: some View {
        first()
    }
}
