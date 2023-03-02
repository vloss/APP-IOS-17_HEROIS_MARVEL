//
//  MarvelAPI.swift
//  HeroisMarvel
//
//  Created by Vinicius Loss on 01/03/23.
//  Copyright © 2023 Eric Brito. All rights reserved.
//

import Foundation
import SwiftHash // Para acessar metodos da dependencia que foi importada ao projeto.

class MarvelAPI {
    
    static private let basePath     = "http://gateway.marvel.com/v1/public/characters"
    static private let privateKey   = "a16c78f936bae5d78116fa674e0fc5f8e0a3649a"
    static private let publicKey    = "dcc6a1ae0f6982e9750daf64f6ee4ea6"
    static private let limit        = 50
    
    
    private class func get Credentials() -> String {

        // cria um inteiro único do intervalo de 1970 até hj
        let ts = String(Date().timeIntervalSince1970)
        
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        
        return "ts=\(ts)&apikey=dcc6a1ae0f6982e9750daf64f6ee4ea6&hash=05d39f6975cb6fd3a6863912620e1b53"
    }
}
