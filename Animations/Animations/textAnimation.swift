//
//  textAnimation.swift
//  Animations
//
//  Created by Gokul Nair on 03/07/21.
//

import SwiftUI

struct textAnimation: View {
    
    let textString = Array("Gokul Nair")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        VStack{
            HStack {
                ForEach(0..<textString.count) {num in
                    Text(String(self.textString[num]))
                        .padding(10)
                        .font(.headline)
                        .textCase(.uppercase)
                        .background(enabled ? Color.blue : Color.red)
                        .offset(self.dragAmount)
                        .animation(Animation.default.delay(Double(num)/20))
                }
            }
            HStack {
                ForEach(0..<textString.count) {num in
                    Text(String(self.textString[num]))
                        .padding(10)
                        .font(.headline)
                        .textCase(.uppercase)
                        .background(enabled ? Color.blue : Color.red)
                        .offset(self.dragAmount)
                        .animation(Animation.default.delay(Double(num)/20))
                }
            }
            HStack {
                ForEach(0..<textString.count) {num in
                    Text(String(self.textString[num]))
                        .padding(10)
                        .font(.headline)
                        .textCase(.uppercase)
                        .background(enabled ? Color.blue : Color.red)
                        .offset(self.dragAmount)
                        .animation(Animation.default.delay(Double(num)/20))
                }
            }
            HStack {
                ForEach(0..<textString.count) {num in
                    Text(String(self.textString[num]))
                        .padding(10)
                        .font(.headline)
                        .textCase(.uppercase)
                        .background(enabled ? Color.blue : Color.red)
                        .offset(self.dragAmount)
                        .animation(Animation.default.delay(Double(num)/20))
                }
            }
            HStack {
                ForEach(0..<textString.count) {num in
                    Text(String(self.textString[num]))
                        .padding(10)
                        .font(.headline)
                        .textCase(.uppercase)
                        .background(enabled ? Color.blue : Color.red)
                        .offset(self.dragAmount)
                        .animation(Animation.default.delay(Double(num)/20))
                }
            }
            HStack {
                ForEach(0..<textString.count) {num in
                    Text(String(self.textString[num]))
                        .padding(10)
                        .font(.headline)
                        .textCase(.uppercase)
                        .background(enabled ? Color.blue : Color.red)
                        .offset(self.dragAmount)
                        .animation(Animation.default.delay(Double(num)/20))
                }
            }
        }
        .gesture(
            DragGesture()
                .onChanged{
                    self.dragAmount = $0.translation
                }
                .onEnded{_ in
                    self.dragAmount = .zero
                    self.enabled.toggle()
                }
        )
    }
}

struct textAnimation_Previews: PreviewProvider {
    static var previews: some View {
        textAnimation()
    }
}
