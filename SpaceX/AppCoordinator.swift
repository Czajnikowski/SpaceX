//
//  AppCoordinator.swift
//  SpaceX
//
//  Created by Maciek on 08/06/2020.
//  Copyright © 2020 Maciek. All rights reserved.
//

import UIKit
import View

class AppCoordinator {
    private let window: UIWindow
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    func start() {
        window.rootViewController = LaunchesBuilder.buildViewController(
            presenter: LaunchesPresenter()
        )
        window.makeKeyAndVisible()
    }
}
