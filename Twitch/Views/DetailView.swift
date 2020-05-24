//
//  DetailView.swift
//  Twitch
//
//  Created by Jlavyan on 5/24/20.
//  Copyright © 2020 Jlavayn. All rights reserved.
//

import SwiftUI
import SwiftTwitch

struct DetailView: View {

    let video: VideoData
    init(_ video: VideoData){
        self.video = video
    }
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                Text(video.title).bold().font(Font.system(size: 20)).padding(10)
                Text(video.description).padding(10)
                Spacer()
            }.padding(.top, 140)
            }.navigationBarTitle(Text("")).edgesIgnoringSafeArea([.top, .bottom])
    }
    
  
}
