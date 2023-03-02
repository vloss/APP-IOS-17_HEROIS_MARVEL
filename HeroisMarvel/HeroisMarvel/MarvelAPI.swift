//
//  MarvelAPI.swift
//  HeroisMarvel
//
//  Created by Vinicius Loss on 01/03/23.
//  Copyright © 2023 Eric Brito. All rights reserved.
//

import Foundation
import SwiftHash // Para acessar metodos da dependencia que foi importada ao projeto.
import Alamofire // Para acessar metodos da dependencia que foi importada ao projeto.

class MarvelAPI {
    
    static private let basePath     = "https://gateway.marvel.com/v1/public/characters?"
    static private let privateKey   = "a16c78f936bae5d78116fa674e0fc5f8e0a3649a"
    static private let publicKey    = "dcc6a1ae0f6982e9750daf64f6ee4ea6"
    static private let limit        = 50
    
    class func loadHeros(name: String?, page: Int = 0, onComplete: @escaping (MarvelInfo?) -> Void){
        
        let offset = page * limit
        let startsWith: String
        
        if let name = name, !name.isEmpty{
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        } else {
            startsWith = ""
        }
        
        let url = basePath + "offset=\(offset)&limit=\(limit)&" + startsWith + getCredentials()
        print(url)

        // Sugestão da IDE pois responseJSON será descontinuado
        AF.request(url).validate().responseDecodable(of: MarvelInfo.self) { response in
            switch response.result {
                case .success:
                    onComplete(response.value)
                    print("SUCESSO:", response)
                case let .failure(error):
                    onComplete(nil)
                    print("ERRO: ", error)
            }
        }
        
//        COMO FOI MOSTRADO NO CURSO
//        AF.request(url).responseJSON { (response) in
//             //debugPrint(response)
//            guard let data = response.data,
//                  let marvelInfo = try? JSONDecoder().decode(MarvelInfo.self, from: data),
//                  marvelInfo.code == 200 else {
//                  onComplete(nil)
//                  return
//            }
//            onComplete(marvelInfo)
//        }
    }
    
    private class func getCredentials() -> String {

        // cria um inteiro único do intervalo de 1970 até hj
        let ts = String(Date().timeIntervalSince1970)
        
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}
