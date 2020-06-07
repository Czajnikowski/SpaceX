//
//  LaunchesViewController.swift
//  SpaceX
//
//  Created by Maciek on 07/06/2020.
//  Copyright © 2020 Maciek. All rights reserved.
//

import UIKit

class LaunchesViewController: UITableViewController {
    let cellStates = (0 ... 20)
        .map { "\($0)" }
        .enumerated()
        .map {
            LaunchCellState(
                missionName: $0.element,
                missionTime: $0.element,
                missionID: $0.element,
                rocketName: $0.element,
                hasReusedPieces: $0.offset % 2 == 0
            )
        }
    
    override func viewDidLoad() {
        tableView.register(LaunchCell.self, forCellReuseIdentifier: "temp")
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return cellStates.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "temp",
            for: indexPath
        )
        
        guard let launchCell = cell as? LaunchCell else {
            return cell
        }
        
        launchCell.prepare(with: cellStates[indexPath.item])
        
        return launchCell
    }
}
