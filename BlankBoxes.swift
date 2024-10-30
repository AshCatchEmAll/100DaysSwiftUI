//
//  BlankBoxes.swift
//  WordWhirl
//
//  Created by Aashish Vichare on 2024-10-30.
//

import SwiftUI

struct BlankBoxes : View{
    let columns = Array(repeating: GridItem(.flexible()), count: 6)
    var body : some View{
        Divider()
        VStack{
            LazyVGrid(columns: columns, spacing: 5){
                ForEach(0..<12){ _ in
                    Rectangle()
                        .strokeBorder(
                            Color.black,
                            style: StrokeStyle(lineWidth: 1, dash: [2]))
                        
                        .frame(width: 30, height: 30)
                }
            }.padding()
            
            Divider()
        }
       
        
    }
}


#Preview {
    BlankBoxes()
}
