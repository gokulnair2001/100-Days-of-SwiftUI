//
//  ContentView.swift
//  Word Scramble
//
//  Created by Gokul Nair on 01/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var newWord = ""
    @State private var rootWord = ""
    @State private var score = Int()
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showError = false
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Enter word", text: $newWord, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
                List(usedWords, id: \.self){
                    Text($0)
                       Spacer()
                    Image(uiImage: UIImage(systemName: "\($0.count).circle")!)
                        .renderingMode(.original)
                }
                Text("Score:\(score)")
                    .font(.headline)
            }
            .navigationTitle(rootWord)
            .navigationBarItems(trailing: Button(action: startGame){
                Text("ReStart")
            })
            .onAppear(perform: startGame)
            .alert(isPresented: $showError, content: {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("Ok")))
            })
        }
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord.lowercased()
        
        for letter in word {
            if let pos =  tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
            }else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misSpelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misSpelledRange.location == NSNotFound
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "Apple"
                usedWords.removeAll()
                newWord = ""
                score = 0
                return
            }
        }
        fatalError("Could not load star.txt")
    }
    
    func validWordLength(word: String) -> Bool {
        if newWord.count >= 3 {
            return true
        }else {
            return false
        }
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showError = true
    }
    
    func addNewWord() {
        let answer = newWord.trimmingCharacters(in: .whitespacesAndNewlines)
        guard  answer.count>0 else {
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            newWord = ""
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not recognised", message: "cant make up words")
            newWord = ""
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Its not possible", message: "That isn't real!")
            newWord = ""
            return
        }
        
        guard validWordLength(word: answer) == true else {
            wordError(title: "Not a valid word", message: "min word length is 4")
            newWord = ""
            return
        }
        
        usedWords.insert(newWord, at: 0)
        score = score + newWord.count
        newWord = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
