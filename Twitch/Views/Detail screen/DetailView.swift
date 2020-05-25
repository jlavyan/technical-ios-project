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
            ZStack{
                VStack(alignment: .leading) {
                    PlayerView(video: video).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                }.padding(.top, 140)

                ActivityIndicator(isAnimating: .constant(true), style: .large)
                    .frame(width: 50, height: 50)

            }
        }.navigationBarTitle(Text("")).edgesIgnoringSafeArea([.top, .bottom])
    }
}
