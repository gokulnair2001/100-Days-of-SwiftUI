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
           // AngularGradient(gradient: Gradient(colors: [.red, .green, .yellow, .blue, .purple, .red]), center: .center)
              //  .edgesIgnoringSafeArea(.all)
            
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.3), location: 0.26)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()

            VStack(spacing: 40) {
                Spacer()
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
                
                Text("Score: \(score)")
                    //.font(.footnote)
                    .bold()
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .background(.ultraThinMaterial)
            
            
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
