//
//  questionModel.swift
//  Velfaerds
//
//  Created by Patrick Saxbeck on 29/11/2021.
//

import Foundation
import SwiftUI

struct Question: Hashable, Codable, Identifiable{
    var id: Int
    var styrkeName: String
    var styrkeTxt: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
