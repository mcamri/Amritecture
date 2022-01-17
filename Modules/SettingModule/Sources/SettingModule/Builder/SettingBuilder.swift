//
//  SettingBuilder.swift
//  Amritecture
//
//  Created by amri.mc on 17/1/22.
//

import SwiftUI
import LoginService

class SettingBuilder {
  static var loginService: LoginService!
  
  static func build() -> some View {
    let viewModel = SettingViewModel(loginService: loginService)
    let view = SettingView(viewModel: viewModel)
    return view
  }
}
