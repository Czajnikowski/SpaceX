//
//  Functions.swift
//  View
//
//  Created by Maciek on 08/06/2020.
//  Copyright © 2020 Maciek. All rights reserved.
//

import Foundation

@discardableResult func with<A>(_ a: A, _ f: (A) -> Void) -> A {
    f(a)
    return a
}
