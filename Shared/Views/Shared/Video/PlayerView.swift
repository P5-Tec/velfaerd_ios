//
//  PlayerView.swift
//  Velfaerds (iOS)
//
//  Created by Patrick Saxbeck on 14/12/2021.
//

import Foundation
import AVFoundation
import AVKit
import UIKit

class PlayerView: UIView{
    private let playerLayer = AVPlayerLayer()
    private var player: AVPlayer = AVPlayer()
    private var controller: AVPlayerViewController = AVPlayerViewController()
    
    init(frame: CGRect, url: URL){
        super.init(frame: frame)
        
        player = AVPlayer(url: url)
        //player.volume = 0
        
        controller.player = player
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.backgroundColor = UIColor.black.cgColor
        
        layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    func startPlayer(){
        player.play()
    }
    
    func stopPlayer(){
        player.pause()
    }
}
