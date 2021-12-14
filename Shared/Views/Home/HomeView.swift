//
//  HomeView.swift
//  Velfaerds
//
//  Created by Patrick Saxbeck on 01/12/2021.
//

import SwiftUI
import AVKit

struct HomeView: View {
    
     private var introUrl: URL = (Bundle.main.url(forResource: "introvid", withExtension: "mp4")!)
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                HStack {Image("vfvoeLogo").resizable().aspectRatio(contentMode: .fit).padding()}
                HStack {Image("tecLogo").resizable().aspectRatio(contentMode: .fit).padding()}
            }.padding()
            Spacer()
            VStack{
                HStack {
                    VideoView(videoURL: introUrl).frame(width: nil, height: 300)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.2), radius: 30, x: 0, y: 2)
                        .ignoresSafeArea()
               }.padding()
            }
            Spacer()
        }.navigationTitle("Home")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()}
.previewInterfaceOrientation(.portrait)
    }
}
