//
//  GridStack.swift
//  trial
//
//  Created by Gokul Nair on 29/06/21.
//

import SwiftUI

struct GridStack<Content: View> : View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows){ row in
                HStack {
                    ForEach(0..<columns){ column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
    init(rows: Int, columns: Int, @ViewBuilder Content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = Content
    }
}

struct Grid: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, column in
           // HStack {
                Image(systemName: "\(row*4 + column).circle")
                Text("R\(row) C\(column)")
           // }
        }
    }
}

struct GridStack_Previews: PreviewProvider {
    static var previews: some View {
        Grid()
    }
}
