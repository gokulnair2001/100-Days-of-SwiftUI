//
//  second.swift
//  Animations
//
//  Created by Gokul Nair on 03/07/21.
//

import SwiftUI

struct second: View {
    @State private var animationNumber = 0
    @State private var dragAmount = CGSize.zero
    var body: some View {
        VStack{
            
            Text("Hold the card and drag to test the 'Gesture' feature")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
            
            LinearGradient(gradient: Gradient(colors: [.yellow, .pink]), startPoint: .bottom, endPoint: .top)
                .frame(width: 300, height: 200, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 25.0 ))
                .rotation3DEffect(
                    .degrees(Double(animationNumber)),
                    axis: (x: 1.0, y: 1.0, z: 3.0), perspective: 1.0)
                .offset(dragAmount)
                .gesture(
                    DragGesture().onChanged{self.dragAmount = $0.translation}
                        .onEnded{_ in
                            withAnimation(.spring()){
                                self.dragAmount = .zero
                            }
                        }
                )
                .padding(50)
                
            Button("Rotate"){
                withAnimation{
                    self.animationNumber += 360
                }
            }.frame(width: 280, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 70.0))
            .foregroundColor(.red)
            .textCase(.uppercase)
            .font(.headline)
            
        }
    }
}

struct second_Previews: PreviewProvider {
    static var previews: some View {
        second()
    }
}
