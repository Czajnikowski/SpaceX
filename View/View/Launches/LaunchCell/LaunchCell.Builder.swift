//
//  LaunchCell.Builder.swift
//  View
//
//  Created by Maciek on 08/06/2020.
//  Copyright © 2020 Maciek. All rights reserved.
//

import UIKit
import SnapKit

extension LaunchCell {
    class Builder {
        static func buildMissionNameLabel() -> UILabel {
            return with(UILabel().forAutoLayout()) {
                $0.font = .preferredFont(forTextStyle: .largeTitle)
                $0.snp.contentHuggingHorizontalPriority = .infinity
            }
        }
        
        static func buildMissionTimeLabel() -> UILabel {
            return with(UILabel().forAutoLayout()) {
                $0.font = .preferredFont(forTextStyle: .caption1)
                $0.textColor = .lightGray
            }
        }
        
        static func buildMissionIDLabel() -> UILabel {
            return with(UILabel().forAutoLayout()) {
                $0.font = .preferredFont(forTextStyle: .title2)
                $0.textColor = .gray
            }
        }
        
        static func buildRocketNameLabel() -> UILabel {
            return with(UILabel().forAutoLayout()) {
                $0.font = .preferredFont(forTextStyle: .footnote)
                $0.snp.contentHuggingHorizontalPriority = .infinity
            }
        }
        
        static func buildHasReusedPiecesLabel() -> UILabel {
            return with(UILabel().forAutoLayout()) {
                $0.font = .preferredFont(forTextStyle: .footnote)
                $0.textColor = .red
            }
        }
        
        static func buildRootStackView(
            missionNameLabel: UILabel,
            missionTimeLabel: UILabel,
            missionIDLabel: UILabel,
            rocketNameLabel: UILabel,
            hasReusedPiecesLabel: UILabel
        ) -> UIView {
            let missionInfoStackView = UIStackView(
                arrangedSubviews: [
                    missionNameLabel,
                    missionIDLabel
                ]
            ).forAutoLayout()
            
            with(missionInfoStackView) {
                $0.alignment = .firstBaseline
                $0.spacing = 8
            }
            
            let rocketInfoStackView = UIStackView(
                arrangedSubviews: [
                    rocketNameLabel,
                    hasReusedPiecesLabel
                ]
            ).forAutoLayout()
            
            with(rocketInfoStackView) {
                $0.alignment = .firstBaseline
                $0.spacing = 8
            }
            
            let rootStackView = UIStackView(
                arrangedSubviews: [
                    missionInfoStackView,
                    missionTimeLabel,
                    rocketInfoStackView
                ]
            )
            
            return with(rootStackView) {
                $0.axis = .vertical
                $0.spacing = 6
            }
        }
    }
}
