//
//  VideoView.swift
//  Velfaerds (iOS)
//
//  Created by Patrick Saxbeck on 14/12/2021.
//

import Foundation
import SwiftUI
import AVFoundation
import AVKit

struct VideoView: UIViewRepresentable {
    @Binding var videoURL: URL
    @Binding var isPlaying: Bool
    
    func makeUIView(context: Context) -> PlayerView {
        return PlayerView(frame: .zero, url: videoURL)
    }
    
    func updateUIView(_ uiView: PlayerView, context: Context) {
        print("videoview: \(videoURL)")
        if(isPlaying){
            uiView.startPlayer()
        } else{
            uiView.stopPlayer()
        }
    }
}



struct VideoView_Previews: PreviewProvider {
    static var url: URL = (Bundle.main.url(forResource: "introvid", withExtension: "mp4")!)
    
    static var previews: some View{
        VideoView(videoURL: .constant((url)), isPlaying: .constant(false)).frame(width: nil, height: 300)
    }
}
