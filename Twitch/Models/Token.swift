//
//  Token.swift
//  Twitch
//
//  Created by Jlavyan on 5/24/20.
//  Copyright © 2020 Jlavayn. All rights reserved.
//

import Foundation

/// Twich token declaration
class Token: Codable{
    let accessToken: String
    let expiresIn: Int
    let tokenType: String
    
    enum CodingKeys: String, CodingKey {
        case acessToken = "access_token"
        case expiresIn = "expires_in"
        case tokenType = "token_type"
    }
    
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        accessToken = try values.decode(String.self, forKey: .acessToken)
        expiresIn = try values.decode(Int.self, forKey: .expiresIn)
        tokenType = try values.decode(String.self, forKey: .tokenType)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(accessToken, forKey: .acessToken)
        try container.encode(expiresIn, forKey: .expiresIn)
        try container.encode(tokenType, forKey: .tokenType)
    }
    
    
}

