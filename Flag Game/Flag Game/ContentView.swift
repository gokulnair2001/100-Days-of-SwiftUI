//
//  ContentView.swift
//  Flag Game
//
//  Created by Gokul Nair on 29/06/21.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France","Germany","Ireland","Italy","Monaco","Nigeria","Poland","Russia","Spain","UK","US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .black]), startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .bold()
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                }.foregroundColor(.white)
                
                ForEach(0..<3){ number in
                    Button(action: {
                        self.flagTapped(number)
                    }, label: {
                        Image(self.countries[number]).renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2, x: 0.0, y: 0.0)
                    })
                }
                Spacer()
            }
        }.alert(isPresented: $showingScore, content: {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")){
                self.askQuestions()
            })
        })
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "True"
            score += 1
        }else {
            scoreTitle = "False"
        }
        showingScore = true
    }
    
    func askQuestions() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
