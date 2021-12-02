//
//  ContentView.swift
//  Musico
//
//  Created by Gokul Nair on 02/12/21.
//

import SwiftUI

struct Response: Codable {
    var resultCount: Int
    var results: [Results]
}

struct Results: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    
    @State private var count = 0
    @State private var results = [Results]()
    @State private var artistName = "Arijit Singh"
    
    var body: some View {
        
        NavigationView{
           
            VStack{
                
                HStack {
                    TextField("Artist", text: $artistName)
                        .textFieldStyle(.roundedBorder)
                    
                    Button{
                        
                        Task{
                            await loadData(artistName)
                        }
                    }label: {
                        Image(systemName: "magnifyingglass")
                    }
                    
                }  .padding()
                
                List(results, id: \.trackId) { item in
                    VStack(alignment: .leading){
                        Text(item.trackName)
                            .font(.headline)
                        Text(item.collectionName)
                    }
                }
            }
            
            .navigationTitle("Songs")
        }.task {
            await loadData(artistName)
        }
    }
    
    func loadData(_ name: String) async{
        
        let firstAlter = name.trimmingCharacters(in: .whitespaces)
        let secondAlter = firstAlter.lowercased()
        let finalAlter = secondAlter.replacingOccurrences(of: " ", with: "+")
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(finalAlter)&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){
                count = decodedResponse.resultCount
                results = decodedResponse.results
            }
        }catch {
            print("Invalid Data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

