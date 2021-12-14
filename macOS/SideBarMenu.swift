//
//  SwiftUIView.swift
//  Velfaerds (macOS)
//
//  Created by Patrick Saxbeck on 01/12/2021.
//

import SwiftUI

struct SideBarMenu: View {
    var body: some View {
        List{
            NavigationLink(destination: HomeView(), label: {
                Label("Home", systemImage: "house.fill")
            })
            NavigationLink(destination: QuizPage(), label: {
                Label("Quiz", systemImage: "person.crop.circle")
            })
            NavigationLink(destination: StyrkeList(), label: {
                Label("De 24 Styrker", systemImage: "person.crop.circle")
            })
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Menu")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

struct SideBarMenu_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SideBarMenu()
        }
.previewInterfaceOrientation(.landscapeLeft)
    }
}
