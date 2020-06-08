//
//  LaunchesPresenterMock.swift
//  ViewMocks
//
//  Created by Maciek on 08/06/2020.
//  Copyright © 2020 Maciek. All rights reserved.
//

import View

class LaunchesPresenterMock: LaunchesPresenterProtocol {
    var secondsUntilNextLaunch: Int? = 200
    var launcheCellStates: [LaunchCellState] = [
        LaunchCellState(
            missionName: "Some mission",
            missionTime: "Some UTC time",
            missionID: "MissionID",
            rocketName: "Some rocket name",
            hasReusedPieces: true
        ),
        LaunchCellState(
            missionName: "Some super, super long mission",
            missionTime: "Some UTC time",
            missionID: "MissionID",
            rocketName: "Some looong, loong rocket name",
            hasReusedPieces: true
        )
    ]
    
    func loadLaunches(
        _ completionHandler: @escaping () -> Void
    ) {
        completionHandler()
    }
    
    func loadNextLaunch(
        _ completionHandler: @escaping () -> Void
    ) {
        completionHandler()
    }
}
