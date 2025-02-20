//
//  UIView+autoLayout.swift
//  SpaceX
//
//  Created by Maciek on 07/06/2020.
//  Copyright © 2020 Maciek. All rights reserved.
//

import UIKit

extension UIView {
    @discardableResult func forAutoLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
