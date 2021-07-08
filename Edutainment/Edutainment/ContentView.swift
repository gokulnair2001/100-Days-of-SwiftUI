//
//  ContentView.swift
//  Edutainment
//
//  Created by Gokul Nair on 08/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var table = 2
    @State private var noOfQuestions = 0
    @State private var digitOne = 2
    @State private var digitTwo = 2
    @State private var answer = String()
    @State private var questionCounter = 0
    
    @State private var scoreTitle = String()
    @State private var score = 0
    @State private var isShowingAlert = false
    
    let questions = ["10", "20", "30"]
    
    
    var body: some View {
        NavigationView {
            
            VStack{
                Form{
                    Section {
                        Stepper(value: $table,in: 1...12, step: 1){
                            Text("\(table)'s table")
                        }
                        
                        Picker("Select no of Questions", selection: $noOfQuestions){
                            ForEach(0..<questions.count){
                                Text("\(questions[$0])")
                            }
                        }
                    }
                    
                    Section(header: Text("Question \(questionCounter)")){
                        Text("\(digitOne) X \(digitTwo) = ?")
                        TextField("Answer", text: $answer)
                            .keyboardType(.decimalPad)
                        Button("Submit"){
                            self.checkAnswer()
                        }
                    }
                }
                
                Text("Score: \(score)")
                    .font(.headline)
                
            }.onAppear(perform: {
                setQuestion()
            })
            .navigationTitle("Edutainment")
            .alert(isPresented: $isShowingAlert, content: {
                Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")){
                    //self.setQuestion()
                })
            })
        }
    }
    
    func setQuestion() {
        questionCounter += 1
        if questionCounter == Int(questions[noOfQuestions]) {
            scoreTitle = "Game Over"
            isShowingAlert = true
            score = 0
            setQuestion()
        }else{
            digitOne = Int.random(in: 1...table)
            digitTwo = Int.random(in: 1...100)
        }
    }
    
    func checkAnswer() {
        
        if answer == "" {
            isShowingAlert = true
            scoreTitle = "Enter valid ans"
        }else {
            if (digitOne * digitTwo) == Int(answer) {
                score += 1
                scoreTitle = "True"
                setQuestion()
            }else {
                scoreTitle = "False"
            }
            isShowingAlert = true
            answer = ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
