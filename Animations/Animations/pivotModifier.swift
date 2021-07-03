//
//  pivotModifier.swift
//  Animations
//
//  Created by Gokul Nair on 03/07/21.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: 90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct pivotModifier: View {
    
    @State private var isVisible = false
    var body: some View {
    
        VStack {
            Button("Tap") {
                withAnimation{
                    self.isVisible.toggle()
                }
            }
            
            if isVisible {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
    }
}

struct pivotModifier_Previews: PreviewProvider {
    static var previews: some View {
        pivotModifier()
    }
}
