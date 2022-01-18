//
//  iPhoneMenu.swift
//  Velfaerds (iOS)
//
//  Created by Patrick Saxbeck on 01/12/2021.
//

import SwiftUI

struct TabBarMenu: View {
    @State public var defaultSelection = 2
    var body: some View {
        TabView(selection: $defaultSelection){
            NavigationView{ StyrkeList()}
            .tabItem{
                //Image(systemName: "list.dash")
                Image(systemName: "list.bullet.rectangle.portrait")
                Text("De 24 Styrker")
            }.tag(1)
                
            NavigationView{ HomeView()}
            .tabItem{
                Image(systemName: "house.fill")
                Text("Home")
            }.tag(2)
            
            NavigationView{ QuizPage(question: questions[0])}
            .tabItem{
                Image(systemName: "brain.head.profile")
                Text("Quiz")
            }.tag(3)
        }
    }
}

struct TabBarMenu_Previews: PreviewProvider {
    static var previews: some View {
            TabBarMenu()
    }
}
