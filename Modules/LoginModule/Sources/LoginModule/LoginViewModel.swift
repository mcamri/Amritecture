//
//  LoginViewModel.swift
//  Amritecture
//
//  Created by amri.mc on 17/1/22.
//

import Foundation
import LoginService

class LoginViewModel: ObservableObject {
  
  @Published var username: String = ""
  @Published var password: String = ""
  
  var loginService: LoginService
  
  init(loginService: LoginService) {
    self.loginService = loginService
  }
  
  func login() {
    loginService.login(username: username, password: password, result: { _ in })
  }
}
