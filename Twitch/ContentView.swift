//
//  ContentView.swift
//  Twitch
//
//  Created by Jlavyan on 5/24/20.
//  Copyright © 2020 Jlavayn. All rights reserved.
//

import SwiftUI
import SwiftTwitch

struct ContentView: View {
    var body: some View {
        NavigationView {
            MasterView()
                .navigationBarTitle(Text("Home"))
        }
    }
}

struct MasterView: View {
    @ObservedObject var viewModel = VideoListModel()

    var body: some View {
        List {
            ForEach(self.viewModel.videos, id: \.title){ video in
                VStack {
                    NavigationLink(
                        destination: DetailView(video)
                    ) {
                        VideoRow(video: video)
                            .onAppear {
                    }
            }}
         }
        }.onAppear {
            self.viewModel.load()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

