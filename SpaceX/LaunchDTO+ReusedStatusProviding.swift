//
//  LaunchDTO+ReusedStatusProviding.swift
//  SpaceX
//
//  Created by Maciek on 07/06/2020.
//  Copyright © 2020 Maciek. All rights reserved.
//

import Foundation

extension LaunchDTO {
    var hasReusedPieces: Bool {
        return reusedStatusProviders.contains { $0.isReused }
    }
    
    private var reusedStatusProviders: [ReusedStatusProviding] {
        return rocket.firstStage.cores + rocket.secondStage.payloads
    }
}

protocol ReusedStatusProviding {
    var isReused: Bool { get }
}

extension Core: ReusedStatusProviding {
    var isReused: Bool {
        return reused ?? false
    }
}

extension Payload: ReusedStatusProviding {
    var isReused: Bool {
        return reused
    }
}
