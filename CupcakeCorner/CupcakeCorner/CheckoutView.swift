//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Gokul Nair on 02/12/21.
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var order = Order()
    
    @State private var confirmationMessage = ""
    @State private var showingMessage = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) {phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    }else if phase.error != nil {
                        Text("Error in loading")
                    }else {
                        ProgressView()
                    }
                }.frame(height: 233)
                
                Text("Your total is: \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order"){
                    Task {
                        await placeOrder()
                    }
                }
                    .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank you!", isPresented: $showingMessage) {
            Button("Ok"){
                
            }
        }message: {
            Text(confirmationMessage)
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Encoding Failed")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity)X\(Order.types[decodedOrder.type].lowercased()) cupcake is on its way!"
            showingMessage = true
        }catch {
            print("Checkout failed")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
