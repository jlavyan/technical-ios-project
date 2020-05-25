//
//  ContentView.swift
//  Twitch
//
//  Created by Jlavyan on 5/24/20.
//  Copyright © 2020 Jlavayn. All rights reserved.
//

import SwiftUI
import SwiftTwitch

/// Navigation view
struct HomeView: View {
    var body: some View {
        NavigationView {
            VideoListView()
                .navigationBarTitle(Text("Home"))
        }
    }
}

/// Video list view
struct VideoListView: View {
    /// Model for load video list
    @ObservedObject var viewModel = VideoListModel()
    
    init() {
        /// Remove list seperator
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        ZStack {
            List {
                ForEach(self.viewModel.videos, id: \.title){ video in
                    VStack {
                        NavigationLink(
                            destination: DetailView(video)
                        ) {
                            VideoRow(video: video)
                                .onAppear {
                            }
                        }
                    }
                }
            }.onAppear {
                /// Load videos on screen appear
                self.viewModel.load()
            }
            
            ActivityIndicator()
                .frame(width: 50, height: 50).opacity(self.viewModel.videos.count == 0 ? 1.0 : 0.0)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

