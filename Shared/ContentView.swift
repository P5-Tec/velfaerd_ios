//
//  ContentView.swift
//  Shared
//
//  Created by Patrick Saxbeck on 29/11/2021.
//

import SwiftUI

struct ContentView: View {
    //@StateObject var questionManager = QuestionsManager()
#if os(iOS)
    @Environment(\.horizontalSizeClass)
    private var horizontalSizeClass
#endif
    
    var body: some View {
            #if os(iOS)
            if(horizontalSizeClass == .compact){
                TabBarMenu()
            } else {
                NavigationView{
                    SideBarMenu()
                    HomeView()
                }
            }
            #else
                SideBarMenu()
            #endif
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
            .previewInterfaceOrientation(.portrait)
        
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 6s")).previewDisplayName("iPhone 6s")
        
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 7")).previewDisplayName("iPhone 7")
        
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 8")).previewDisplayName("iPhone 8")
        
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 12")).previewDisplayName("iPhone 12")
        }
    }
}
