//
//  QuizPage.swift
//  Velfaerds
//
//  Created by Patrick Saxbeck on 01/12/2021.
//

import SwiftUI

struct QuizPage: View {
    
    @StateObject var viewModel = QuestionsManager()
    @StateObject var videoVm: VideoViewViewModel = VideoViewViewModel()
    @State var question: Question
    //here to videocard
    @State var shouldUpdate: Bool = false
    
    var body: some View {
        VStack{
            NavigationLink("", destination: QuizSelectResult(viewModel: viewModel), isActive: $viewModel.reachedEnd)
            VideoCard(videoUrl: $viewModel.question.video, shouldUpdate: $shouldUpdate).frame(width: nil, height:200).padding([.leading, .bottom, .trailing])
            HStack{
                VStack(alignment: .leading){
                    Text(viewModel.question.styrkeName).font(.title)
                    Text(viewModel.question.styrkeTxt).font(.body)
                }
            }.padding(.horizontal)
            HStack{
                Slider(value: $viewModel.question.answer, in: 1...5, step: 1) {
                    Text("Styrke value")}
                    minimumValueLabel: { Text("1")}
                    maximumValueLabel: { Text("5")}
            }.padding(.horizontal)
            Spacer()
            HStack{
                Button(action: {
                    viewModel.goToPrevQuestion()
                    self.shouldUpdate.toggle()},
                       label: {Text("Previous Question")})
                    .padding(.horizontal)
                Spacer()
                Button(action: {
                    viewModel.goToNextQuestion()
                    self.shouldUpdate.toggle()},
                       label: {Text("Next Question")}).padding()
            }.padding()
        }.navigationTitle("📝Quiz")
    }
}

struct QuizPage_Previews: PreviewProvider {
    static var shouldUpdate = false
    
    static var previews: some View {
        NavigationView {
            QuizPage(question: questions[0], shouldUpdate:shouldUpdate).environmentObject(QuestionsManager()).previewDevice(PreviewDevice(rawValue: "iPhone 6s")).previewDisplayName("iPhone 6s")
        }
    }
}
