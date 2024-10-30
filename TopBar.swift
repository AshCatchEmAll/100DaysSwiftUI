//
//  TopBar.swift
//  WordWhirl
//
//  Created by Aashish Vichare on 2024-10-30.
//

import SwiftUI

struct TopBar: View {

    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "questionmark.circle")
                .foregroundColor(.black)  // Set the color of the question mark
                .imageScale(.large)  // Scale of the image
            Spacer()
            ForEach(0..<3) { _ in
                Image(systemName: "heart")
                    .foregroundColor(.black)  // Set the color of the question mark
                    .imageScale(.large)  //
            }
            Spacer()
            Text("Score: 0")
            Spacer()

        }
        .padding()
    }
}

#Preview {
    TopBar()
}
