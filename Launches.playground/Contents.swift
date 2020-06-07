import PlaygroundSupport
import View

class LaunchesPresenterMock: LaunchesPresenterProtocol {
    var secondsUntilNextLaunch: Int? = 200
    var launcheCellStates: [LaunchCellState] = [
        LaunchCellState(
            missionName: "Some mission",
            missionTime: "Some UTC time",
            missionID: "MissionID",
            rocketName: "Some rocket name",
            hasReusedPieces: true
        )
    ]
    
    func loadLaunches(
        _ completionHandler: @escaping () -> Void
    ) {
        completionHandler()
    }
    
    func loadNextLaunch(
        _ completionHandler: @escaping () -> Void
    ) {
        completionHandler()
    }
}


PlaygroundPage.current.liveView = LaunchesBuilder.buildViewController(
    presenter: LaunchesPresenterMock()
)
