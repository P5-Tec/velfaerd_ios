//
//  QuestionsManager.swift
//  Velfaerds
//
//  Created by Patrick Saxbeck on 11/01/2022.
//

import Foundation
import CoreMedia

class QuestionsManager: ObservableObject{
    private (set) var questions: [Question] = []
    @Published var question = Question()
    @Published private(set) var length = 0
    @Published private (set) var index = 0
    @Published var reachedEnd = false
    
    init(){
        print("-> viewmodel init")
        Task.init{
            await fetchQuestions()
        }
    }
    
    deinit{
        print("-> viewModel deinit")
    }
    
    func fetchQuestions() async{
        let filename = "questions.json"
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        }catch{
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedData = try! decoder.decode([Question].self, from: data)
            
            DispatchQueue.main.async {
                self.questions = decodedData
                self.length = self.questions.count
                self.question = self.questions[self.index]
            }
        }
    }
    
    func goToNextQuestion(){
        setAnwser()
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func goToPrevQuestion(){
        if index > 0 {
            index -= 1
            reachedEnd = false
            setQuestion()
        }
    }
    
    func setQuestion(){
        self.question = self.questions[self.index]
    }
    
    func setAnwser(){
        self.questions[index].answer = question.answer
    }
    
    //TODO - Make a return of array sorted
}
