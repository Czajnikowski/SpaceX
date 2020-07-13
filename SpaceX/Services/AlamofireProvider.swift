//
//  AlamofireProvider.swift
//  SpaceX
//
//  Created by Maciek on 08/06/2020.
//  Copyright © 2020 Maciek. All rights reserved.
//

import Alamofire

class AlamofireProvider: DecodedValueProviding {
    func provide<Value>(
        _ valueType: Value.Type,
        forPath path: String,
        _ handleCompletion: @escaping (Value?) -> Void
    ) where Value : Decodable {
        AF
            .request("https://api.spacexdata.com/v3/" + path)
            .responseDecodable(of: Value.self) {
                handleCompletion($0.value)
            }
    }
}
