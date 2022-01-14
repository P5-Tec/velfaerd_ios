//
//  questionModel.swift
//  Velfaerds
//
//  Created by Patrick Saxbeck on 29/11/2021.
//

import Foundation
import SwiftUI

struct Question: Hashable, Codable, Comparable, Identifiable{
    static func < (lhs: Question, rhs: Question) -> Bool {
        lhs.answer < rhs.answer
    }
    
    static func > (lhs: Question, rhs: Question) -> Bool {
        lhs.answer > rhs.answer
    }
    
    var id: Int
    var styrkeName: String
    var styrkeTxt: String
    var answer: Double
    
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    init(){
        self.id = 0
        self.styrkeName = "None"
        self.styrkeTxt = "None"
        self.imageName = "None"
        self.answer = 0
    }
}

extension Double {
    func toInt() -> Int? {
        let roundedVal = rounded(.toNearestOrEven)
        return Int(exactly: roundedVal)
    }
}
