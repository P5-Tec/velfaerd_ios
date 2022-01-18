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
    
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    
    var videoName: String
    var video: URL {
        get{
            let u:URL = (Bundle.main.url(forResource: videoName, withExtension: "mp4")!)
            return u
        }
        set{
            print("sets nothing")
        }
    }
    
    init(){
        self.id = 0
        self.styrkeName = "None"
        self.styrkeTxt = "None"
        self.imageName = "None"
        self.answer = 0
        self.videoName = ""
    }
}

extension Double {
    func toInt() -> Int? {
        let roundedVal = rounded(.toNearestOrEven)
        return Int(exactly: roundedVal)
    }
}
