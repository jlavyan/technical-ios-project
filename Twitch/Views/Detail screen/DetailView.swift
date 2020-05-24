//
//  DetailView.swift
//  Twitch
//
//  Created by Jlavyan on 5/24/20.
//  Copyright © 2020 Jlavayn. All rights reserved.
//

import SwiftUI
import SwiftTwitch

/// Detail view which contain view player
struct DetailView: View {
    let video: VideoData
    init(_ video: VideoData){
        self.video = video
    }
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                PlayerView(video: video).frame(maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                
            }.padding(.top, 10)
        }.navigationBarTitle(Text("")).edgesIgnoringSafeArea([.top, .bottom])
    }
}


