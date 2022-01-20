//
//  VideoCard.swift
//  Velfaerds (iOS)
//
//  Created by Patrick Saxbeck on 17/01/2022.
//

import SwiftUI

struct VideoCard: View {
    @Binding var videoUrl: URL
    //here -> videoview
    @Binding var shouldUpdate: Bool
    @State var showPlayerIcon: Bool = true
    @State var isPlaying: Bool = false
    @StateObject var videoVm: VideoViewViewModel = VideoViewViewModel()
    
    var body: some View {
        VStack{
            ZStack{
                VideoView(videoURL: $videoUrl, isPlaying: $isPlaying, shouldUpdate: $shouldUpdate, videoVm: self.videoVm)
                    if showPlayerIcon {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 20,idealWidth: 40, maxWidth: 40, minHeight: 20, idealHeight: 40, maxHeight: 40, alignment: .center)
                            .foregroundColor(Color.blue)
                    }
            }.onTapGesture {
                videoVm.isPlaying.toggle()
                showPlayerIcon.toggle()
            }
        }
}

struct VideoCard_Previews: PreviewProvider {
    static var url: URL = (Bundle.main.url(forResource: "introvid", withExtension: "mp4")!)
    
    static var tst: VideoViewViewModel = VideoViewViewModel()
    
    static var previews: some View {
        VideoCard(videoUrl: .constant((url)), shouldUpdate:.constant(false), videoVm:tst)
    }
}
}
