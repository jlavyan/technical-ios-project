//
//  TwichLoader.swift
//  Twitch
//
//  Created by Jlavyan on 5/25/20.
//  Copyright © 2020 Jlavayn. All rights reserved.
//

import RxSwift
import SwiftTwitch

enum TwichError: Error {
    case loadError
}


/// This cllass will contain helper methods for get twich data
class TwichLoader {
    
    func videoList() -> Observable<[VideoData]>{
        Observable<[VideoData]>.create { observer in
    
            Twitch.Videos.getVideos(videoIds: nil, userId: Constant.userid, gameId: nil) {
                switch $0 {
                case .success(let getVideosData):
                    observer.onNext(getVideosData.videoData)
                    observer.onCompleted()
                case .failure(let data, _, _):
                    if let data = data,
                        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                        let jsonDict = jsonObject as? [String: Any]{
                        print(jsonDict)
                    }
                    
                    observer.onError(TwichError.loadError)
                }
            }

            return Disposables.create {
            }
        }
    }
}
