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
    var videoURL: URL
    
    func makeUIView(context: Context) -> some UIView {
        return PlayerView(frame: .zero, url: videoURL)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    
}

struct VideoView_Previews: PreviewProvider {
    
    static var url: URL = (Bundle.main.url(forResource: "introvid", withExtension: "mp4")!)
    
    static var url2:URL = URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")!

    
    static var previews: some View{
        VideoView(videoURL: url).frame(width: nil, height: 300)
    }
}
