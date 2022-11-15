//
//  SettingBuilder.swift
//  Amritecture
//
//  Created by amri.mc on 17/1/22.
//

import SwiftUI
import LoginService

class SettingBuilder {
  static func build(loginService: LoginService, aboutView: AboutView) -> some View {
    let viewModel = SettingViewModel(loginService: loginService)
    let view = SettingView(viewModel: viewModel, aboutView: aboutView)
    return view
  }
}
