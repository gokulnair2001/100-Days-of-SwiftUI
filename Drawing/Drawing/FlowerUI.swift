//
//  FlowerUI.swift
//  Drawing
//
//  Created by Gokul Nair on 01/12/21.
//

import SwiftUI

struct Flower: Shape {
    
    var petalOffset = -20.0
    var petalWidth = 100.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from: 0, to: Double.pi*2, by: Double.pi/8) {
            let rotation = CGAffineTransform(rotationAngle: number)
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width/2, y: rect.height/2))
            
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width/2))
            
            let rotatedPetal = originalPetal.applying(position)
            
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}

struct FlowerUI: View {
    
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        NavigationView {
            VStack {
                Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                    .fill(.red, style: FillStyle(eoFill: true))
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Offset")
                            .bold()
                        Text("(\(String(format: "%.2f", petalOffset)))")
                            .font(.caption)
                    }
                    Slider(value: $petalOffset, in: -40...40)
                    
                    HStack {
                        Text("Width")
                            .bold()
                        Text("(\(String(format: "%.2f", petalWidth)))")
                            .font(.caption)
                    }
                    Slider(value: $petalWidth, in: 0...100)
                }.padding([.horizontal, .bottom])
            }
            .navigationTitle("Drawing")
            .preferredColorScheme(.dark)
        }
    }
}

struct FlowerUI_Previews: PreviewProvider {
    static var previews: some View {
        FlowerUI()
    }
}
