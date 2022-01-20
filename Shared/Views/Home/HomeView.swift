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
                HStack {Image("vfvoeLogo").resizable().aspectRatio(contentMode: .fit)}
                HStack {Image("tecLogo").resizable().aspectRatio(contentMode: .fit)}
            }.padding()
            Spacer()
            VStack{
                HStack {
                    VideoCard(videoUrl: .constant(introUrl), shouldUpdate: .constant(false)).frame(width: nil, height: 250).cornerRadius(15)
               }.padding()
            }
            Spacer()
        }.navigationTitle("🏠Home")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{HomeView()}.previewInterfaceOrientation(.portrait)
        Group {
            NavigationView{HomeView()}.previewDevice(PreviewDevice(rawValue: "iPhone 12")).previewDisplayName("iPhone 12")
        }
    }
}
