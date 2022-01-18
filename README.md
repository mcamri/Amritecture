# Amritecture

This project is to show architecture for building iOS app with SwiftUI
1. The project use MVVM design pattern, see `AnimalListViewModel` and `SettingViewModel`
2. The View is responsible for UI and Navigation. Router and Coordinator is not used here, because it is more natural (for `SwiftUI`) to used state based navigation rather than Coordinator
3. We split functionality to modules and services. Services is used for communication with database or backend. Module is used for UI and business logic
4. For each module we split into different package and we use `Swift Package Manager` to manage dependency
5. We create all module that is necessary for running app in `AppModuleContainer` and pass the dependency to each module
6. The app show pages for `Tab`, `Navigation`, and `Fullscreen`
