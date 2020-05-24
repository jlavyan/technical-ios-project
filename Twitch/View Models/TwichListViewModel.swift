//
//  TwichListViewModel.swift
//  Twitch
//
//  Created by Jlavyan on 5/24/20.
//  Copyright © 2020 Jlavayn. All rights reserved.
//

import RxSwift

class TwichListViewModel{
    let authRepository = AuthTokenRepository()
    
    private let disposeBag = DisposeBag()

    func  fff(){
//        authRepository.authToken()
        
//        TwitchTokenManager.shared.accessToken = "$Your_Token"
    }
    
    func load() {
        authRepository.authToken().observeOn(MainScheduler.instance)
        .subscribe(onNext: { token in
        }, onError: { error in
        })
        .disposed(by: disposeBag)
    }

}
