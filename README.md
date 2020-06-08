# SpaceX

[Coding challeng for Mav Farm](https://github.com/mavfarm/coding-challenges/blob/master/iOS/Mav_Farm_iOS_Coding_Challenge.pdf).

## How to use?

Use `SpaceX.xcworkspace` to open the project, wait for SMP to resolve packages and you're ready to go.

## How did I do?

It was a pretty challenging task in fact as we agreed that it should take no more than 2-3 hrs. To use my time to the fullest I divided it into three ~1 h sprints:

1. Core functionality
2. Improving underlying code abstractions
3. UI related polishes

I have implemented core functionalities with the help of `SnapKit` and `Alamofire` and used Swift Package Manager as a dependency management tool.

To save time I used [quicktype](https://quicktype.io/) to generate DTO structs.
I didn't spend too much time (~25 mins) polishing and designing fancy animations, but instead I focused on developing facilities that make UI development fast and robust (check `Launches.playground` and `ViewMocksTests` scheme). I also invested in decoupling of the `View`, `ViewMocks`, and a service-layer abstraction decoupled at the main target level via `DecodedValueProviding`.

## What could have been done better?

There is plenty of things that can be done better here. I'm fine to discuss them in the next stage of the interview process :wink:

Thanks again for considering me as a candidate and inviting me to the coding challenge @emelt. I'm looking forward to your feedback soon!
