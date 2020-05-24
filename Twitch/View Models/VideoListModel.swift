//
//  TwichListViewModel.swift
//  Twitch
//
//  Created by Jlavyan on 5/24/20.
//  Copyright © 2020 Jlavayn. All rights reserved.
//

import RxSwift
import SwiftTwitch

/// For load video list
class VideoListModel: ObservableObject{
    @Published private(set) var videos = [VideoData]()
    
    /// This variable will halpe to get auth token
    private let authRepository = AuthTokenRepository()
    
    /// Video list loader
    private let twichLoader = TwichLoader()
    
    
    private let disposeBag = DisposeBag()
    
    /// First load auth token then video list from twitch
    func load() {
        authRepository.authToken().flatMap { (token) -> Observable<[VideoData]> in
            self.setAccessToken(token.accessToken)
            return self.twichLoader.videoList()
        }.observeOn(MainScheduler.instance)
            .subscribe(onNext: { videos in
                self.videos = videos
            }, onError: { error in
            })
            .disposed(by: disposeBag)
    }
    
    /// Call twich api for load videos
    private func loadVideos(){
    }
    
    /// Twich token client id configuration
    private func setAccessToken(_ accessToken: String){
        TwitchTokenManager.shared.accessToken = accessToken
        TwitchTokenManager.shared.clientId = authRepository.clientId
    }
}


