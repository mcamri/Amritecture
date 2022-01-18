//
//  AmritectureApp.swift
//  Amritecture
//
//  Created by amri.mc on 14/1/22.
//

import SwiftUI
import AnimalModule
import SettingModule
import Combine
import LoginService

@main
struct AmritectureApp: App {
  
  private let appModuleContainer: AppModuleContainer = AppModuleContainer()
  
  @StateObject var routerState: RouterState = RouterState()
  @StateObject var animalRouterState: AnimalRouterState = AnimalRouterState()
  @StateObject var settingRouterState: SettingRouterState = SettingRouterState()
  @StateObject var authState: AuthState
  
  init() {
    let auth = AuthState(loginService: appModuleContainer.loginService)
    _authState = StateObject(wrappedValue: auth)
  }
  
  var body: some Scene {
    WindowGroup {
      if authState.isAuthenticated {
        ContentView(appModuleContainer: appModuleContainer)
          .environmentObject(routerState)
          .environmentObject(animalRouterState)
          .environmentObject(settingRouterState)
      } else {
        appModuleContainer.loginModule.view()
      }
    }
  }
}
