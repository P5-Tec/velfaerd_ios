//
//  QuizResultRow.swift
//  Velfaerds
//
//  Created by Patrick Saxbeck on 13/01/2022.
//

import SwiftUI

struct QuizResultRow: View {
    var question: Question
    
    var body: some View {
        HStack{
            question.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(question.styrkeName)
            Spacer()
            Text(String(format:"%.0f",question.answer))
                .multilineTextAlignment(.trailing)
        }
    }
}

struct QuizResultRow_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultRow(question: questions[0]).previewLayout(.fixed(width: 300, height: 70))
    }
}
