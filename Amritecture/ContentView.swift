//
//  ContentView.swift
//  Amritecture
//
//  Created by amri.mc on 14/1/22.
//

import SwiftUI
import AnimalModule
import SettingModule
import LoginService

struct ContentView: View {
  @EnvironmentObject var routerState: RouterState
  
  private var appModuleContainer: AppModuleContainer
  
  init(appModuleContainer: AppModuleContainer) {
    self.appModuleContainer = appModuleContainer
  }
  
  var body: some View {
    TabView(selection: $routerState.tabSelection) {
      appModuleContainer.animalModule.view()
        .tag(1)
        .tabItem {
          Image(systemName: "1.square.fill")
          Text("Animal")
        }

      appModuleContainer.settingModule.view()
        .tag(2)
        .tabItem {
          Image(systemName: "2.square.fill")
          Text("Settings")
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(appModuleContainer: AppModuleContainer())
      .environmentObject(RouterState())
  }
}
