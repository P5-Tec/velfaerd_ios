//
//  QuizSelectResult.swift
//  Velfaerds
//
//  Created by Patrick Saxbeck on 13/01/2022.
//

import SwiftUI

struct QuizSelectResult: View {
    @StateObject var viewModel: QuestionsManager
    
    var body: some View {
        VStack{
            List(viewModel.questions.sorted(by: >).prefix(5)){ item in
                NavigationLink{
                    QuizResult(question: item)
                }label: {
                    QuizResultRow(question: item)
                }
            }
        }.navigationTitle("Vælg din styrke")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct QuizSelectResult_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            QuizSelectResult(viewModel: QuestionsManager())
        }
    }
}
