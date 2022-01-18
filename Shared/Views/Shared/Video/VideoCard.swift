//
//  VideoCard.swift
//  Velfaerds (iOS)
//
//  Created by Patrick Saxbeck on 17/01/2022.
//

import SwiftUI

struct VideoCard: View {
    @Binding var videoUrl: URL
    @State var ShowPlayerIcon: Bool = true
    @State var isPlaying: Bool = false
    
    var body: some View {
        VStack{
            ZStack{
                VideoView(videoURL: $videoUrl,isPlaying: self.$isPlaying)
                    if ShowPlayerIcon {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 20,idealWidth: 40, maxWidth: 40, minHeight: 20, idealHeight: 40, maxHeight: 40, alignment: .center)
                            .foregroundColor(Color.blue)
                    }
            }.onTapGesture {
                //update to start / stop player
                print("cardView: \($videoUrl)")
                ShowPlayerIcon.toggle()
                isPlaying.toggle()
            }
        }
}

struct VideoCard_Previews: PreviewProvider {
    static var url: URL = (Bundle.main.url(forResource: "introvid", withExtension: "mp4")!)
    
    static var previews: some View {
        VideoCard(videoUrl: .constant((url)))
    }
}
}
