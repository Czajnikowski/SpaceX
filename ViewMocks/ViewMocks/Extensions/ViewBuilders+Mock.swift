//
//  ViewBuilders+Mock.swift
//  ViewMocks
//
//  Created by Maciek on 08/06/2020.
//  Copyright © 2020 Maciek. All rights reserved.
//

import View
import UIKit

extension LaunchesBuilder {
    public static func buildMockedViewController() -> UIViewController {
        return buildViewController(presenter: LaunchesPresenterMock())
    }
}
