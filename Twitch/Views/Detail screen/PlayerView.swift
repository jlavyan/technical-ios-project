//
//  PlayerView.swift
//  Twitch
//
//  Created by Jlavyan on 5/25/20.
//  Copyright © 2020 Jlavayn. All rights reserved.
//

import SwiftUI
import TwitchPlayer
import SwiftTwitch

/// UIView relation which must be used in SwiftUI
struct PlayerView: UIViewRepresentable {
    /// Video model must for player vide
    var video: VideoData
    
    init(video: VideoData) {
        self.video = video
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }
    
    func makeUIView(context: Context) -> UIView {
        
        let playerView = TwitchPlayer(frame: .zero)
        playerView.load(URLRequest(url: video.url))
        
        return playerView
    }
}
