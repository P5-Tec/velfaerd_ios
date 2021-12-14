//
//  StyrkeRow.swift
//  Velfaerds
//
//  Created by Patrick Saxbeck on 29/11/2021.
//

import SwiftUI

struct StyrkeRow: View {
    var styrke: Question
    
    var body: some View {
        HStack{
            styrke.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(styrke.styrkeName)
            Spacer()
        }
    }
}

struct StyrkeRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            StyrkeRow(styrke: questions[0])
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
