//
//  LaunchCell.Builder.swift
//  View
//
//  Created by Maciek on 08/06/2020.
//  Copyright © 2020 Maciek. All rights reserved.
//

import UIKit

extension LaunchCell {
    class Builder {
        static func buildMissionNameLabel() -> UILabel {
            let label = UILabel().forAutoLayout()
            
            return label
        }
        
        static func buildMissionTimeLabel() -> UILabel {
            let label = UILabel().forAutoLayout()
            
            return label
        }
        
        static func buildMissionIDLabel() -> UILabel {
            let label = UILabel().forAutoLayout()
            
            return label
        }
        
        static func buildRocketNameLabel() -> UILabel {
            let label = UILabel().forAutoLayout()
            
            return label
        }
        
        static func buildHasReusedPiecesLabel() -> UILabel {
            let label = UILabel().forAutoLayout()
            
            return label
        }
        
        static func buildRootStackView(
            missionNameLabel: UILabel,
            missionTimeLabel: UILabel,
            missionIDLabel: UILabel,
            rocketNameLabel: UILabel,
            hasReusedPiecesLabel: UILabel
        ) {
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
            
            return rootStackView
        }
    }
}
