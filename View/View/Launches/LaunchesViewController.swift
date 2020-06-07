//
//  LaunchesViewController.swift
//  SpaceX
//
//  Created by Maciek on 07/06/2020.
//  Copyright © 2020 Maciek. All rights reserved.
//

import Alamofire
import UIKit

public class LaunchesBuilder {
    public static func buildViewController(presenter: LaunchesPresenterProtocol) -> UIViewController {
        return LaunchesViewController(presenter: presenter)
    }
}

public protocol LaunchesPresenterProtocol {
    var launcheCellStates: [LaunchCellState] { get }
    var secondsUntilNextLaunch: Int? { get }
    
    func loadLaunches(_ completionHandler: @escaping () -> Void)
    func loadNextLaunch(_ completionHandler: @escaping () -> Void)
}

class LaunchesViewController: UITableViewController {
    private let presenter: LaunchesPresenterProtocol
    
    private let nextLaunchView = NextLaunchView().forAutoLayout()
    
    init(presenter: LaunchesPresenterProtocol) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        tableView.register(
            LaunchCell.self,
            forCellReuseIdentifier: LaunchCell.identifier
        )
        
        nextLaunchView.prepare()
        tableView.tableHeaderView = nextLaunchView
        
        presenter.loadLaunches { [weak self] in
            self?.tableView.reloadSections([0], with: .top)
        }
        
        presenter.loadNextLaunch { [weak self] in
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
        return presenter.launcheCellStates.count
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
        
        presenter.launcheCellStates[safe: indexPath.item].map(launchCell.prepare)
        
        return launchCell
    }
    
    private func updateCountdown() {
        nextLaunchView.prepare(withSecondsLeft: presenter.secondsUntilNextLaunch)
    }
}
