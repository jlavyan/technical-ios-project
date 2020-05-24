//
//  Repository.swift
//  Twitch
//
//  Created by Jlavyan on 5/24/20.
//  Copyright © 2020 Jlavayn. All rights reserved.
//

import Foundation

protocol Repository{
    var basePath: String { get }
    
    init(basePath: String) 
}
