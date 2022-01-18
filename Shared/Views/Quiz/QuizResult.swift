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
    
    var body: some View {
        VStack{
            question.image
            //Rectangle().frame(height:280).padding()
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
                ShareSheet(qImage: question.imageName, shareMsg:"Test msg")
            }.padding()
        }.navigationTitle("Share page")
            .navigationBarBackButtonHidden(false)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    var qImage: String
    var shareImage: UIImage
    var shareMsg: String
    let imageProvider: NSItemProvider
    
    init(qImage: String, shareMsg: String){
        self.qImage = qImage
        self.shareMsg = shareMsg
        self.shareImage = UIImage(named: qImage)!
        self.imageProvider = NSItemProvider(object: shareImage)
    }

    func makeUIViewController(context: Context) -> some UIActivityViewController {
        let controller = UIActivityViewController(activityItems: [shareImage,shareMsg], applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

struct QuizResult_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            QuizResult(question: questions[0])
        }
        
        QuizResult(question: questions[0]).previewDevice(PreviewDevice(rawValue: "iPhone 6s")).previewDisplayName("iPhone 6s")
        
        QuizResult(question: questions[0]).previewDevice(PreviewDevice(rawValue: "iPhone 7")).previewDisplayName("iPhone 7")
        
        QuizResult(question: questions[0]).previewDevice(PreviewDevice(rawValue: "iPhone 8")).previewDisplayName("iPhone 8")
        
        QuizResult(question: questions[0]).previewDevice(PreviewDevice(rawValue: "iPhone 12")).previewDisplayName("iPhone 12")
    }
}
