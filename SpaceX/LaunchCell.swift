//
//  LaunchCell.swift
//  SpaceX
//
//  Created by Maciek on 07/06/2020.
//  Copyright © 2020 Maciek. All rights reserved.
//

import SnapKit
import UIKit

struct LaunchCellState {
    let missionName: String
    let missionTime: String
    let missionID: String
    let rocketName: String
    let hasReusedPieces: Bool
}

class LaunchCell: UITableViewCell {
    private let missionNameLabel = UILabel()
    private let missionTimeLabel = UILabel()
    private let missionIDLabel = UILabel()
    private let rocketNameLabel = UILabel()
    private let hasReusedPiecesLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        let rootStackView = UIStackView(
            arrangedSubviews: [
                missionNameLabel,
                missionTimeLabel,
                missionIDLabel,
                rocketNameLabel,
                hasReusedPiecesLabel
            ]
        )
        rootStackView.axis = .vertical
        
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
