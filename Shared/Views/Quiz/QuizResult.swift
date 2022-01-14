//
//  QuizResult.swift
//  Velfaerds
//
//  Created by Patrick Saxbeck on 14/01/2022.
//

import SwiftUI

struct QuizResult: View {
    @State private var showingSheet = false
    var question: Question
    @State var Sitems : [Any] = []
    
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
            Spacer()
            Button("Share result"){
                showingSheet.toggle()
            }.sheet(isPresented: $showingSheet){
                ShareSheet()
            }.padding()
        }.navigationTitle("Share page")
            .navigationBarBackButtonHidden(false)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ShareSheet : UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    let url = URL(string: "https://news.ycombinator.com/")
    
    func makeUIViewController(context: Context) -> some UIActivityViewController {
        let controller = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        return controller
    }
}

struct QuizResult_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            QuizResult(question: questions[0])
        }
    }
}
