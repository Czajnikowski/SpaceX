//
//  TypeNameIdentifierProviding.swift
//  SpaceX
//
//  Created by Maciek on 07/06/2020.
//  Copyright © 2020 Maciek. All rights reserved.
//

import UIKit

protocol TypeNameIdentifierProviding {
}

extension TypeNameIdentifierProviding {
    static var identifier: String {
        return String(describing: Self.self)
    }
}

extension UITableViewCell: TypeNameIdentifierProviding {
}
