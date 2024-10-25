//
//
//  100Days SwiftUI
//
//  Created a simple Guessing game
// - Allow users to select options
// - Add at least 5 questions
// - Show score
// - Show alert for wront or correct answer
// - Show alert for final answer
//
import SwiftUI

enum ActiveAlert {
    case first, second
}

struct ProjectThree: View {
    private var questions = ["What is the capital of France?","Which planet is known as the Red Planet?","Who wrote the play 'Romeo and Juliet'","What is the largest ocean on Earth?"]
    private var answers: [String] = ["Paris","Mars","William Shakespeare","Atlantic Ocean"]
    @State private var score: Int = 0
    private var options: [[String]] = [["London","Paris","New York","Washington D.C."],["Mars","Jupiter","Saturn","Uranus"],["William Shakespeare","John Keats","William Butler Yeats","Edgar Allan Poe"],["Pacific Ocean","Atlantic Ocean","Indian Ocean","Arctic Ocean"] ]
    
    
    @State private var selectedOption: String = ""
    @State private var questionNumber = 0
   
    @State private var showAlert = false
       @State private var activeAlert: ActiveAlert = .first
    var body: some View {
        
        ZStack{
            LinearGradient(
                           gradient: Gradient(colors: [
                               Color(red: 0.70, green: 0.90, blue: 0.95),  // Approximate color for the top
                               Color(red: 0.60, green: 0.85, blue: 0.75)   // Approximate color for the bottom
                           ]),
                           startPoint: .top,
                           endPoint: .bottom
                       )
                       .edgesIgnoringSafeArea(.all)
                       
                       RadialGradient(
                           gradient: Gradient(colors: [
                               Color.white.opacity(0.9), // Transparent white
                               Color.clear               // Fully transparent
                           ]),
                           center: .bottomLeading,
                           startRadius: 5,
                           endRadius: 400
                       )
                       .blendMode(.overlay)
                       .edgesIgnoringSafeArea(.all)
            VStack(spacing:30){
                
                Text(questions[questionNumber]).fontWeight(.bold).foregroundStyle(.white).font(.system(size: 30))
                
                HStack( alignment: .lastTextBaseline,spacing:50){
                    Button(action: {
                        selectedOption = options[questionNumber][0]
                    }) {
                        Text(options[questionNumber][0]).foregroundStyle(.teal).fontWeight(.semibold)
                    }.buttonStyle(.bordered).tint( isThisSelected(sop: selectedOption, op: options[questionNumber][0]) ? .green : .teal)
                    
                    Button(action: {
                            selectedOption = options[questionNumber][1]
                    }) {
                        Text(options[questionNumber][1]).foregroundStyle(.teal).fontWeight(.semibold)
                    }.buttonStyle(.bordered).tint( isThisSelected(sop: selectedOption, op: options[questionNumber][1]) ? .green : .teal)
                }
                
                HStack( alignment: .lastTextBaseline,spacing:50){
                    Button(action: {
                            selectedOption = options[questionNumber][2]
                    }) {
                        Text(options[questionNumber][2]).foregroundStyle(.teal).fontWeight(.semibold)
                    }.buttonStyle(
                        .bordered
                    ).tint( isThisSelected(sop: selectedOption, op: options[questionNumber][2]) ? .green : .teal)
                    Button(action: {
                            selectedOption = options[questionNumber][3]
                    }) {
                        Text(options[questionNumber][3]).foregroundStyle(.teal).fontWeight(.semibold)
                    }.buttonStyle(.bordered).tint( isThisSelected(sop: selectedOption, op: options[questionNumber][3]) ? .green : .teal)
                    
                }
                
                HStack{
                   
                    if(questionNumber<4 && !selectedOption.isEmpty){
                        Button("Sign In", systemImage: "arrow.right", action: {
                            submitAnswer()
                            
                        })
                            .labelStyle(.iconOnly).tint(.black).buttonStyle(.borderedProminent)
                    }
                    
                   

                }
                
                Text("Score: \(score)")
                
            }.alert(isPresented: $showAlert) {
                switch activeAlert {
                           case .first:
                               return  Alert(title: Text("Incorrect Answer"), message: Text("The correct answer is \(answers[questionNumber])"), dismissButton: .default(Text("OK")){
                                   selectedOption=""
                                   
                                   
                                   if(questionNumber < questions.count-1){
                                       questionNumber += 1
                                   }
                                  
                               })
                           case .second:
                    return Alert(title:Text("Quiz Complete"), message: Text("Your score is \(score)"), dismissButton: .default(Text("OK")){
                        
                            questionNumber = 0
                            score = 0
                        
                    })
                           }
               
            }
        }
            
    }
    func submitAnswer() -> Void {
      if(questionNumber == questions.count-1){
         
          showAlert = true
          activeAlert = .second
         
          
          return
        }
           
        
        if(selectedOption == answers[questionNumber]){
            score += 1
            if(questionNumber < questions.count-1){
                questionNumber += 1
            }
          
        }else{
                showAlert = true
            activeAlert = .first
            
        }
        
        
    }
    
    
    func isThisSelected(sop:String,op:String)    -> Bool{
        return sop==op ? true : false
    }
    
}


#Preview {
    ProjectThree()
}
