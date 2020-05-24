//
//  VideoRow.swift
//  Twitch
//
//  Created by Jlavyan on 5/24/20.
//  Copyright © 2020 Jlavayn. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import SwiftTwitch

/// This view  representaion of video  list item
struct VideoRow: View {
    @State var video: VideoData

    var body: some View {
        HStack {
            WebImage(url: URL(string: video.thumbnail()))
                .resizable()
                .indicator(.activity)
                .animation(.easeInOut(duration: 0.5))
                .transition(.fade)
                .scaledToFit()
                .cornerRadius(3)
                .frame(width: 44, height: 44, alignment: .center)

            Text(video.title)
                .font(Font.system(size: 15))

            Spacer()
        }
            .frame(height: 60)
    }
}



extension VideoData{
    func thumbnail(width: Int = 200, height: Int = 200) -> String{
        var replaced = thumbnailURLString.replacingOccurrences(of: "%{width}", with: "\(width)")
        replaced = replaced.replacingOccurrences(of: "%{height}", with: "\(height)")

        return replaced;
    }
}

