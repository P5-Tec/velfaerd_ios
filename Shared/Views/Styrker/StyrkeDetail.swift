//
//  StyrkeDetail.swift
//  Velfaerds
//
//  Created by Patrick Saxbeck on 30/11/2021.
//

import SwiftUI

struct StyrkeDetail: View {
    var styrke: Question
    
    var body: some View {
        VStack{
            styrke.image
            VStack(alignment: .leading) {
                Text(styrke.styrkeName).font(.title)
                HStack {
                    Text(styrke.styrkeTxt)
                }
            }.padding()
            Spacer()
        }
        .navigationBarTitle(styrke.styrkeName)
        .navigationBarTitleDisplayMode(.inline)
        .offset(x: 0, y: 50)
    }
}

struct StyrkeDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        StyrkeDetail(styrke: questions[0])
        }
    }
}
	
