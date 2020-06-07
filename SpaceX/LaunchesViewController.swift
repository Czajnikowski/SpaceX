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
    private var nextLaunchDTO: LaunchDTO?
    
    override func viewDidLoad() {
        tableView.register(
            LaunchCell.self,
            forCellReuseIdentifier: LaunchCell.identifier
        )
        
        nextLaunchView.prepare()
        tableView.tableHeaderView = nextLaunchView
        
        AF
            .request("https://api.spacexdata.com/v3/launches/upcoming")
            .responseDecodable(of: LaunchDTOS.self) { [weak self] in
                self?.launchDTOs = $0.value ?? []
                
                self?.tableView.reloadSections([0], with: .top)
            }
        
        AF
            .request("https://api.spacexdata.com/v3/launches/next")
            .responseDecodable(of: LaunchDTO.self) { [weak self] in
                self?.nextLaunchDTO = $0.value
                
                self?.updateCountdown()
                
                let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                    self?.updateCountdown()
                }
                
                RunLoop.main.add(timer, forMode: .common)
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
            withIdentifier: LaunchCell.identifier,
            for: indexPath
        )
        
        guard let launchCell = cell as? LaunchCell else {
            return cell
        }
        
        launchDTOs[safe: indexPath.item].map {
            launchCell.prepare(
                with: LaunchCellState($0)
            )
        }
        
        return launchCell
    }
    
    private func updateCountdown() {
        guard let nextLaunchDTO = nextLaunchDTO else {
            return
        }
        
        nextLaunchView.prepare(
            withSecondsLeft: Int(
                Date(
                    timeIntervalSince1970: TimeInterval(nextLaunchDTO.launchDateUnix)
                ).timeIntervalSinceNow
            )
        )
    }
}

extension LaunchCellState {
    init(_ launchDTO: LaunchDTO) {
        self.init(
            missionName: launchDTO.missionName,
            missionTime: launchDTO.launchDateUTC,
            missionID: launchDTO.missionID.joined(separator: ","),
            rocketName: launchDTO.rocket.rocketName.rawValue,
            hasReusedPieces: launchDTO.hasReusedPieces
        )
    }
}
