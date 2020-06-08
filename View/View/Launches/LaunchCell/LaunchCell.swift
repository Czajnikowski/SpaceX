//
//  LaunchCell.swift
//  SpaceX
//
//  Created by Maciek on 07/06/2020.
//  Copyright © 2020 Maciek. All rights reserved.
//

import SnapKit
import UIKit

public struct LaunchCellState {
    let missionName: String
    let missionTime: String
    let missionID: String
    let rocketName: String
    let hasReusedPieces: Bool
    
    public init(
        missionName: String,
        missionTime: String,
        missionID: String,
        rocketName: String,
        hasReusedPieces: Bool
    ) {
        self.missionName = missionName
        self.missionTime = missionTime
        self.missionID = missionID
        self.rocketName = rocketName
        self.hasReusedPieces = hasReusedPieces
    }
}

class LaunchCell: UITableViewCell {
    private let missionNameLabel = Builder.buildMissionNameLabel()
    private let missionTimeLabel = Builder.buildMissionTimeLabel()
    private let missionIDLabel = Builder.buildMissionIDLabel()
    private let rocketNameLabel = Builder.buildRocketNameLabel()
    private let hasReusedPiecesLabel = Builder.buildHasReusedPiecesLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        let rootStackView = Builder.buildRootStackView(
            missionNameLabel: missionNameLabel,
            missionTimeLabel: missionTimeLabel,
            missionIDLabel: missionIDLabel,
            rocketNameLabel: rocketNameLabel,
            hasReusedPiecesLabel: hasReusedPiecesLabel
        )
        
        addSubview(rootStackView)
        rootStackView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare(with state: LaunchCellState) {
        missionNameLabel.text = state.missionName
        missionTimeLabel.text = state.missionTime
        missionIDLabel.text = state.missionID
        rocketNameLabel.text = state.rocketName
        hasReusedPiecesLabel.text = "\(state.hasReusedPieces)"
    }
}
