//
//  LetterChoices.swift
//  WordWhirl
//
//  Created by Aashish Vichare on 2024-10-30.
//
import SwiftUI

struct LetterChoices: View {
    var columns = Array(repeating: GridItem(.flexible()), count: 6)
    
    let words = [
        "time", "person", "year", "way", "day",
        "thing", "man", "world", "life", "hand",
        "part", "child", "eye", "woman", "place",
        "work", "week", "case", "point", "government",
        "company", "number", "group", "problem", "fact",
        "be", "have", "do", "say", "get",
        "make", "go", "know", "take", "see",
        "come", "think", "look", "want", "give",
        "use", "find", "tell", "ask", "work",
        "seem", "feel", "try", "leave", "call",
    ]

    @State var randomWord: String?

    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            if let randomWord = randomWord {

                ForEach(randomWord.map { String($0) }, id: \.self) { letter in
                    ZStack {
                        Rectangle()
                            .strokeBorder(
                                Color.black,
                                style: StrokeStyle(lineWidth: 1, dash: [2]))

                            .frame(width: 50, height: 50).background(.white).padding(10)
                        Text(letter)
                            .font(.title)
                            .foregroundColor(.black)

                    }.padding(4)

                }

            }
        }
        .onAppear {
            randomWord = words.randomElement()
        }
    }
}

#Preview {
    LetterChoices()
}
