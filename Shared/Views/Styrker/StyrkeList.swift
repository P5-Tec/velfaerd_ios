//
//  StyrkeList.swift
//  Velfaerds (iOS)
//
//  Created by Patrick Saxbeck on 29/11/2021.
//

import SwiftUI

struct StyrkeList: View {
    var body: some View {
        List(questions){ styrke in
            NavigationLink{
                StyrkeDetail(styrke: styrke)
            } label: {
                StyrkeRow(styrke: styrke)
            }
        }.navigationTitle("De 24 Styrker")
    }
}

struct StyrkeList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            StyrkeList()
        }
    }
}
