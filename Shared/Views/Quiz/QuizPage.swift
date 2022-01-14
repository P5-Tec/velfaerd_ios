//
//  QuizPage.swift
//  Velfaerds
//
//  Created by Patrick Saxbeck on 01/12/2021.
//

import SwiftUI

struct QuizPage: View {
    @StateObject var viewModel = QuestionsManager()
    var question: Question
    
    var body: some View {
        VStack{
            NavigationLink("", destination: QuizSelectResult(viewModel: viewModel), isActive: $viewModel.reachedEnd)
            Rectangle().frame(height:280).padding()
            HStack{
                VStack(alignment: .leading){
                    Text(viewModel.question.styrkeName).font(.title)
                    Text(viewModel.question.styrkeTxt).font(.body)
                }
                Spacer()
            }.padding()
            HStack{
                Slider(value: $viewModel.question.answer, in: 1...5, step: 1) {
                    Text("Styrke value")}
                    minimumValueLabel: { Text("1")}
                    maximumValueLabel: { Text("5")}
                }.padding()
            Spacer()
            HStack{
                Button(action: {
                    viewModel.goToPrevQuestion()},
                       label: {Text("Previous Question")})
                    .padding()
                Spacer()
                Button(action: {
                    viewModel.goToNextQuestion()},
                       label: {Text("Next Question")}).padding()
            }.padding()
        }.navigationTitle("📝Quiz")
    }
}

struct QuizPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            QuizPage(question: questions[0]).environmentObject(QuestionsManager())
        }
    }
}
