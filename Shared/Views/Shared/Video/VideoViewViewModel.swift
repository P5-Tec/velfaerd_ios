//
//  PlayerViewmodel.swift
//  Velfaerds
//
//  Created by Patrick Saxbeck on 19/01/2022.
//

import Foundation
import AVFoundation

final class VideoViewViewModel: ObservableObject {
    let player = AVPlayer()
    //Status
    @Published var isPlaying = false
    //Progress bar, starts at 0
    @Published var currentTime: Double = .zero
    //should update view
    @Published var shouldUpdate: Bool = false
    
    func setCurrentItem(_ item: URL){
        //makes a temp AvPlayerItem and sets it as current item
        let avPlayerItem = AVPlayerItem(url: item)
        self.player.replaceCurrentItem(with: avPlayerItem)
    }
}
