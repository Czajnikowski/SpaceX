//
//  LaunchesPresenter.swift
//  SpaceX
//
//  Created by Maciek on 07/06/2020.
//  Copyright © 2020 Maciek. All rights reserved.
//

import View

protocol DecodedValueProviding {
    func provide<Value>(
        _ valueType: Value.Type,
        forPath path: String,
        _ handleCompletion: @escaping (Value?) -> Void
    ) where Value: Decodable
}

class LaunchesPresenter {
    private let decodedValueProvider: DecodedValueProviding
    
    private var launchDTOs: LaunchDTOS = []
    private var nextLaunchDTO: LaunchDTO?
    
    init(decodedValueProvider: DecodedValueProviding) {
        self.decodedValueProvider = decodedValueProvider
    }
}

extension LaunchesPresenter: LaunchesPresenterProtocol {
    var launcheCellStates: [LaunchCellState] {
        return launchDTOs.map(LaunchCellState.init)
    }
    
    var secondsUntilNextLaunch: Int? {
        guard let nextLaunchDTO = nextLaunchDTO else {
            return nil
        }
        
        return Int(
            Date(
                timeIntervalSince1970: TimeInterval(nextLaunchDTO.launchDateUnix)
            ).timeIntervalSinceNow
        )
    }
    
    func loadLaunches(_ completionHandler: @escaping () -> Void) {
        decodedValueProvider.provide(
            LaunchDTOS.self,
            forPath: "launches/upcoming"
        ) { [weak self] in
            self?.launchDTOs = $0 ?? []
            
            completionHandler()
        }
    }
    
    func loadNextLaunch(_ completionHandler: @escaping () -> Void) {
        decodedValueProvider.provide(
            LaunchDTO.self,
            forPath: "launches/next"
        ) { [weak self] in
                self?.nextLaunchDTO = $0
                
                completionHandler()
            }
    }
}
