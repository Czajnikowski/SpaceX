//
//  ViewState+DTO.swift
//  SpaceX
//
//  Created by Maciek on 07/06/2020.
//  Copyright © 2020 Maciek. All rights reserved.
//

import Foundation

extension LaunchCellState {
    init(_ launchDTO: LaunchDTO) {
        self.init(
            missionName: launchDTO.missionName,
            missionTime: launchDTO.launchDateUTC,
            missionID: launchDTO.missionID.joined(separator: ","),
            rocketName: launchDTO.rocket.rocketName.rawValue,
            hasReusedPieces: launchDTO.hasReusedPieces
        )
    }
}
