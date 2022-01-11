//
//  QuizPage.swift
//  Velfaerds
//
//  Created by Patrick Saxbeck on 01/12/2021.
//

import SwiftUI

struct QuizPage: View {
    @State var sliderValue: Double = 3
    @EnvironmentObject var questionManager: QuestionsManager
    var question: Question
    
    var body: some View {
        VStack{
            Rectangle().frame(height:280).padding()
            HStack{
                VStack(alignment: .leading){
                    Text(question.styrkeName).font(.title)
                    Text(question.styrkeTxt).font(.body)
                }
                Spacer()
            }.padding()
            HStack{
                Slider(value: $sliderValue, in: 1...5, step: 1) {
                    Text("Styrke value")}
                    minimumValueLabel: { Text("1")}
                    maximumValueLabel: { Text("5")}
                }.padding()
            Spacer()
            HStack{
                Button(action: {print("Simple button")},
                       label: {Text("Next Question")})
                    .padding()
                Button(action: {print("Simple button")},
                       label: {Text("Next Question")}).padding()
            }.padding()
        }.navigationTitle("Quiz")
    }
}

struct QuizPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            QuizPage(question: questions[0]).environmentObject(QuestionsManager())
        }
    }
}
