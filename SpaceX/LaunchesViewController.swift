//
//  LaunchesViewController.swift
//  SpaceX
//
//  Created by Maciek on 07/06/2020.
//  Copyright © 2020 Maciek. All rights reserved.
//

import UIKit
import Alamofire

class LaunchesViewController: UITableViewController {
    private let nextLaunchView = NextLaunchView()
    private var launchDTOs: LaunchDTOS = []
    
    override func viewDidLoad() {
        tableView.register(LaunchCell.self, forCellReuseIdentifier: "temp")
        
        nextLaunchView.prepare()
        tableView.tableHeaderView = nextLaunchView
        
        AF
            .request("https://api.spacexdata.com/v3/launches/upcoming")
            .responseDecodable(of: LaunchDTOS.self) { [weak self] in
                self?.launchDTOs = $0.value ?? []
                
                self?.tableView.reloadSections([0], with: .top)
            }
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.nextLaunchView.prepare(withSecondsLeft: Int.random(in: (0 ... 1000)))
        }
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return launchDTOs.count
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
        
        launchCell.prepare(
            with: LaunchCellState(launchDTOs[indexPath.item])
        )
        
        return launchCell
    }
}

extension LaunchCellState {
    init(_ launchDTO: LaunchDTO) {
        self.init(
            missionName: launchDTO.missionName,
            missionTime: launchDTO.launchDateUTC,
            missionID: launchDTO.missionID.joined(separator: ","),
            rocketName: launchDTO.rocket.rocketName.rawValue,
            hasReusedPieces: true
        )
    }
}
