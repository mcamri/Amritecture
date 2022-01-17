//
//  SecondTabView.swift
//  Amritecture
//
//  Created by amri.mc on 14/1/22.
//

import SwiftUI
import LoginService

struct SettingView: View {
  
  @ObservedObject var viewModel: SettingViewModel
  
  @EnvironmentObject var routerState: SettingRouterState
  
  init(viewModel: SettingViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    VStack {
      Text("Settings")
        .padding()
      
      Button("About", action: {
        routerState.openAboutView = true
      })
        .padding()
      
      Button("Logout", action: {
        viewModel.logout()
      })
        .padding()
    }.fullScreenCover(isPresented: $routerState.openAboutView) {
      AboutBuilder.build()
    }
  }
}

struct SecondTabView_Previews: PreviewProvider {
  static var previews: some View {
    SettingView(viewModel: SettingViewModel(loginService: DefaultLoginService()))
      .environmentObject(SettingRouterState())
  }
}
