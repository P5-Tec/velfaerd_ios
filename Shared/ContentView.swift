//
//  ContentView.swift
//  Shared
//
//  Created by Patrick Saxbeck on 29/11/2021.
//

import SwiftUI

struct ContentView: View {
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
        }
    }
}
