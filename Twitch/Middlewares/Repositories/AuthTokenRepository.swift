//
//  AuthRepository.swift
//  Twitch
//
//  Created by Jlavyan on 5/24/20.
//  Copyright © 2020 Jlavayn. All rights reserved.
//

import Foundation
import RxSwift

enum AuthError: Error {
    case notFound // 404
    case noData
}

class AuthTokenRepository: Repository{
    let basePath: String
    required init(basePath: String = Constant.twichBaseApi) {
        self.basePath = basePath
    }
    
    // MARK: Public methods
    /// load twich auto token
    func authToken() -> Observable<Token>{
        Observable<Token>.create { observer in
            let url = URL(string: "\(self.basePath)/token")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "content-type")
            request.httpBody = self.authBody()
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard error == nil else{
                    observer.onError(AuthError.notFound)
                    return
                }

                self.loadToken(observer: observer, data: data)
            }
            task.resume()
            return Disposables.create {
            }
        }
    }
    
    
    // MARK: Private methods
    /// Convert json to token model or continue with error
    private func loadToken(observer: AnyObserver<Token>, data: Data?){
        guard let data = data else{
            observer.onError(AuthError.noData)
            return
        }
        
        let jsonDecoder = JSONDecoder()

        guard let token = try? jsonDecoder.decode(Token.self, from: data) else{
            observer.onError(AuthError.noData)
            return
        }

        observer.onNext(token)
        observer.onCompleted()
    }
    
    /// Fetch cliend id from enviroments
    var clientId: String {
        get{
             let client = ProcessInfo.processInfo.environment["clientId"] ?? ""
             assert(client != "", "Twich clientSecret enviroment required")
             return client
        }
    }
    
    /// Authorization body
    private func authBody() -> Data?{
        var body = [String: String]()
        body["client_id"] = clientId
        body["client_secret"] = clientSecret
        body["redirect_uri"] = redirectUrl
        body["grant_type"] = "client_credentials"
        body["scope"] = "viewing_activity_read"

        let encoder = JSONEncoder()
        if let jsonData = try? encoder.encode(body) {
            return jsonData
        }

        return nil
    }


    /// Oauth 2 redirect url
    private let redirectUrl = "http://localhost"
        
    /// Fetch cliend secret from enviroments
    private var clientSecret: String {
        get{
            let secret = ProcessInfo.processInfo.environment["clientSecret"] ?? ""
            assert(secret != "", "Twich client id enviroment required")
            return secret
        }
    }

}

