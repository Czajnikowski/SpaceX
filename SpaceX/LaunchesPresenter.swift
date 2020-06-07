//
//  LaunchesPresenter.swift
//  SpaceX
//
//  Created by Maciek on 07/06/2020.
//  Copyright © 2020 Maciek. All rights reserved.
//

import Alamofire
import Foundation
import View

class LaunchesPresenter {
    private var launchDTOs: LaunchDTOS = []
    private var nextLaunchDTO: LaunchDTO?
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
        AF
            .request("https://api.spacexdata.com/v3/launches/upcoming")
            .responseDecodable(of: LaunchDTOS.self) { [weak self] in
                self?.launchDTOs = $0.value ?? []
                
                completionHandler()
            }
    }
    
    func loadNextLaunch(_ completionHandler: @escaping () -> Void) {
        AF
            .request("https://api.spacexdata.com/v3/launches/next")
            .responseDecodable(of: LaunchDTO.self) { [weak self] in
                self?.nextLaunchDTO = $0.value
                
                completionHandler()
            }
    }
}
