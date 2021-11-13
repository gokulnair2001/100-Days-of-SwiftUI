//
//  ContentView.swift
//  iExpense
//
//  Created by Gokul Nair on 09/07/21.
//

import SwiftUI

struct User {
    var firstName = "Gokul"
    var lastName = "Nair"
}

struct ContentView: View {
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Name: \(user.firstName) \(user.lastName)")
            TextField("FirstName", text: $user.firstName)
            TextField("LastName", text: $user.lastName)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
