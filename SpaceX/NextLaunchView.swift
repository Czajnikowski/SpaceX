//
//  NextLaunchView.swift
//  SpaceX
//
//  Created by Maciek on 07/06/2020.
//  Copyright © 2020 Maciek. All rights reserved.
//

import SnapKit
import UIKit

class NextLaunchView: UIView {
    private let countdownLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(countdownLabel)
        countdownLabel.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare(withSecondsLeft secondsLeft: Int? = nil) {
        countdownLabel.text = secondsLeft.map { "Only \($0)s left!" } ?? "Next launch soon!"
    }
}
