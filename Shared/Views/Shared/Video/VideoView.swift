//
//  VideoView.swift
//  Velfaerds (iOS)
//
//  Created by Patrick Saxbeck on 14/12/2021.
//

import SwiftUI
import AVKit

struct VideoView: UIViewRepresentable {
    @Binding var videoURL: URL
    @Binding var isPlaying: Bool
    //here from videocard
    @Binding var shouldUpdate: Bool
    @ObservedObject var videoVm: VideoViewViewModel
    
    func makeUIView(context: Context) -> PlayerView {
        let view = PlayerView(frame: .zero, url: videoURL)
        view.player = videoVm.player
        videoVm.setCurrentItem(videoURL)
        return view
    }
    
    func updateUIView(_ uiView: PlayerView, context: Context) {
        if(!self.shouldUpdate){
            print("should not update")
        }else {
            print("set to update")
            self.shouldUpdate.toggle()
            videoVm.setCurrentItem(videoURL)
        }
        
        if(videoVm.isPlaying){
            uiView.startPlayer()
        } else{
            uiView.stopPlayer()
        }

    }
}



struct VideoView_Previews: PreviewProvider {
    static var url: URL = (Bundle.main.url(forResource: "introvid", withExtension: "mp4")!)
    static var tst: VideoViewViewModel = VideoViewViewModel()
    
    static var previews: some View{
        VideoView(videoURL: .constant((url)), isPlaying: .constant(false),shouldUpdate: .constant(false), videoVm: tst).frame(width: nil, height: 300)
    }
}
