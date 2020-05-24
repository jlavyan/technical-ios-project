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

    private let authRepository = AuthTokenRepository()
    private let disposeBag = DisposeBag()
    
    /// First load auth token then video list from twitch
    func load() {
        authRepository.authToken().observeOn(MainScheduler.instance)
        .subscribe(onNext: { token in
            self.setAccessToken(token.accessToken)
            self.loadVideos()
        }, onError: { error in
        })
        .disposed(by: disposeBag)
    }
    
    /// Call twich api for load videos
    private func loadVideos(){
        Twitch.Videos.getVideos(videoIds: nil, userId: "60056333", gameId: nil) {
            switch $0 {
            case .success(let getVideosData):
                DispatchQueue.main.async {
                    self.videos = getVideosData.videoData
                }
            case .failure(let data, _, _):
                if let data = data,
                    // Print error data
                    let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                    let jsonDict = jsonObject as? [String: Any]{
                    print(jsonDict)
                }
            }
        }
    }
    
    /// Twich token client id configuration
    private func setAccessToken(_ accessToken: String){
        TwitchTokenManager.shared.accessToken = accessToken
        TwitchTokenManager.shared.clientId = authRepository.clientId
    }
}


