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

  private var aboutView: AboutView
  
  init(viewModel: SettingViewModel, aboutView: AboutView) {
    self.viewModel = viewModel
    self.aboutView = aboutView
  }

  private func startAboutView() -> some View {
    aboutView
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
      startAboutView()
    }
  }
}
