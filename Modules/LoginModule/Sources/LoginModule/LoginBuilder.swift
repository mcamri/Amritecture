//
//  LoginBuilder.swift
//  Amritecture
//
//  Created by amri.mc on 17/1/22.
//

import Foundation
import LoginService
import SwiftUI

class LoginBuilder {
  
  static func build(loginService: LoginService) -> some View {
    let viewModel = LoginViewModel(loginService: loginService)
    let view = LoginView(viewModel: viewModel)
    return view
  }
}
