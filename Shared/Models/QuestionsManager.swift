//
//  QuestionsManager.swift
//  Velfaerds
//
//  Created by Patrick Saxbeck on 11/01/2022.
//

import Foundation

class QuestionsManager: ObservableObject{
    private (set) var questions: [Question] = []
    @Published private(set) var length = 0
    @Published private (set) var index = 0
    @Published private (set) var reachedEnd = false
    
    init(){
        Task.init{
            await fetchQuestions()
        }
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
            }
        }
    }
    
    func goToNextQuestion(){
        if index + 1 < length{
            index += 1
        } else {
            reachedEnd = true
        }
    }
    
    func setQuest() -> Question {
        return questions[index]
    }
}
